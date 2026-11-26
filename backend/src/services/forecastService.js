const forecastRepository = require("../repositories/forecastRepository");

const getForecasts = async () => {
  return await forecastRepository.findAll();
};

const getForecastOverview = async (range) => {
  return await forecastRepository.getForecastOverview(range);
};

module.exports = {
  getForecasts,
  getForecastOverview,
};