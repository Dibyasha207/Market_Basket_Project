import { useState, useEffect, useCallback } from "react";
import customerService from "../services/customerService";

export const useCustomers = () => {
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchCustomerData = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await customerService.getCustomerOverview();
      setData(res.data);
    } catch (err) {
      console.error("Failed to load customer data:", err);
      setError(err?.response?.data?.message || "Failed to load customer intelligence");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchCustomerData();
  }, [fetchCustomerData]);

  return {
    data,
    isLoading,
    error,
    refetch: fetchCustomerData,
  };
};

export default useCustomers;
