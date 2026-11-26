const mbaService = require("../services/mbaService");

/**
 * Helper to parse query params safely
 */
const parseFilters = (query) => {
  return {
    startDate: query.startDate || null,
    endDate: query.endDate || null,
    country: query.country || null,
    category: query.category || null
  };
};

const parseOptions = (query) => {
  return {
    minSupport: query.minSupport !== undefined? parseFloat(query.minSupport) : undefined,
    minConfidence: query.minConfidence !== undefined? parseFloat(query.minConfidence) : undefined,
    liftMin: query.liftMin !== undefined? parseFloat(query.liftMin) : undefined,
    liftMax: query.liftMax !== undefined? parseFloat(query.liftMax) : undefined,
    search: query.search || "",
    page: query.page !== undefined? parseInt(query.page, 10) : undefined,
    limit: query.limit !== undefined? parseInt(query.limit, 10) : undefined
  };
};

const mbaController = {
  /**
   * GET /api/mba/kpis
   */
  getKPIs: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getKPIs(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/top-combinations
   */
  getTopCombinations: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const limit = options.limit || 10;
      const result = await mbaService.getTopCombinations(filters, options, limit);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/support-confidence
   */
  getSupportConfidence: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getSupportConfidenceData(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/lift-distribution
   */
  getLiftDistribution: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getLiftDistribution(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/product-network
   */
  getProductNetwork: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getProductNetwork(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/rules
   * STEP 2 API contract: supports pagination, search, lift filters
   */
  getRules: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getRules(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/bundles
   */
  getBundles: async (req, res) => {
    try {
      const filters = parseFilters(req.query);
      const options = parseOptions(req.query);
      const result = await mbaService.getBundles(filters, options);
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/insights
   */
  getInsights: async (req, res) => {
    try {
      const result = await mbaService.getInsights();
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  },

  /**
   * GET /api/mba/filters
   */
  getFilters: async (req, res) => {
    try {
      const result = await mbaService.getFilters();
      res.status(200).json({ success: true, data: result });
    } catch (error) {
      res.status(500).json({ success: false, message: error.message });
    }
  }
};

module.exports = mbaController;