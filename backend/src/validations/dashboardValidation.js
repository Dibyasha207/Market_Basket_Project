const { query, validationResult } = require("express-validator");

/**
 * DASHBOARD VALIDATION
 * -------------------------------------------------------------------------
 * express-validator chains + a shared error handler. No business logic.
 * -------------------------------------------------------------------------
 */

const DATE_REGEX_MESSAGE = "must be a valid date in YYYY-MM-DD format";

/**
 * validateDashboardDateRange
 * Validates start_date, end_date, and ensures start_date <= end_date.
 * Used by routes that require a mandatory date range (overview, revenue,
 * orders-vs-customers, top-categories).
 */
const validateDashboardDateRange = [
  query("start_date")
    .optional()
    .isISO8601()
    .withMessage(`start_date ${DATE_REGEX_MESSAGE}`),

  query("end_date")
    .optional()
    .isISO8601()
    .withMessage(`end_date ${DATE_REGEX_MESSAGE}`)
    .bail()
    .custom((endDate, { req }) => {
      const { start_date } = req.query;
      if (start_date && new Date(endDate) < new Date(start_date)) {
        throw new Error("end_date must be greater than or equal to start_date");
      }
      return true;
    }),
];

/**
 * validateRevenueQuery
 * Extends the date range validation with an optional granularity check.
 * Used by /overview and /revenue-over-time.
 */
const validateRevenueQuery = [
  ...validateDashboardDateRange,

  query("granularity")
    .optional()
    .isIn(["daily", "weekly", "monthly"])
    .withMessage("granularity must be one of: daily, weekly, monthly"),
];

/**
 * validateAlertsQuery
 * Validates the optional limit param used by /alerts and /insights.
 */
const validateAlertsQuery = [
  query("limit")
    .optional()
    .isInt({ min: 1, max: 50 })
    .withMessage("limit must be an integer between 1 and 50")
    .toInt(),
];

/**
 * handleValidationErrors
 * Shared middleware that inspects express-validator results and returns
 * a consistent 400 response if any validation failed.
 */
function handleValidationErrors(req, res, next) {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    return res.status(400).json({
      success: false,
      message: "Dashboard request validation failed.",
      errors: errors.array().map((err) => ({
        field: err.path,
        message: err.msg,
        value: err.value,
      })),
    });
  }

  return next();
}

module.exports = {
  validateDashboardDateRange,
  validateRevenueQuery,
  validateAlertsQuery,
  handleValidationErrors,
};