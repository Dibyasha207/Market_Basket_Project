import api from "./api";

export const getReportsOverview = async () => {
  const { data } = await api.get("/reports");
  return data;
};

export const generateReport = async (reportData) => {
  const { data } = await api.post("/reports/generate", reportData);
  return data;
};

export const getReportDownloadUrl = (reportId, format = "csv") => {
  return `${api.defaults.baseURL}/reports/${reportId}/download?format=${format}`;
};

const reportService = {
  getReportsOverview,
  generateReport,
  getReportDownloadUrl,
};

export default reportService;
