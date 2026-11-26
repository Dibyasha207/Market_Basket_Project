const express = require("express");

const {
  getDashboardOverview,
  getRevenueOverTime,
  getOrdersVsCustomers,
  getTopCategories,
  getRecentAlerts,
  getBusinessInsights,
} = require("../controllers/dashboardController");

const { authMiddleware } = require("../middlewares/authMiddleware");

const {
  validateDashboardDateRange,
  validateRevenueQuery,
  validateAlertsQuery,
  handleValidationErrors,
} = require("../validations/dashboardValidation");

const router = express.Router();

// GET /api/dashboard
router.get(
  "/",
  authMiddleware,
  validateRevenueQuery,
  handleValidationErrors,
  getDashboardOverview
);

// GET /api/dashboard/overview
router.get(
  "/overview",
  authMiddleware,
  validateRevenueQuery,
  handleValidationErrors,
  getDashboardOverview
);

// GET /api/dashboard/revenue-over-time
router.get(
  "/revenue-over-time",
  authMiddleware,
  validateRevenueQuery,
  handleValidationErrors,
  getRevenueOverTime
);

// GET /api/dashboard/orders-vs-customers
router.get(
  "/orders-vs-customers",
  authMiddleware,
  validateDashboardDateRange,
  handleValidationErrors,
  getOrdersVsCustomers
);

// GET /api/dashboard/top-categories
router.get(
  "/top-categories",
  authMiddleware,
  validateDashboardDateRange,
  handleValidationErrors,
  getTopCategories
);

// GET /api/dashboard/alerts
router.get(
  "/alerts",
  authMiddleware,
  validateAlertsQuery,
  handleValidationErrors,
  getRecentAlerts
);

// GET /api/dashboard/insights
router.get(
  "/insights",
  authMiddleware,
  validateAlertsQuery,
  handleValidationErrors,
  getBusinessInsights
);

module.exports = router;