import api from "./api";

export const getRecommendations = async (params = {}) => {
  const { data } = await api.get("/recommendations", { params });
  return data;
};

const recommendationService = {
  getRecommendations,
};

export default recommendationService;