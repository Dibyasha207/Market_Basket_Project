const db = require('../config/db');

/**
 * Fetch transactions with items for MBA
 * Each row = 1 order with array of product_ids
 * Filters applied before aggregation
 */
const getTransactionsWithFilters = async (filters = {}) => {
  const { startDate, endDate, country, category } = filters;

  const values = [];
  let paramIndex = 1;

  let whereClauses = [];

  if (startDate) {
    whereClauses.push(`o.order_date >= $${paramIndex++}`);
    values.push(startDate);
  }

  if (endDate) {
    // Fix: exclusive next-day boundary to include full endDate
    whereClauses.push(`o.order_date < $${paramIndex++}`);
    values.push(endDate); // caller should pass YYYY-MM-DD, we add 1 day in SQL
    values[values.length - 1] = new Date(new Date(endDate).getTime() + 24 * 60 * 60 * 1000).toISOString().split('T')[0];
  }

  if (country) {
    whereClauses.push(`c.country = $${paramIndex++}`);
    values.push(country);
  }

  // Fix: category filter should identify orders, not filter items in basket
  // We use EXISTS to find orders that have at least 1 product in the category
  if (category) {
    whereClauses.push(`EXISTS (
      SELECT 1 FROM order_items oi2
      JOIN products p2 ON oi2.product_id = p2.product_id
      JOIN categories cat2 ON p2.category_id = cat2.category_id
      WHERE oi2.order_id = o.order_id AND cat2.category_name = $${paramIndex++}
    )`);
    values.push(category);
  }

  // order_status filter NOT applied. Values not confirmed yet.

  const whereSQL = whereClauses.length > 0? `WHERE ${whereClauses.join(' AND ')}` : '';

  const query = `
    SELECT
      o.order_id AS "transactionId",
      ARRAY_AGG(oi.product_id ORDER BY oi.product_id) AS "items"
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    ${whereSQL}
    GROUP BY o.order_id
  `;
  // Correction 1: Removed HAVING COUNT(oi.product_id) > 1 to keep single-item orders

  const result = await db.query(query, values);
  return result.rows;
};

/**
 * Get all products with names and category_id
 * Used for mapping product_id -> product_name
 */
const getAllProducts = async () => {
  const query = `
    SELECT
      p.product_id AS "productId",
      p.product_name AS "productName",
      p.category_id AS "categoryId"
    FROM products p
  `;
  const result = await db.query(query);
  return result.rows;
};

/**
 * Get all categories
 * Used for filter dropdown
 */
const getAllCategories = async () => {
  const query = `
    SELECT
      category_id AS "categoryId",
      category_name AS "categoryName"
    FROM categories
    ORDER BY category_name ASC
  `;
  const result = await db.query(query);
  return result.rows;
};

/**
 * Get all countries
 * Used for filter dropdown
 */
const getAllCountries = async () => {
  const query = `
    SELECT DISTINCT country
    FROM customers
    WHERE country IS NOT NULL AND country!= ''
    ORDER BY country ASC
  `;
  const result = await db.query(query);
  return result.rows;
};

/**
 * Get date range from orders
 * Used for filter defaults
 */
const getDateRange = async () => {
  const query = `
    SELECT
      MIN(order_date) AS "minDate",
      MAX(order_date) AS "maxDate"
    FROM orders
  `;
  const result = await db.query(query);
  return result.rows[0];
};

module.exports = {
  getTransactionsWithFilters,
  getAllProducts,
  getAllCategories,
  getAllCountries,
  getDateRange
};