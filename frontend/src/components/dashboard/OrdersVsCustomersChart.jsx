// import React from "react";
import BarChart from "../charts/BarChart";
import { ChartSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";
import EmptyState from "./EmptyState";

const OrdersVsCustomersChart = ({ data, isLoading, error, onRetry }) => {
  if (isLoading) return <ChartSkeleton height={280} />;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Orders vs Customers</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !data || data.length === 0 ? (
        <EmptyState message="No orders data available for the selected period." />
      ) : (
        <BarChart
          data={data}
          xKey="date"
          bars={[
            { dataKey: "orders", name: "Orders", color: "#7C3AED" },
            { dataKey: "customers", name: "Customers", color: "#10B981" },
          ]}
        />
      )}
    </div>
  );
};

export default OrdersVsCustomersChart;