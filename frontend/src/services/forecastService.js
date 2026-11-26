import api from "./api";

export const getForecastOverview = async (range = "7d") => {
  const { data } = await api.get("/forecast/overview", { params: { range } });
  return data;
};

export const getMonthlyForecasts = async () => {
  const { data } = await api.get("/forecast/monthly");
  return data;
};

export const sendAssistantMessage = async (message) => {
  const { data } = await api.post("/ai/chat", { message });
  return data?.data?.response || data;
};

const forecastService = {
  getForecastOverview,
  getMonthlyForecasts,
  sendAssistantMessage,
};

export default forecastService;