import { useState, useEffect, useCallback } from "react";
import productService from "../services/productService";

export const useProducts = () => {
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchProductAnalytics = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await productService.getProductAnalytics();
      setData(res.data);
    } catch (err) {
      console.error("Failed to load product analytics:", err);
      setError(err?.response?.data?.message || "Failed to load product analytics");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchProductAnalytics();
  }, [fetchProductAnalytics]);

  return {
    data,
    isLoading,
    error,
    refetch: fetchProductAnalytics,
  };
};

export default useProducts;
