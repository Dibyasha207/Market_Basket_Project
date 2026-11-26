// import React from "react";
import {
  ResponsiveContainer,
  AreaChart as ReAreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from "recharts";
import { useTheme } from "../../hooks/useTheme";

const CustomTooltip = ({ active, payload, label, formatter, isDark }) => {
  if (!active || !payload?.length) return null;
  return (
    <div className={`px-3.5 py-2.5 rounded-xl border shadow-lg text-xs ${isDark ? "bg-slate-800 border-slate-700" : "bg-white border-slate-200"}`}>
      <p className={`font-semibold mb-1.5 ${isDark ? "text-slate-200" : "text-slate-700"}`}>{label}</p>
      {payload.map((entry) => (
        <p key={entry.dataKey} className={isDark ? "text-slate-300" : "text-slate-600"} style={{ color: entry.color }}>
          {entry.name}: <span className="font-semibold">{formatter ? formatter(entry.value) : entry.value}</span>
        </p>
      ))}
    </div>
  );
};

const AreaChart = ({
  data,
  xKey,
  areas,
  height = 300,
  showGrid = true,
  showLegend = false,
  formatter,
}) => {
  const { isDark } = useTheme();
  const gridColor = isDark ? "#334155" : "#EEF2F7";
  const axisColor = isDark ? "#64748B" : "#94A3B8";

  return (
    <ResponsiveContainer width="100%" height={height}>
      <ReAreaChart data={data} margin={{ top: 8, right: 8, left: -12, bottom: 0 }}>
        <defs>
          {areas.map((area) => (
            <linearGradient key={area.dataKey} id={`grad-${area.dataKey}`} x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor={area.color} stopOpacity={0.35} />
              <stop offset="95%" stopColor={area.color} stopOpacity={0} />
            </linearGradient>
          ))}
        </defs>
        {showGrid && <CartesianGrid strokeDasharray="3 3" vertical={false} stroke={gridColor} />}
        <XAxis
          dataKey={xKey}
          tick={{ fontSize: 12, fill: axisColor }}
          axisLine={{ stroke: gridColor }}
          tickLine={false}
        />
        <YAxis tick={{ fontSize: 12, fill: axisColor }} axisLine={false} tickLine={false} />
        <Tooltip content={<CustomTooltip formatter={formatter} isDark={isDark} />} />
        {showLegend && (
          <Legend
            iconType="circle"
            wrapperStyle={{ fontSize: 12, color: isDark ? "#CBD5E1" : "#475569" }}
          />
        )}
        {areas.map((area) => (
          <Area
            key={area.dataKey}
            type="monotone"
            dataKey={area.dataKey}
            name={area.name || area.dataKey}
            stroke={area.color}
            strokeWidth={2.5}
            fill={`url(#grad-${area.dataKey})`}
            dot={{ r: 3, strokeWidth: 2, fill: isDark ? "#1E293B" : "#fff" }}
            activeDot={{ r: 5 }}
          />
        ))}
      </ReAreaChart>
    </ResponsiveContainer>
  );
};

export default AreaChart;