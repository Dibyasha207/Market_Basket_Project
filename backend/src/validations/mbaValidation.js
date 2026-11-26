const { query, validationResult } = require("express-validator");

/**
 * Validation rules for MBA endpoints
 * All params are optional
 */
const mbaValidationRules = [
  // Dates
  query("startDate")
    .optional()
    .isISO8601()
    .withMessage("startDate must be a valid ISO8601 date"),

  query("endDate")
    .optional()
    .isISO8601()
    .withMessage("endDate must be a valid ISO8601 date"),

  // Filters
  query("country")
    .optional()
    .isString()
    .withMessage("country must be a string"),

  query("category")
    .optional()
    .isString()
    .withMessage("category must be a string"),

  query("search")
    .optional()
    .isString()
    .withMessage("search must be a string"),

  // Mining parameters
  query("minSupport")
    .optional()
    .isFloat({ min: 0, max: 1 })
    .withMessage("minSupport must be a number between 0 and 1")
    .toFloat(),

  query("minConfidence")
    .optional()
    .isFloat({ min: 0, max: 1 })
    .withMessage("minConfidence must be a number between 0 and 1")
    .toFloat(),

  // Lift filters
  query("liftMin")
    .optional()
    .isFloat()
    .withMessage("liftMin must be a number")
    .toFloat(),

  query("liftMax")
    .optional()
    .isFloat()
    .withMessage("liftMax must be a number")
    .toFloat(),

  // Pagination
  query("page")
    .optional()
    .isInt({ min: 1 })
    .withMessage("page must be an integer >= 1")
    .toInt(),

  query("limit")
    .optional()
    .isInt({ min: 1 })
    .withMessage("limit must be an integer >= 1")
    .toInt(),
];

/**
 * Middleware to run validation and return 400 on error
 */
const validateMbaFilters = [
  ...mbaValidationRules,
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        success: false,
        errors: errors.array()
      });
    }
    next();
  }
];

module.exports = {
  validateMbaFilters
};