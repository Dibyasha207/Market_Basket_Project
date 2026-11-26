const reportRepository = require("../repositories/reportRepository");

const getReportsOverview = async () => {
  const [kpis, categories, reports] = await Promise.all([
    reportRepository.getReportKPIs(),
    reportRepository.getReportCategories(),
    reportRepository.getReportsList(),
  ]);

  const aiInsights = {
    keyFindings: [
      "Revenue increased by 12.5% compared to last week",
      "Beverages category shows highest growth",
      "Milk & Bread combination has highest lift (2.15)",
    ],
    recommendations: [
      "Promote Bread + Butter bundle in Tier-1 cities",
      "Increase inventory for high-demand products",
      "Run seasonal offers on Beverages & Snacks",
    ],
    businessRisks: [
      "Low stock risk for 15 fast-moving products",
      "Delivery delays may impact 8% of orders",
      "3 categories showing decline in repeat purchase",
    ],
    growthOpportunities: [
      "Cross-sell opportunity with 82% identified",
      "Expand in South Region for 18% potential growth",
      "New customer segment has 24% higher AOV",
    ],
  };

  return {
    kpis,
    categories,
    recentReports: reports,
    aiInsights,
  };
};

const createReport = async (reportData) => {
  return await reportRepository.generateReport(reportData);
};

module.exports = {
  getReportsOverview,
  createReport,
};
