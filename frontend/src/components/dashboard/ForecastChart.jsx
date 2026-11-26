import  { useEffect, useState } from "react";
import { getForecast } from "../../services/forecastService";
import AreaChart from "../charts/AreaChart";
import { formatCurrency } from "../../utils/formatters";

const ForecastChart = ({ dateRange }) => {
  const [forecastData, setForecastData] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let isMounted = true;

    const fetchForecast = async () => {
      try {
        const data = await getForecast({ range: dateRange });
        if (isMounted) setForecastData(data.data ?? data.forecast ?? []);
      } catch (err) {
        console.error("Failed to load forecast data:", err);
        if (isMounted) setError("Unable to load forecast data.");
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    fetchForecast();
    return () => {
      isMounted = false;
    };
  }, [dateRange]);

  return (
    <div className="p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 mb-5">Sales Forecast</h3>
      {isLoading ? (
        <div className="h-[300px] rounded-xl bg-slate-100 animate-pulse" />
      ) : error ? (
        <p className="text-sm text-red-500">{error}</p>
      ) : (
        <AreaChart
          data={forecastData}
          xKey="date"
          areas={[
            { dataKey: "actual", name: "Actual Sales", color: "#3B82F6" },
            { dataKey: "forecast", name: "Forecasted Sales", color: "#7C3AED" },
          ]}
          showLegend
          formatter={formatCurrency}
          height={320}
        />
      )}
    </div>
  );
};

export default ForecastChart;