const dashboardRepository = require("../repositories/dashboardRepository");

/**
 * DASHBOARD SERVICE
 * -------------------------------------------------------------------------
 * Contains business logic ONLY. No SQL. Normalizes repository output,
 * computes percentage changes, and shapes the final response objects
 * consumed by the controller layer.
 * -------------------------------------------------------------------------
 */

const MS_PER_DAY = 24 * 60 * 60 * 1000;

/**
 * Given a startDate/endDate pair, returns the immediately preceding period
 * of equal length, used to calculate percentage-change KPIs.
 *
 * Example: current = 2025-05-08..2025-05-14 (7 days)
 *          previous = 2025-05-01..2025-05-07 (7 days)
 */
function getPreviousPeriod(startDate, endDate) {
  const start = new Date(startDate);
  const end = new Date(endDate);

  const durationMs = end.getTime() - start.getTime();
  const previousEnd = new Date(start.getTime() - MS_PER_DAY);
  const previousStart = new Date(previousEnd.getTime() - durationMs);

  const toISODate = (date) => date.toISOString().split("T")[0];

  return {
    previousStartDate: toISODate(previousStart),
    previousEndDate: toISODate(previousEnd),
  };
}

/**
 * Calculates percentage change from previous -> current.
 * Handles divide-by-zero safely.
 */
function calculatePercentageChange(current, previous) {
  const currentValue = Number(current) || 0;
  const previousValue = Number(previous) || 0;

  if (previousValue === 0) {
    return currentValue === 0 ? 0 : 100;
  }

  const change = ((currentValue - previousValue) / previousValue) * 100;
  return Math.round(change * 100) / 100;
}

/**
 * Builds a KPI object with value + percentage change + a simple
 * sparkline-friendly trend array (derived from the two data points
 * we have: previous total and current total).
 */
function buildKPI(currentValue, previousValue) {
  return {
    value: Number(currentValue) || 0,
    change_percentage: calculatePercentageChange(currentValue, previousValue),
    trend: [Number(previousValue) || 0, Number(currentValue) || 0],
  };
}

/**
 * Normalizes granularity input, defaulting to "daily" for anything unknown.
 */
function normalizeGranularity(granularity) {
  const allowed = ["daily", "weekly", "monthly"];
  return allowed.includes(granularity) ? granularity : "daily";
}

/**
 * getDashboardOverview
 * Orchestrates all dashboard data for the executive dashboard view.
 *
 * @param {object} params
 * @param {string} params.startDate
 * @param {string} params.endDate
 * @param {string} [params.granularity="daily"]
 * @returns {Promise<object>} clean dashboard response object
 */
async function getDashboardOverview({ startDate, endDate, granularity = "daily" }) {
  const safeGranularity = normalizeGranularity(granularity);
  const { previousStartDate, previousEndDate } = getPreviousPeriod(startDate, endDate);

  const [
    currentKPIs,
    previousKPIs,
    revenueTrend,
    ordersVsCustomers,
    topCategories,
    recentAlerts,
    businessInsights,
  ] = await Promise.all([
    dashboardRepository.getDashboardKPIs(startDate, endDate),
    dashboardRepository.getDashboardKPIs(previousStartDate, previousEndDate),
    dashboardRepository.getRevenueTrend(startDate, endDate, safeGranularity),
    dashboardRepository.getOrdersVsCustomers(startDate, endDate),
    dashboardRepository.getTopCategories(startDate, endDate),
    dashboardRepository.getRecentAlerts(10),
    dashboardRepository.getBusinessInsights(10),
  ]);

  const totalCategoryRevenue = topCategories.reduce((sum, cat) => sum + cat.revenue, 0);

  const normalizedTopCategories = topCategories.map((cat) => ({
    category_name: cat.category_name,
    revenue: cat.revenue,
    revenue_share_percentage:
      totalCategoryRevenue > 0
        ? Math.round((cat.revenue / totalCategoryRevenue) * 10000) / 100
        : 0,
  }));

  return {
    kpis: {
      total_revenue: buildKPI(currentKPIs.total_revenue, previousKPIs.total_revenue),
      total_orders: buildKPI(currentKPIs.total_orders, previousKPIs.total_orders),
      total_customers: buildKPI(currentKPIs.total_customers, previousKPIs.total_customers),
      total_products: buildKPI(currentKPIs.total_products, previousKPIs.total_products),
    },
    revenue_over_time: {
      granularity: safeGranularity,
      series: revenueTrend,
    },
    orders_vs_customers: ordersVsCustomers,
    top_categories: normalizedTopCategories,
    recent_alerts: recentAlerts,
    business_insights: businessInsights,
    date_range: { start_date: startDate, end_date: endDate },
  };
}

/**
 * getRevenueOverTime
 * Returns the revenue trend series only, with normalized granularity.
 */
async function getRevenueOverTime({ startDate, endDate, granularity = "daily" }) {
  const safeGranularity = normalizeGranularity(granularity);
  const series = await dashboardRepository.getRevenueTrend(startDate, endDate, safeGranularity);

  return {
    granularity: safeGranularity,
    series,
  };
}

/**
 * getOrdersVsCustomers
 * Returns the orders-vs-customers dual series for the given date range.
 */
async function getOrdersVsCustomers({ startDate, endDate }) {
  return dashboardRepository.getOrdersVsCustomers(startDate, endDate);
}

/**
 * getTopCategories
 * Returns categories ranked by revenue with computed share percentage.
 */
async function getTopCategories({ startDate, endDate }) {
  const categories = await dashboardRepository.getTopCategories(startDate, endDate);
  const totalRevenue = categories.reduce((sum, cat) => sum + cat.revenue, 0);

  return categories.map((cat) => ({
    category_name: cat.category_name,
    revenue: cat.revenue,
    revenue_share_percentage:
      totalRevenue > 0 ? Math.round((cat.revenue / totalRevenue) * 10000) / 100 : 0,
  }));
}

/**
 * getRecentAlerts
 * Returns the most recent notifications, defaulting to 10 if no limit given.
 */
async function getRecentAlerts({ limit = 10 }) {
  return dashboardRepository.getRecentAlerts(limit);
}

/**
 * getBusinessInsights
 * Returns the most recent business insights, defaulting to 10 if no limit given.
 */
async function getBusinessInsights({ limit = 10 }) {
  return dashboardRepository.getBusinessInsights(limit);
}

module.exports = {
  getDashboardOverview,
  getRevenueOverTime,
  getOrdersVsCustomers,
  getTopCategories,
  getRecentAlerts,
  getBusinessInsights,
};