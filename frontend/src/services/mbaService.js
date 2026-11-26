import api from "./api";

/**

* Market Basket Analysis API Service
*
* Centralized service for all MBA-related API calls.
* Uses the existing authenticated API client from ./api.
  */

/**

* Build query parameters while removing undefined/null/empty values.
  */
  const buildParams = (params = {}) => {
  return Object.fromEntries(
  Object.entries(params).filter(
  ([, value]) =>
  value !== undefined &&
  value !== null &&
  value !== ""
  )
  );
  };

/**

* Get MBA KPI metrics.
*
* GET /api/mba/kpis
  */
  export const getMBAKPIs = async (filters = {}) => {
  const response = await api.get("/mba/kpis", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get top product combinations.
*
* GET /api/mba/top-combinations
  */
  export const getTopCombinations = async (filters = {}) => {
  const response = await api.get("/mba/top-combinations", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get support vs confidence data.
*
* GET /api/mba/support-confidence
  */
  export const getSupportConfidence = async (filters = {}) => {
  const response = await api.get("/mba/support-confidence", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get lift distribution data.
*
* GET /api/mba/lift-distribution
  */
  export const getLiftDistribution = async (filters = {}) => {
  const response = await api.get("/mba/lift-distribution", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get product association network.
*
* GET /api/mba/product-network
  */
  export const getProductNetwork = async (filters = {}) => {
  const response = await api.get("/mba/product-network", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get paginated association rules.
*
* GET /api/mba/rules
*
* Supports:
* * startDate
* * endDate
* * country
* * category
* * minSupport
* * minConfidence
* * liftMin
* * liftMax
* * search
* * page
* * limit
    */
    export const getAssociationRules = async ({
    startDate,
    endDate,
    country,
    category,
    minSupport,
    minConfidence,
    liftMin,
    liftMax,
    search,
    page = 1,
    limit = 20,
    } = {}) => {
    const response = await api.get("/mba/rules", {
    params: buildParams({
    startDate,
    endDate,
    country,
    category,
    minSupport,
    minConfidence,
    liftMin,
    liftMax,
    search,
    page,
    limit,
    }),
    });

return response.data;
};

/**

* Get recommended product bundles.
*
* GET /api/mba/bundles
  */
  export const getBundles = async (filters = {}) => {
  const response = await api.get("/mba/bundles", {
  params: buildParams(filters),
  });

return response.data;
};

/**

* Get business insights.
*
* GET /api/mba/insights
  */
  export const getMBAInsights = async () => {
  const response = await api.get("/mba/insights");

return response.data;
};

/**

* Get MBA filter metadata.
*
* GET /api/mba/filters
*
* Returns:
* * countries
* * categories
* * dateRange
    */
    export const getMBAFilters = async () => {
    const response = await api.get("/mba/filters");

return response.data;
};

/**

* Fetch all MBA dashboard data together.
*
* Useful for initial dashboard loading.
*
* Note:
* Rules are fetched separately because they have pagination,
* search and filtering controls.
  */
  export const getMBAOverview = async (filters = {}) => {
  const [
  kpis,
  topCombinations,
  supportConfidence,
  liftDistribution,
  productNetwork,
  bundles,
  insights,
  ] = await Promise.all([
  getMBAKPIs(filters),
  getTopCombinations(filters),
  getSupportConfidence(filters),
  getLiftDistribution(filters),
  getProductNetwork(filters),
  getBundles(filters),
  getMBAInsights(),
  ]);

return {
kpis,
topCombinations,
supportConfidence,
liftDistribution,
productNetwork,
bundles,
insights,
};
};

export default {
getMBAKPIs,
getTopCombinations,
getSupportConfidence,
getLiftDistribution,
getProductNetwork,
getAssociationRules,
getBundles,
getMBAInsights,
getMBAFilters,
getMBAOverview,
};
