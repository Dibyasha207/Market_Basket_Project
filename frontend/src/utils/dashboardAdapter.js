export const adaptOverview = (response) => {
  const kpis = response?.data?.kpis ?? {};

  const mapMetric = (metric) => ({
    value: metric?.value ?? 0,
    changePercentage: metric?.change_percentage ?? 0,
    trend: Array.isArray(metric?.trend) ? metric.trend : [],
  });

  return {
    totalRevenue: mapMetric(kpis.total_revenue),
    totalOrders: mapMetric(kpis.total_orders),
    totalCustomers: mapMetric(kpis.total_customers),
    totalProducts: mapMetric(kpis.total_products),
  };
};

/** GET /dashboard/revenue-over-time → expected: { success, data: { series: [{date, revenue}] } } */
export const adaptRevenueOverTime = (response) => {
  const series = response?.data?.series ?? response?.data ?? [];
  if (!Array.isArray(series)) return [];

  return series.map((point) => ({
    date: point.date,
    revenue: Number(point.revenue ?? 0),
  }));
};

/** GET /dashboard/orders-vs-customers → expected: { success, data: [{date, orders, customers}] } */
export const adaptOrdersVsCustomers = (response) => {
  const rows = response?.data ?? [];
  if (!Array.isArray(rows)) return [];

  return rows.map((row) => ({
    date: row.date,
    orders: Number(row.orders ?? 0),
    customers: Number(row.customers ?? 0),
  }));
};

/** GET /dashboard/top-categories → actual shape: { success, data: [{category_name, revenue}] } */
export const adaptTopCategories = (response) => {
  const rows = response?.data ?? [];
  if (!Array.isArray(rows) || rows.length === 0) return [];

  const totalRevenue = rows.reduce((sum, row) => sum + Number(row.revenue ?? 0), 0);

  return rows.map((row) => ({
    name: row.category_name,
    revenue: Number(row.revenue ?? 0),
    percentage: totalRevenue > 0
      ? Number(((Number(row.revenue ?? 0) / totalRevenue) * 100).toFixed(1))
      : 0,
  }));
};

/** GET /dashboard/alerts → expected: { success, data: [{id, title, message, type, priority, is_read, created_at}] */
export const adaptAlerts = (response) => {
  const rows = response?.data ?? [];
  if (!Array.isArray(rows)) return [];

  return rows.map((row) => ({
    id: row.id,
    title: row.title,
    message: row.message,
    type: row.type,
    priority: row.priority,
    isRead: Boolean(row.is_read),
    createdAt: row.created_at,
  }));
};

/** GET /dashboard/insights → expected: { success, data: [{id, title, description, insight_type, priority, status, source, created_at}] */
export const adaptBusinessInsights = (response) => {
  const rows = response?.data ?? [];
  if (!Array.isArray(rows)) return [];

  return rows.map((row) => ({
    id: row.id,
    title: row.title,
    description: row.description,
    insightType: row.insight_type,
    priority: row.priority,
    status: row.status,
    source: row.source,
    createdAt: row.created_at,
  }));
};