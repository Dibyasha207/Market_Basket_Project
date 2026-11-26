import { useState, useEffect, useCallback } from "react";
import reportService from "../services/reportService";

export const useReports = () => {
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchReports = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await reportService.getReportsOverview();
      setData(res.data);
    } catch (err) {
      console.error("Failed to load reports:", err);
      setError(err?.response?.data?.message || "Failed to load reports center");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchReports();
  }, [fetchReports]);

  const generateNewReport = async (payload) => {
    const res = await reportService.generateReport(payload);
    await fetchReports();
    return res;
  };

  return {
    data,
    isLoading,
    error,
    refetch: fetchReports,
    generateNewReport,
  };
};

export default useReports;
