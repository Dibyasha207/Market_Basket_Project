import { useState, useEffect, useCallback } from "react";
import dashboardService from "../services/dashboardService";
import {
  adaptOverview,
  adaptRevenueOverTime,
  adaptOrdersVsCustomers,
  adaptTopCategories,
  adaptAlerts,
  adaptBusinessInsights,
} from "../utils/dashboardAdapter";
import { DASHBOARD_FILTER_PARAM_KEYS } from "../utils/constants";

const buildDateParams = ({ startDate, endDate, granularity }) => ({
  [DASHBOARD_FILTER_PARAM_KEYS.startDate]: startDate,
  [DASHBOARD_FILTER_PARAM_KEYS.endDate]: endDate,
  [DASHBOARD_FILTER_PARAM_KEYS.granularity]: granularity,
});

const INITIAL_DATA = {
  kpis: null,
  revenue: [],
  ordersVsCustomers: [],
  topCategories: [],
  alerts: [],
  insights: [],
};

/**
 * Central data-fetching hook for the Executive Dashboard.
 * Every request goes through dashboardService — no direct axios calls,
 * no duplicated fetch logic in components.
 */
export const useDashboardData = (filters) => {
  const [data, setData] = useState(INITIAL_DATA);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchAll = useCallback(async () => {
    setIsLoading(true);
    setError(null);

    const dateParams = buildDateParams(filters);

    try {
      const [
        overviewRes,
        revenueRes,
        ordersRes,
        categoriesRes,
        alertsRes,
        insightsRes,
      ] = await Promise.all([
        dashboardService.getDashboardOverview(dateParams),
        dashboardService.getRevenueOverTime(dateParams),
        dashboardService.getOrdersVsCustomers(dateParams),
        dashboardService.getTopCategories(dateParams),
        dashboardService.getRecentAlerts(5),
        dashboardService.getBusinessInsights(5),
      ]);

      setData({
        kpis: adaptOverview(overviewRes),
        revenue: adaptRevenueOverTime(revenueRes),
        ordersVsCustomers: adaptOrdersVsCustomers(ordersRes),
        topCategories: adaptTopCategories(categoriesRes),
        alerts: adaptAlerts(alertsRes),
        insights: adaptBusinessInsights(insightsRes),
      });
    } catch (err) {
      if (process.env.NODE_ENV === "development") {
        console.error("Dashboard data fetch failed:", err);
      }
      setError(
        err?.response?.data?.message ||
          "We couldn't load the dashboard right now. Please try again."
      );
    } finally {
      setIsLoading(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters.startDate, filters.endDate, filters.granularity]);

  useEffect(() => {
    fetchAll();
  }, [fetchAll]);

  return { data, isLoading, error, refetch: fetchAll };
};