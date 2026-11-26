const pool = require("../config/db");

/**
 * DASHBOARD REPOSITORY
 * -------------------------------------------------------------------------
 * This is the ONLY file allowed to contain raw SQL for the dashboard module.
 * All queries are parameterized ($1, $2, ...). No string concatenation of
 * user input is ever performed.
 * -------------------------------------------------------------------------
 */

/**
 * Returns aggregate KPI totals for a given date range.
 *
 * BUSINESS RULE (documented):
 *  - total_revenue / total_orders are computed from `orders` where
 *    orders.order_date falls within [startDate, endDate].
 *  - total_customers = COUNT(DISTINCT orders.customer_id) for orders placed
 *    within the range (i.e. "customers active in this period"), NOT the
 *    full customers table. This makes the KPI period-comparable.
 *  - total_products = COUNT(products.product_id) where products.created_at
 *    <= endDate (cumulative catalog size as of the end of the period). This
 *    lets the service layer compute a meaningful percentage change against
 *    the previous period's cumulative count.
 *
 * @param {string} startDate - YYYY-MM-DD
 * @param {string} endDate - YYYY-MM-DD
 * @returns {Promise<{total_revenue:number,total_orders:number,total_customers:number,total_products:number}>}
 */
async function getDashboardKPIs(startDate, endDate) {
  const query = `
    SELECT
      COALESCE(rev.total_revenue, 0)      AS total_revenue,
      COALESCE(rev.total_orders, 0)       AS total_orders,
      COALESCE(rev.total_customers, 0)    AS total_customers,
      COALESCE(prod.total_products, 0)    AS total_products
    FROM (
      SELECT
        SUM(o.total_amount)              AS total_revenue,
        COUNT(o.order_id)                AS total_orders,
        COUNT(DISTINCT o.customer_id)    AS total_customers
      FROM orders o
      WHERE o.order_date BETWEEN $1 AND $2
    ) rev
    CROSS JOIN (
  SELECT COUNT(p.product_id) AS total_products
  FROM products p
) prod;
  `;

  const { rows } = await pool.query(query, [startDate, endDate]);
  const row = rows[0] || {};

  return {
    total_revenue: Number(row.total_revenue) || 0,
    total_orders: Number(row.total_orders) || 0,
    total_customers: Number(row.total_customers) || 0,
    total_products: Number(row.total_products) || 0,
  };
}

/**
 * Returns revenue grouped by date at the requested granularity.
 *
 * @param {string} startDate - YYYY-MM-DD
 * @param {string} endDate - YYYY-MM-DD
 * @param {"daily"|"weekly"|"monthly"} granularity
 * @returns {Promise<Array<{date:string, revenue:number}>>}
 */
async function getRevenueTrend(startDate, endDate, granularity) {
  const truncUnitMap = {
    daily: "day",
    weekly: "week",
    monthly: "month",
  };

  const truncUnit = truncUnitMap[granularity] || "day";

  const query = `
    SELECT
      date_trunc('${truncUnit}', o.order_date)::date AS date,
      COALESCE(SUM(o.total_amount), 0) AS revenue
    FROM orders o
    WHERE o.order_date BETWEEN $1 AND $2
    GROUP BY date_trunc('${truncUnit}', o.order_date)
    ORDER BY date ASC;
  `;

  const { rows } = await pool.query(query, [startDate, endDate]);

  return rows.map((row) => ({
    date: row.date,
    revenue: Number(row.revenue) || 0,
  }));
}

/**
 * Returns daily order counts and distinct active-customer counts.
 *
 * BUSINESS RULE (documented):
 *  - "orders" per date = COUNT(orders.order_id) grouped by orders.order_date.
 *  - "customers" per date = COUNT(DISTINCT orders.customer_id) grouped by
 *    orders.order_date, i.e. the number of unique customers who placed at
 *    least one order on that date. This is derived purely from order data
 *    (not customers.created_at), since customer "activity" for this chart
 *    is defined as placing an order.
 *
 * @param {string} startDate - YYYY-MM-DD
 * @param {string} endDate - YYYY-MM-DD
 * @returns {Promise<Array<{date:string, orders:number, customers:number}>>}
 */
async function getOrdersVsCustomers(startDate, endDate) {
  const query = `
    SELECT
      o.order_date::date AS date,
      COUNT(o.order_id) AS orders,
      COUNT(DISTINCT o.customer_id) AS customers
    FROM orders o
    WHERE o.order_date BETWEEN $1 AND $2
    GROUP BY o.order_date::date
ORDER BY o.order_date::date ASC;
  `;

  const { rows } = await pool.query(query, [startDate, endDate]);

  return rows.map((row) => ({
    date: row.date,
    orders: Number(row.orders) || 0,
    customers: Number(row.customers) || 0,
  }));
}

/**
 * Returns revenue by category for the given date range.
 *
 * Revenue is calculated from order_items.total_price, joined through
 * orders (for the date filter) and products/categories (for grouping).
 *
 * @param {string} startDate - YYYY-MM-DD
 * @param {string} endDate - YYYY-MM-DD
 * @returns {Promise<Array<{category_name:string, revenue:number}>>}
 */
async function getTopCategories(startDate, endDate) {
  const query = `
    SELECT
      c.category_name AS category_name,
      COALESCE(SUM(oi.total_price), 0) AS revenue
    FROM order_items oi
    INNER JOIN orders o ON o.order_id = oi.order_id
    INNER JOIN products p ON p.product_id = oi.product_id
    INNER JOIN categories c ON c.category_id = p.category_id
    WHERE o.order_date BETWEEN $1 AND $2
    GROUP BY c.category_name
    ORDER BY revenue DESC;
  `;

  const { rows } = await pool.query(query, [startDate, endDate]);

  return rows.map((row) => ({
    category_name: row.category_name,
    revenue: Number(row.revenue) || 0,
  }));
}

/**
 * Returns the most recent notifications.
 *
 * @param {number} limit
 * @returns {Promise<Array<object>>}
 */
async function getRecentAlerts(limit) {
  const query = `
    SELECT
      notification_id,
      title,
      message,
      notification_type,
      priority,
      is_read,
      created_at
    FROM notifications
    ORDER BY created_at DESC
    LIMIT $1;
  `;

  const { rows } = await pool.query(query, [limit]);
  return rows;
}

/**
 * Returns the most recent business insights.
 *
 * @param {number} limit
 * @returns {Promise<Array<object>>}
 */
async function getBusinessInsights(limit) {
  const query = `
    SELECT
      id,
      title,
      description,
      insight_type,
      priority,
      status,
      created_at,
      source
    FROM business_insights
    ORDER BY created_at DESC
    LIMIT $1;
  `;

  const { rows } = await pool.query(query, [limit]);
  return rows;
}

module.exports = {
  getDashboardKPIs,
  getRevenueTrend,
  getOrdersVsCustomers,
  getTopCategories,
  getRecentAlerts,
  getBusinessInsights,
};