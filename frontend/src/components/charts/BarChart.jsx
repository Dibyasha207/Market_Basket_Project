// import React from "react";
import {
  ResponsiveContainer,
  BarChart as ReBarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from "recharts";
import { useTheme } from "../../hooks/useTheme";

const CustomTooltip = ({ active, payload, label, isDark }) => {
  if (!active || !payload?.length) return null;
  return (
    <div className={`px-3.5 py-2.5 rounded-xl border shadow-lg text-xs ${isDark ? "bg-slate-800 border-slate-700" : "bg-white border-slate-200"}`}>
      <p className={`font-semibold mb-1.5 ${isDark ? "text-slate-200" : "text-slate-700"}`}>{label}</p>
      {payload.map((entry) => (
        <p key={entry.dataKey} style={{ color: entry.color }}>
          {entry.name}: <span className="font-semibold">{entry.value}</span>
        </p>
      ))}
    </div>
  );
};

const BarChart = ({ data, xKey, bars, height = 300, showLegend = true }) => {
  const { isDark } = useTheme();
  const gridColor = isDark ? "#334155" : "#EEF2F7";
  const axisColor = isDark ? "#64748B" : "#94A3B8";

  return (
    <ResponsiveContainer width="100%" height={height}>
      <ReBarChart data={data} margin={{ top: 8, right: 8, left: -12, bottom: 0 }} barGap={6}>
        <CartesianGrid strokeDasharray="3 3" vertical={false} stroke={gridColor} />
        <XAxis dataKey={xKey} tick={{ fontSize: 12, fill: axisColor }} axisLine={{ stroke: gridColor }} tickLine={false} />
        <YAxis tick={{ fontSize: 12, fill: axisColor }} axisLine={false} tickLine={false} />
        <Tooltip content={<CustomTooltip isDark={isDark} />} cursor={{ fill: isDark ? "#1E293B" : "#F8FAFC" }} />
        {showLegend && (
          <Legend
            iconType="circle"
            wrapperStyle={{ fontSize: 12, color: isDark ? "#CBD5E1" : "#475569" }}
          />
        )}
        {bars.map((bar) => (
          <Bar key={bar.dataKey} dataKey={bar.dataKey} name={bar.name || bar.dataKey} fill={bar.color} radius={[6, 6, 0, 0]} maxBarSize={26} />
        ))}
      </ReBarChart>
    </ResponsiveContainer>
  );
};

export default BarChart;