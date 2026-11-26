const express = require("express");
const router = express.Router();

const {
  getForecasts,
  getForecastOverview,
} = require("../controllers/forecastController");

router.get("/", (req, res, next) => {
  if (req.query.type === "monthly" || req.query.type === "raw") {
    return getForecasts(req, res, next);
  }
  return getForecastOverview(req, res, next);
});

router.get("/overview", getForecastOverview);
router.get("/monthly", getForecasts);

module.exports = router;