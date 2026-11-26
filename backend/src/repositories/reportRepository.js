const pool = require("../config/db");

const getReportsList = async () => {
  const query = `
    SELECT
      r.report_id AS id,
      r.report_name AS name,
      r.report_type AS type,
      COALESCE(a.name, 'Admin User') AS generated_by,
      TO_CHAR(r.created_at, 'Mon DD, YYYY HH12:MI AM') AS created_date,
      r.format,
      r.status,
      r.file_path
    FROM reports r
    LEFT JOIN admins a ON r.generated_by = a.id
    ORDER BY r.created_at DESC;
  `;
  const result = await pool.query(query);

  if (result.rows.length > 0) {
    return result.rows;
  }

  // Initial rich sample if table has minimal rows
  return [
    { id: 1, name: "Sales Performance Report", type: "Sales Reports", generated_by: "Admin User", created_date: "May 18, 2025 10:24 AM", format: "PDF", status: "Completed" },
    { id: 2, name: "Customer Segmentation Report", type: "Customer Reports", generated_by: "Admin User", created_date: "May 18, 2025 09:12 AM", format: "Excel", status: "Completed" },
    { id: 3, name: "Top Products Analysis", type: "Product Reports", generated_by: "Admin User", created_date: "May 17, 2025 04:45 PM", format: "PDF", status: "Completed" },
    { id: 4, name: "Sales Forecast Report", type: "Forecast Reports", generated_by: "Admin User", created_date: "May 17, 2025 02:30 PM", format: "Excel", status: "Completed" },
    { id: 5, name: "Market Basket Analysis Report", type: "Market Basket Reports", generated_by: "Admin User", created_date: "May 16, 2025 11:15 AM", format: "PDF", status: "Completed" },
    { id: 6, name: "Inventory Status Report", type: "Inventory Reports", generated_by: "Admin User", created_date: "May 16, 2025 08:00 AM", format: "Excel", status: "Processing" },
    { id: 7, name: "Executive Summary Report", type: "Executive Summary", generated_by: "Admin User", created_date: "May 15, 2025 06:20 PM", format: "PDF", status: "Completed" },
  ];
};

const getReportKPIs = async () => {
  return {
    reportsGenerated: 156,
    scheduledReports: 24,
    downloadsToday: 89,
    sharedReports: 37,
  };
};

const getReportCategories = async () => {
  return [
    { id: "sales", name: "Sales Reports", count: 24, icon: "BarChart3" },
    { id: "customer", name: "Customer Reports", count: 18, icon: "Users" },
    { id: "product", name: "Product Reports", count: 32, icon: "Package" },
    { id: "forecast", name: "Forecast Reports", count: 15, icon: "TrendingUp" },
    { id: "recommendations", name: "Recommendation Reports", count: 12, icon: "Sparkles" },
    { id: "mba", name: "Market Basket Reports", count: 19, icon: "ShoppingCart" },
    { id: "inventory", name: "Inventory Reports", count: 14, icon: "Boxes" },
    { id: "executive", name: "Executive Summary", count: 6, icon: "FileText" },
  ];
};

const generateReport = async ({ reportName, reportType, format, generatedBy = 1 }) => {
  const name = reportName || `${reportType || "Executive"} Report ${new Date().toISOString().slice(0, 10)}`;
  const type = reportType || "Executive Reports";
  const fmt = (format || "PDF").toUpperCase();

  const insertQuery = `
    INSERT INTO reports (report_name, report_type, description, generated_by, format, status, file_path)
    VALUES ($1, $2, $3, $4, $5, 'Completed', $6)
    RETURNING report_id, report_name, report_type, format, status, created_at;
  `;
  const res = await pool.query(insertQuery, [
    name,
    type,
    `Generated ${type} in ${fmt} format`,
    generatedBy,
    fmt,
    `/reports/${name.toLowerCase().replace(/\s+/g, "_")}.${fmt.toLowerCase()}`,
  ]);

  return res.rows[0];
};

module.exports = {
  getReportsList,
  getReportKPIs,
  getReportCategories,
  generateReport,
};
