import { useState, useEffect, useCallback } from "react";
import forecastService from "../services/forecastService";

export const useForecast = (initialRange = "7d") => {
  const [range, setRange] = useState(initialRange);
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchForecast = useCallback(async (r) => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await forecastService.getForecastOverview(r);
      setData(res.data);
    } catch (err) {
      console.error("Failed to load forecast data:", err);
      setError(err?.response?.data?.message || "Failed to load sales forecast");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchForecast(range);
  }, [fetchForecast, range]);

  return {
    range,
    setRange,
    data,
    isLoading,
    error,
    refetch: () => fetchForecast(range),
  };
};

export default useForecast;
