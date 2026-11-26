const express = require("express");
const router = express.Router();

const mbaController = require("../controllers/mbaController");
const { validateMbaFilters } = require("../validations/mbaValidation");
const { authMiddleware } = require("../middlewares/authMiddleware");

/**
 * MBA Routes - Pair-based Association Rule Mining (V1)
 * All routes require authentication and validation
 */

/**
 * GET /kpis
 * Returns KPI cards for MBA dashboard
 */
router.get(
  "/kpis",
  authMiddleware,
  validateMbaFilters,
  mbaController.getKPIs
);

/**
 * GET /top-combinations
 * Returns top 2-item product combinations by support
 */
router.get(
  "/top-combinations",
  authMiddleware,
  validateMbaFilters,
  mbaController.getTopCombinations
);

/**
 * GET /support-confidence
 * Returns data for Support vs Confidence scatter chart
 */
router.get(
  "/support-confidence",
  authMiddleware,
  validateMbaFilters,
  mbaController.getSupportConfidence
);

/**
 * GET /lift-distribution
 * Returns lift distribution histogram data
 */
router.get(
  "/lift-distribution",
  authMiddleware,
  validateMbaFilters,
  mbaController.getLiftDistribution
);

/**
 * GET /product-network
 * Returns nodes and edges for product association network graph
 */
router.get(
  "/product-network",
  authMiddleware,
  validateMbaFilters,
  mbaController.getProductNetwork
);

router.get(
  "/network",
  authMiddleware,
  validateMbaFilters,
  mbaController.getProductNetwork
);

/**
 * GET /rules
 * Returns paginated association rules with filters
 */
router.get(
  "/rules",
  authMiddleware,
  validateMbaFilters,
  mbaController.getRules
);

/**
 * GET /bundles
 * Returns recommended product bundles
 */
router.get(
  "/bundles",
  authMiddleware,
  validateMbaFilters,
  mbaController.getBundles
);

/**
 * GET /insights
 * Returns business insights - currently placeholder
 */
router.get(
  "/insights",
  authMiddleware,
  validateMbaFilters,
  mbaController.getInsights
);

/**
 * GET /filters
 * Returns metadata for filters: countries, categories, date range
 */
router.get(
  "/filters",
  authMiddleware,
  validateMbaFilters,
  mbaController.getFilters
);

module.exports = router;