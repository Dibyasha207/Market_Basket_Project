import api from "./api";

export const getCustomerSegments = async () => {
  const { data } = await api.get("/customers/segments");
  return data;
};

export const getCustomerOverview = async () => {
  const { data } = await api.get("/customers/overview");
  return data;
};

export const getTopCustomers = async (limit = 5) => {
  const { data } = await api.get("/customers/top", { params: { limit } });
  return data;
};

const customerService = {
  getCustomerSegments,
  getCustomerOverview,
  getTopCustomers,
};

export default customerService;