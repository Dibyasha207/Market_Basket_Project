// import React from "react";
import BarChart from "../charts/BarChart";
import EmptyState from "../dashboard/EmptyState";
import { ChartSkeleton } from "../dashboard/LoadingState";
import ErrorState from "../dashboard/ErrorState";

const TopCombinations = ({ data, isLoading, error, onRetry }) => {
  if (isLoading) return <ChartSkeleton height={260} />;

  const chartData = (data || []).map((row) => ({ label: row.label, support: row.support }));

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Top Product Combinations</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : chartData.length === 0 ? (
        <EmptyState message="No product combinations found for the selected filters." />
      ) : (
        <BarChart
          data={chartData}
          xKey="label"
          bars={[{ dataKey: "support", name: "Support", color: "#7C3AED" }]}
          showLegend={false}
          height={260}
        />
      )}
    </div>
  );
};

export default TopCombinations;