const dashboardService = require("../services/dashboardService");

/**
 * DASHBOARD CONTROLLER
 * -------------------------------------------------------------------------
 * No SQL, no business logic. Reads query params, calls the service layer,
 * and returns a consistent JSON envelope. Never exposes stack traces or
 * raw DB errors to the client.
 * -------------------------------------------------------------------------
 */

function sendSuccess(res, message, data) {
  return res.status(200).json({
    success: true,
    message,
    data,
  });
}

function sendServerError(res, message = "Something went wrong while processing your request.") {
  return res.status(500).json({
    success: false,
    message,
  });
}

/**
 * GET /api/dashboard/overview
 */
async function getDashboardOverview(req, res) {
  try {
    const { start_date, end_date, granularity } = req.query;

    const data = await dashboardService.getDashboardOverview({
      startDate: start_date || "2026-05-01",
      endDate: end_date || "2026-08-01",
      granularity,
    });

    return sendSuccess(res, "Dashboard overview fetched successfully.", data);
  } catch (error) {
    console.error("getDashboardOverview error:", error);
    return sendServerError(res, "Failed to fetch dashboard overview.");
  }
}

/**
 * GET /api/dashboard/revenue-over-time
 */
async function getRevenueOverTime(req, res) {
  try {
    const { start_date, end_date, granularity } = req.query;

    const data = await dashboardService.getRevenueOverTime({
      startDate: start_date || "2026-05-01",
      endDate: end_date || "2026-08-01",
      granularity,
    });

    return sendSuccess(res, "Revenue trend fetched successfully.", data);
  } catch (error) {
    console.error("getRevenueOverTime error:", error);
    return sendServerError(res, "Failed to fetch revenue trend.");
  }
}

/**
 * GET /api/dashboard/orders-vs-customers
 */
async function getOrdersVsCustomers(req, res) {
  try {
    const { start_date, end_date } = req.query;

    const data = await dashboardService.getOrdersVsCustomers({
      startDate: start_date || "2026-05-01",
      endDate: end_date || "2026-08-01",
    });

    return sendSuccess(res, "Orders vs customers fetched successfully.", data);
  } catch (error) {
    console.error("getOrdersVsCustomers error:", error);
    return sendServerError(res, "Failed to fetch orders vs customers.");
  }
}

/**
 * GET /api/dashboard/top-categories
 */
async function getTopCategories(req, res) {
  try {
    const { start_date, end_date } = req.query;

    const data = await dashboardService.getTopCategories({
      startDate: start_date || "2026-05-01",
      endDate: end_date || "2026-08-01",
    });

    return sendSuccess(res, "Top categories fetched successfully.", data);
  } catch (error) {
    console.error("getTopCategories error:", error);
    return sendServerError(res, "Failed to fetch top categories.");
  }
}

/**
 * GET /api/dashboard/alerts
 */
async function getRecentAlerts(req, res) {
  try {
    const { limit } = req.query;

    const data = await dashboardService.getRecentAlerts({
      limit: limit ? Number(limit) : undefined,
    });

    return sendSuccess(res, "Recent alerts fetched successfully.", data);
  } catch (error) {
    console.error("getRecentAlerts error:", error);
    return sendServerError(res, "Failed to fetch recent alerts.");
  }
}

/**
 * GET /api/dashboard/insights
 */
async function getBusinessInsights(req, res) {
  try {
    const { limit } = req.query;

    const data = await dashboardService.getBusinessInsights({
      limit: limit ? Number(limit) : undefined,
    });

    return sendSuccess(res, "Business insights fetched successfully.", data);
  } catch (error) {
    console.error("getBusinessInsights error:", error);
    return sendServerError(res, "Failed to fetch business insights.");
  }
}

module.exports = {
  getDashboardOverview,
  getRevenueOverTime,
  getOrdersVsCustomers,
  getTopCategories,
  getRecentAlerts,
  getBusinessInsights,
};