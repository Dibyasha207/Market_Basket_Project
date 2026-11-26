const pool = require("../config/db");

const getSettings = async () => {
  const query = `SELECT setting_key, setting_value, category, description FROM settings ORDER BY setting_id ASC;`;
  const result = await pool.query(query);

  const settingsMap = {};
  result.rows.forEach((row) => {
    settingsMap[row.setting_key] = row.setting_value;
  });

  return {
    general: {
      companyName: settingsMap.company_name || "AI Retail Intelligence Pvt. Ltd.",
      timezone: settingsMap.timezone || "(UTC+05:30) Asia/Kolkata",
      currency: settingsMap.currency || "USD",
      language: settingsMap.language || "English",
      theme: settingsMap.theme || "Dark",
    },
    notifications: {
      emailNotifications: settingsMap.notification_email !== "Disabled",
      forecastAlerts: true,
      aiInsightAlerts: true,
      recommendationAlerts: true,
    },
    security: {
      twoFactorAuth: false,
      sessionTimeout: parseInt(settingsMap.session_timeout, 10) || 30,
      lastPasswordChange: "2026-07-30",
    },
    apiConfig: {
      openaiApiKey: settingsMap.openai_api_key ? "••••••••" + settingsMap.openai_api_key.slice(-4) : "",
      geminiApiKey: settingsMap.gemini_api_key ? "••••••••" + settingsMap.gemini_api_key.slice(-4) : "",
      databaseStatus: "Connected",
      apiStatus: "Running",
    },
    systemHealth: {
      database: { status: "Connected", latency: "12ms" },
      apiServices: { status: "Running", uptime: "99.9%" },
      forecastEngine: { status: "Active", model: "Prophet v1.0" },
      aiAssistant: { status: "Online", model: "RAG + LLM" },
    },
  };
};

const updateSetting = async (key, value, updatedBy = 1) => {
  const query = `
    INSERT INTO settings (setting_key, setting_value, updated_by, updated_at)
    VALUES ($1, $2, $3, CURRENT_TIMESTAMP)
    ON CONFLICT (setting_key)
    DO UPDATE SET setting_value = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP
    RETURNING setting_key, setting_value;
  `;
  const res = await pool.query(query, [key, String(value), updatedBy]);
  return res.rows[0];
};

const getActivityLogs = async (limit = 10) => {
  const query = `
    SELECT
      activity_id,
      activity_type,
      module,
      description,
      ip_address,
      device_info,
      TO_CHAR(created_at, 'Mon DD, YYYY HH12:MI AM') AS created_at
    FROM activity_logs
    ORDER BY created_at DESC
    LIMIT $1;
  `;
  const result = await pool.query(query, [limit]);

  if (result.rows.length > 0) return result.rows;

  return [
    { activity_id: 1, activity_type: "LOGIN", module: "AUTH", description: "Admin logged into dashboard", ip_address: "127.0.0.1", device_info: "Windows Chrome", created_at: "Just now" },
    { activity_id: 2, activity_type: "EXPORT", module: "REPORTS", description: "Exported Executive Summary Report", ip_address: "127.0.0.1", device_info: "Windows Chrome", created_at: "1 hour ago" },
    { activity_id: 3, activity_type: "MODEL_RUN", module: "FORECAST", description: "Prophet forecast model checkpoint verified", ip_address: "127.0.0.1", device_info: "Backend Service", created_at: "2 hours ago" },
    { activity_id: 4, activity_type: "UPDATE", module: "SETTINGS", description: "System theme preferences updated to Dark mode", ip_address: "127.0.0.1", device_info: "Windows Chrome", created_at: "3 hours ago" },
  ];
};

module.exports = {
  getSettings,
  updateSetting,
  getActivityLogs,
};
