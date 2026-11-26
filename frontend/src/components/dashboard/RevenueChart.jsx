// import React from "react";
import AreaChart from "../charts/AreaChart";
import { ChartSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";
import EmptyState from "./EmptyState";
import { formatCurrency } from "../../utils/formatters";

const RevenueChart = ({ data, isLoading, error, onRetry }) => {
  if (isLoading) return <ChartSkeleton height={280} />;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Revenue Over Time</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !data || data.length === 0 ? (
        <EmptyState message="No revenue data available for the selected period." />
      ) : (
        <AreaChart
          data={data}
          xKey="date"
          areas={[{ dataKey: "revenue", name: "Revenue (USD)", color: "#7C3AED" }]}
          formatter={formatCurrency}
        />
      )}
    </div>
  );
};

export default RevenueChart;