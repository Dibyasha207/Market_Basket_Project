// import React from "react";
import {
  ResponsiveContainer,
  ScatterChart,
  Scatter,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ZAxis,
} from "recharts";
import { useTheme } from "../../hooks/useTheme";
import EmptyState from "../dashboard/EmptyState";
import { ChartSkeleton } from "../dashboard/LoadingState";
import ErrorState from "../dashboard/ErrorState";

const CustomTooltip = ({ active, payload, isDark }) => {
  if (!active || !payload?.length) return null;
  const point = payload[0].payload;
  return (
    <div className={`px-3.5 py-2.5 rounded-xl border shadow-lg text-xs ${isDark ? "bg-slate-800 border-slate-700" : "bg-white border-slate-200"}`}>
      <p className={`font-semibold mb-1 ${isDark ? "text-slate-200" : "text-slate-700"}`}>
        {point.antecedent} → {point.consequent}
      </p>
      <p className={isDark ? "text-slate-400" : "text-slate-500"}>Support: {(point.support * 100).toFixed(1)}%</p>
      <p className={isDark ? "text-slate-400" : "text-slate-500"}>Confidence: {(point.confidence * 100).toFixed(1)}%</p>
      <p className={isDark ? "text-slate-400" : "text-slate-500"}>Lift: {point.lift.toFixed(2)}</p>
    </div>
  );
};

const SupportConfidenceChart = ({ data, isLoading, error, onRetry }) => {
  const { isDark } = useTheme();

  if (isLoading) return <ChartSkeleton height={260} />;

  const gridColor = isDark ? "#334155" : "#EEF2F7";
  const axisColor = isDark ? "#64748B" : "#94A3B8";

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Support vs Confidence</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !data || data.length === 0 ? (
        <EmptyState message="No support/confidence data available for the selected filters." />
      ) : (
        <ResponsiveContainer width="100%" height={260}>
          <ScatterChart margin={{ top: 8, right: 8, left: -12, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke={gridColor} />
            <XAxis
              type="number"
              dataKey="support"
              name="Support"
              domain={[0, "dataMax"]}
              tickFormatter={(v) => `${(v * 100).toFixed(0)}%`}
              tick={{ fontSize: 11, fill: axisColor }}
              axisLine={{ stroke: gridColor }}
              tickLine={false}
            />
            <YAxis
              type="number"
              dataKey="confidence"
              name="Confidence"
              domain={[0, 1]}
              tickFormatter={(v) => `${(v * 100).toFixed(0)}%`}
              tick={{ fontSize: 11, fill: axisColor }}
              axisLine={false}
              tickLine={false}
            />
            <ZAxis type="number" dataKey="lift" range={[40, 160]} />
            <Tooltip content={<CustomTooltip isDark={isDark} />} cursor={{ strokeDasharray: "3 3" }} />
            <Scatter data={data} fill="#7C3AED" fillOpacity={0.75} />
          </ScatterChart>
        </ResponsiveContainer>
      )}
    </div>
  );
};

export default SupportConfidenceChart;