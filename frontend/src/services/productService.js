import api from "./api";

export const getProductAnalytics = async () => {
  const { data } = await api.get("/products/analytics");
  return data;
};

export const getProducts = async () => {
  const { data } = await api.get("/products");
  return data;
};

const productService = {
  getProductAnalytics,
  getProducts,
};

export default productService;
