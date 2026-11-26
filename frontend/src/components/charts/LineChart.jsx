// import React from "react";
import { ResponsiveContainer, LineChart as ReLineChart, Line } from "recharts";
import { useTheme } from "../../hooks/useTheme";

/**
 * Minimal sparkline-style line chart — used inside KPI cards.
 */
const LineChart = ({ data, dataKey, color = "#7C3AED", height = 48 }) => {
  const { isDark } = useTheme();

  return (
    <ResponsiveContainer width="100%" height={height}>
      <ReLineChart data={data}>
        <Line
          type="monotone"
          dataKey={dataKey}
          stroke={color}
          strokeWidth={2}
          dot={{ r: 2.5, fill: color, strokeWidth: 0 }}
          activeDot={{ r: 4, stroke: isDark ? "#1E293B" : "#fff", strokeWidth: 2 }}
          isAnimationActive
        />
      </ReLineChart>
    </ResponsiveContainer>
  );
};

export default LineChart;