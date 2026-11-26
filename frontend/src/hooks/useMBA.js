import { useState, useEffect, useCallback, useMemo } from "react";
import mbaService from "../services/mbaService";
import {
  adaptKPIs,
  adaptTopCombinations,
  adaptSupportConfidence,
  adaptLiftDistribution,
  adaptProductNetwork,
  adaptRules,
  adaptBundles,
  adaptInsights,
  adaptFilterMeta,
} from "../utils/mbaAdapter";

export const DEFAULT_MBA_FILTERS = {
  startDate: "",
  endDate: "",
  country: "",
  category: "",
  minSupport: 0.01, // FIX: 0 se start nahi
  minConfidence: 0.1,
  liftMin: 1,
  liftMax: 100, // FIX: 10 se 100
  search: "",
};

const INITIAL_DATA = {
  filterMeta: { countries: [], categories: [], dateRange: null },
  kpis: null,
  topCombinations: [],
  supportConfidence: [],
  liftDistribution: [],
  productNetwork: { nodes: [], edges: [] },
  bundles: [],
  insights: [],
};

const INITIAL_RULES_STATE = {
  rules: [],
  pagination: { page: 1, limit: 5, total: 0, totalPages: 1 },
};

export const useMBA = () => {
  const [filters, setFilters] = useState(DEFAULT_MBA_FILTERS);
  const [rulesSearch, setRulesSearch] = useState("");
  const [rulesPage, setRulesPage] = useState(1);
  const rulesLimit = 5;

  const [data, setData] = useState(INITIAL_DATA);
  const [rulesData, setRulesData] = useState(INITIAL_RULES_STATE);

  const [isLoading, setIsLoading] = useState(true);
  const [isRulesLoading, setIsRulesLoading] = useState(true);
  const [error, setError] = useState(null);
  const [rulesError, setRulesError] = useState(null);

  useEffect(() => {
    let isMounted = true;
    mbaService
     .getMBAFilters()
     .then((res) => {
        if (isMounted) {
          setData((prev) => ({...prev, filterMeta: adaptFilterMeta(res) || INITIAL_DATA.filterMeta }));
        }
      })
     .catch((err) => console.error("Failed to load MBA filter metadata:", err));
    return () => { isMounted = false; };
  }, []);

  const fetchOverview = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const overview = await mbaService.getMBAOverview(filters);
      setData((prev) => ({
       ...prev,
        kpis: adaptKPIs(overview?.kpis) || null,
        topCombinations: adaptTopCombinations(overview?.topCombinations) || [],
        supportConfidence: adaptSupportConfidence(overview?.supportConfidence) || [],
        liftDistribution: adaptLiftDistribution(overview?.liftDistribution) || [],
        productNetwork: adaptProductNetwork(overview?.productNetwork) || { nodes: [], edges: [] },
        bundles: adaptBundles(overview?.bundles) || [],
        insights: adaptInsights(overview?.insights) || [],
      }));
    } catch (err) {
      console.error("Failed to load MBA overview:", err);
      setError(err?.response?.data?.message || "We couldn't load Market Basket Analysis data.");
      setData(INITIAL_DATA); // FIX: error pe reset
    } finally {
      setIsLoading(false);
    }
  }, [filters]);

  const fetchRules = useCallback(async () => {
    setIsRulesLoading(true);
    setRulesError(null);
    try {
      const response = await mbaService.getAssociationRules({
        startDate: filters.startDate || undefined,
        endDate: filters.endDate || undefined,
        country: filters.country || undefined,
        category: filters.category || undefined,
        minSupport: filters.minSupport,
        minConfidence: filters.minConfidence,
        liftMin: filters.liftMin,
        liftMax: filters.liftMax,
        search: rulesSearch || undefined,
        page: rulesPage,
        limit: rulesLimit,
      });
      setRulesData(adaptRules(response) || INITIAL_RULES_STATE);
    } catch (err) {
      console.error("Failed to load association rules:", err);
      setRulesError(err?.response?.data?.message || "Unable to load association rules.");
      setRulesData(INITIAL_RULES_STATE); // FIX: error pe reset
    } finally {
      setIsRulesLoading(false);
    }
  }, [filters, rulesSearch, rulesPage]);

  useEffect(() => { fetchOverview(); }, [fetchOverview]);
  useEffect(() => { fetchRules(); }, [fetchRules]);

  useEffect(() => { setRulesPage(1); }, [filters, rulesSearch]);

  const updateFilter = useCallback((key, value) => {
    setFilters((prev) => ({...prev, [key]: value }));
  }, []);

  const resetFilters = useCallback(() => {
    setFilters(DEFAULT_MBA_FILTERS);
    setRulesSearch("");
  }, []);

  const hasActiveFilters = useMemo(() => {
    return Object.keys(DEFAULT_MBA_FILTERS).some(k => filters[k]!== DEFAULT_MBA_FILTERS[k]) || rulesSearch!== "";
  }, [filters, rulesSearch]);

  return {
    filters, updateFilter, resetFilters, hasActiveFilters,
    rulesSearch, setRulesSearch, rulesPage, setRulesPage,
    data, isLoading, error, refetchOverview: fetchOverview,
    rulesData, isRulesLoading, rulesError, refetchRules: fetchRules,
  };
};