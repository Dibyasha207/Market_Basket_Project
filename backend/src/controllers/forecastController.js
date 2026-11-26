const forecastService = require("../services/forecastService");

const getForecasts = async (req, res) => {
  try {
    const forecasts = await forecastService.getForecasts();

    res.status(200).json({
      success: true,
      count: forecasts.length,
      data: forecasts,
    });
  } catch (error) {
    console.error("getForecasts error:", error);

    res.status(500).json({
      success: false,
      message: "Failed to fetch forecasts",
    });
  }
};

const getForecastOverview = async (req, res) => {
  try {
    const range = req.query.range || "7d";
    const overview = await forecastService.getForecastOverview(range);

    res.status(200).json({
      success: true,
      data: overview,
    });
  } catch (error) {
    console.error("getForecastOverview error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

module.exports = {
  getForecasts,
  getForecastOverview,
};