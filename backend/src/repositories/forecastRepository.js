const pool = require("../config/db");

const findAll = async () => {
  const result = await pool.query(
    "SELECT * FROM sales_forecasts ORDER BY time_index ASC"
  );
  return result.rows;
};

const getForecastOverview = async (range = "7d") => {
  // Database records
  const dbForecasts = await findAll();
  
  // Model info from forecast_models or defaults
  const modelRes = await pool.query("SELECT * FROM forecast_models WHERE is_active = true LIMIT 1;");
  const modelRow = modelRes.rows[0] || {};

  const modelInfo = {
    modelUsed: modelRow.model_name || "Prophet",
    modelVersion: modelRow.model_version || "1.0",
    trainedOn: `${modelRow.training_data_days || 90} days of historical data`,
    lastUpdated: modelRow.trained_at ? new Date(modelRow.trained_at).toLocaleString("en-US", { month: "short", day: "numeric", year: "numeric", hour: "2-digit", minute: "2-digit" }) : "May 11, 2025 10:30 PM",
    accuracy: modelRow.accuracy_percentage || 91.2,
    mape: modelRow.mape || 8.8,
  };

  const kpis = {
    totalForecastedRevenue: 285430,
    projectedGrowth: 12.6,
    avgDailyRevenue: 40776,
    avgDailyGrowth: 3.2,
    forecastAccuracy: 91.2,
  };

  const timeSeries = [
    { date: "May 12", historical: 34210, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 13", historical: 37850, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 14", historical: 35600, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 15", historical: 42100, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 16", historical: null, forecasted: 54780, lowerBound: 51200, upperBound: 58360 },
    { date: "May 17", historical: null, forecasted: 41250, lowerBound: 38500, upperBound: 44000 },
    { date: "May 18", historical: null, forecasted: 39640, lowerBound: 36800, upperBound: 42480 },
  ];

  const categoryForecast = [
    { category: "Beverages", historical: 85630, forecast: 98780, growth: 13.5, trend: [80, 85, 90, 92, 98] },
    { category: "Snacks", historical: 62120, forecast: 71540, growth: 15.2, trend: [58, 62, 65, 68, 71] },
    { category: "Dairy", historical: 45780, forecast: 51230, growth: 11.9, trend: [43, 45, 47, 49, 51] },
    { category: "Bakery", historical: 38910, forecast: 42780, growth: 10.2, trend: [36, 38, 39, 41, 42] },
    { category: "Others", historical: 24500, forecast: 25100, growth: 2.4, trend: [24, 24.5, 24.8, 25, 25.1] },
  ];

  const summary = {
    forecastPeriod: "May 12 - May 18, 2025",
    totalForecastedRevenue: "$285,430",
    highestForecastedDay: "May 16, 2025 ($54,780)",
    lowestForecastedDay: "May 12, 2025 ($34,210)",
    confidenceInterval: "95%",
  };

  const insights = [
    "Overall revenue is expected to increase by 12.6% in the next 7 days.",
    "May 16, 2025 is expected to be the highest revenue day.",
    "Beverages category will drive the most growth (13.5%).",
    "Weekend sales (May 17-18) are expected to dip slightly.",
    "Consider increasing inventory for Snacks and Beverages.",
  ];

  return {
    kpis,
    timeSeries,
    categoryForecast,
    summary,
    modelInfo,
    insights,
    dbMonthlyForecasts: dbForecasts,
  };
};

module.exports = {
  findAll,
  getForecastOverview,
};