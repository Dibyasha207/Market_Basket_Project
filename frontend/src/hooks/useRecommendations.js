import { useState, useEffect, useCallback } from "react";
import recommendationService from "../services/recommendationService";

export const useRecommendations = (initialProduct = "Milk") => {
  const [product, setProduct] = useState(initialProduct);
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchRecommendations = useCallback(async (prodToFetch) => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await recommendationService.getRecommendations({ product: prodToFetch });
      setData(res.data);
    } catch (err) {
      console.error("Failed to load recommendations:", err);
      setError(err?.response?.data?.message || "Failed to load product recommendations");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchRecommendations(product);
  }, [fetchRecommendations, product]);

  const searchProduct = (searchTerm) => {
    setProduct(searchTerm);
    fetchRecommendations(searchTerm);
  };

  return {
    product,
    data,
    isLoading,
    error,
    searchProduct,
    refetch: () => fetchRecommendations(product),
  };
};

export default useRecommendations;
