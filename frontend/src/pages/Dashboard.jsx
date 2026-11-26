import { useState, useMemo } from "react";
import { useDashboardData } from "../hooks/useDashboardData";
import { DATE_RANGE_PRESETS, DASHBOARD_FILTER_DEFAULTS } from "../utils/constants";
import DashboardFilters from "../components/dashboard/DashboardFilters";
import KPISection from "../components/dashboard/KPISection";
import RevenueChart from "../components/dashboard/RevenueChart";
import OrdersVsCustomersChart from "../components/dashboard/OrdersVsCustomersChart";
import CategoryRevenueChart from "../components/dashboard/CategoryRevenueChart";
import RecentAlerts from "../components/dashboard/RecentAlerts";
import BusinessInsights from "../components/dashboard/BusinessInsights";

const buildRangeFromPreset = (presetValue) => {
  const preset = DATE_RANGE_PRESETS.find((p) => p.value === presetValue) || DATE_RANGE_PRESETS[0];
  const end = new Date();
  const start = new Date();
  start.setDate(end.getDate() - preset.days);
  return { startDate: start.toISOString().slice(0, 10), endDate: end.toISOString().slice(0, 10) };
};

const Dashboard = () => {
  const [preset, setPreset] = useState(DASHBOARD_FILTER_DEFAULTS.preset);
  const [granularity, setGranularity] = useState(DASHBOARD_FILTER_DEFAULTS.granularity);

  const { startDate, endDate } = useMemo(() => buildRangeFromPreset(preset), [preset]);
  const filters = useMemo(
    () => ({ startDate, endDate, granularity }),
    [startDate, endDate, granularity]
  );

  const { data, isLoading, error, refetch } = useDashboardData(filters);

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
            Executive Overview
          </h1>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Real-time summary of your retail business
          </p>
        </div>

        <DashboardFilters
          preset={preset}
          granularity={granularity}
          startDate={startDate}
          endDate={endDate}
          onPresetChange={setPreset}
          onGranularityChange={setGranularity}
        />
      </div>

      <KPISection kpis={data.kpis} isLoading={isLoading} error={error} onRetry={refetch} />

      <div className="grid lg:grid-cols-2 gap-5">
        <RevenueChart data={data.revenue} isLoading={isLoading} error={error} onRetry={refetch} />
        <OrdersVsCustomersChart data={data.ordersVsCustomers} isLoading={isLoading} error={error} onRetry={refetch} />
      </div>

      <div className="grid lg:grid-cols-2 gap-5">
        <CategoryRevenueChart data={data.topCategories} isLoading={isLoading} error={error} onRetry={refetch} />
        <RecentAlerts alerts={data.alerts} isLoading={isLoading} error={error} onRetry={refetch} />
      </div>

      <BusinessInsights insights={data.insights} isLoading={isLoading} error={error} onRetry={refetch} />
    </div>
  );
};

export default Dashboard;