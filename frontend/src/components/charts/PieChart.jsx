// import React from "react";
import { ResponsiveContainer, PieChart as RePieChart, Pie, Cell, Tooltip } from "recharts";
import { useTheme } from "../../hooks/useTheme";

const CustomTooltip = ({ active, payload, isDark }) => {
  if (!active || !payload?.length) return null;
  const item = payload[0];
  return (
    <div className={`px-3.5 py-2.5 rounded-xl border shadow-lg text-xs ${isDark ? "bg-slate-800 border-slate-700" : "bg-white border-slate-200"}`}>
      <p className={`font-semibold ${isDark ? "text-slate-200" : "text-slate-700"}`}>
        {item.name}: <span style={{ color: item.payload.fill }}>{item.value}%</span>
      </p>
    </div>
  );
};

const PieChart = ({ data, height = 260, innerRadius = 70, outerRadius = 105 }) => {
  const { isDark } = useTheme();

  return (
    <ResponsiveContainer width="100%" height={height}>
      <RePieChart>
        <Pie
          data={data}
          dataKey="value"
          nameKey="name"
          cx="50%"
          cy="50%"
          innerRadius={innerRadius}
          outerRadius={outerRadius}
          paddingAngle={2}
          cornerRadius={4}
          stroke="none"
        >
          {data.map((entry, index) => (
            <Cell key={entry.name} fill={entry.color || `hsl(${index * 60}, 70%, 60%)`} />
          ))}
        </Pie>
        <Tooltip content={<CustomTooltip isDark={isDark} />} />
      </RePieChart>
    </ResponsiveContainer>
  );
};

export default PieChart;