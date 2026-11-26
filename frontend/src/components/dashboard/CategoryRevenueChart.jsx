// import React from "react";
import PieChart from "../charts/PieChart";
import { ChartSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";
import EmptyState from "./EmptyState";
import { CHART_COLORS } from "../../utils/constants";

const CategoryRevenueChart = ({ data, isLoading, error, onRetry }) => {
  if (isLoading) return <ChartSkeleton height={260} />;

  const shaped = (data || []).map((item, i) => ({
    name: item.name,
    value: item.percentage,
    color: CHART_COLORS.palette[i % CHART_COLORS.palette.length],
  }));

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm h-full">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Top Performing Category</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : shaped.length === 0 ? (
        <EmptyState message="No category revenue data available for the selected period." />
      ) : (
        <div className="flex flex-col sm:flex-row items-center gap-6">
          <PieChart data={shaped} height={220} innerRadius={62} outerRadius={95} />
          <ul className="w-full space-y-3">
            {shaped.map((item) => (
              <li key={item.name} className="flex items-center justify-between text-sm">
                <span className="flex items-center gap-2.5">
                  <span className="w-2.5 h-2.5 rounded-full shrink-0" style={{ backgroundColor: item.color }} />
                  <span className="text-slate-600 dark:text-slate-300 font-medium">{item.name}</span>
                </span>
                <span className="font-semibold text-slate-900 dark:text-slate-100">{item.value}%</span>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default CategoryRevenueChart;