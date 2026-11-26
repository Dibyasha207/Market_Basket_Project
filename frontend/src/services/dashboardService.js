import api from "./api";

/**
* ============================================================
* Dashboard Overview
* ============================================================
  */
  export const getDashboardOverview = async (params = {}) => {
  const { data } = await api.get("/dashboard/overview", {
  params,
  });

return data;
};

/**
* ============================================================
* Revenue Over Time
* ============================================================
  */
  export const getRevenueOverTime = async (params = {}) => {
  const { data } = await api.get(
  "/dashboard/revenue-over-time",
  {
  params,
  }
  );

return data;
};

/**
* ============================================================
* Orders vs Customers
* ============================================================
  */
  export const getOrdersVsCustomers = async (
  params = {}
  ) => {
  const { data } = await api.get(
  "/dashboard/orders-vs-customers",
  {
  params,
  }
  );

return data;
};

/**
* ============================================================
* Top Categories
* ============================================================
  */
  export const getTopCategories = async (params = {}) => {
  const { data } = await api.get(
  "/dashboard/top-categories",
  {
  params,
  }
  );

return data;
};

/**
* ============================================================
* Recent Alerts
* ============================================================
  */
  export const getRecentAlerts = async (limit = 5) => {
  const { data } = await api.get(
  "/dashboard/alerts",
  {
  params: {
  limit,
  },
  }
  );

return data;
};

/**
* ============================================================
* Business Insights
* ============================================================
  */
  export const getBusinessInsights = async (
  limit = 5
  ) => {
  const { data } = await api.get(
  "/dashboard/insights",
  {
  params: {
  limit,
  },
  }
  );

return data;
};

/**
* ============================================================
* Default Export
* ============================================================
  */
  const dashboardService = {
  getDashboardOverview,
  getRevenueOverTime,
  getOrdersVsCustomers,
  getTopCategories,
  getRecentAlerts,
  getBusinessInsights,
  };

export default dashboardService;
