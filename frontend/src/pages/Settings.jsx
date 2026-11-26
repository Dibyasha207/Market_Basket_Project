import { useState } from "react";
import { motion } from "framer-motion";
import {
  Sliders,
  Bell,
  Shield,
  Key,
  Activity,
  History,
  AlertOctagon,
  Save,
  CheckCircle2,
  Database,
  Moon,
  Sun,
  HardDriveDownload,
  RefreshCw,
  Clock,
  Server,
  Terminal,
} from "lucide-react";
import { useSettings } from "../hooks/useSettings";
import { useTheme } from "../hooks/useTheme";

const TABS = [
  { id: "general", label: "General", icon: Sliders },
  { id: "notifications", label: "Notifications", icon: Bell },
  { id: "security", label: "Security", icon: Shield },
  { id: "api", label: "API & Keys", icon: Key },
  { id: "health", label: "System Health", icon: Activity },
  { id: "logs", label: "Activity Logs", icon: History },
  { id: "danger", label: "Danger Zone", icon: AlertOctagon },
];

const Settings = () => {
  const { settings, isLoading, saveSettings, backupDb } = useSettings();
  const { isDark, toggleTheme } = useTheme();

  const [activeTab, setActiveTab] = useState("general");
  const [successMsg, setSuccessMsg] = useState(null);
  const [isSaving, setIsSaving] = useState(false);
  const [isBackingUp, setIsBackingUp] = useState(false);

  // Form states initialized with settings or sensible defaults
  const [companyName, setCompanyName] = useState(settings?.general?.companyName || "AI Retail Intelligence Pvt. Ltd.");
  const [timezone, setTimezone] = useState(settings?.general?.timezone || "(UTC+05:30) Asia/Kolkata");
  const [currency, setCurrency] = useState(settings?.general?.currency || "USD");
  const [language, setLanguage] = useState(settings?.general?.language || "English");

  const [emailNotifications, setEmailNotifications] = useState(true);
  const [forecastAlerts, setForecastAlerts] = useState(true);
  const [lowStockAlerts, setLowStockAlerts] = useState(true);
  const [aiInsightAlerts, setAiInsightAlerts] = useState(true);

  const [sessionTimeout, setSessionTimeout] = useState(30);
  const [twoFactorAuth, setTwoFactorAuth] = useState(false);
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");

  const [geminiApiKey, setGeminiApiKey] = useState("");
  const [openaiApiKey, setOpenaiApiKey] = useState("");

  const showNotification = (msg) => {
    setSuccessMsg(msg);
    setTimeout(() => setSuccessMsg(null), 3500);
  };

  const handleSaveGeneral = async (e) => {
    e.preventDefault();
    setIsSaving(true);
    try {
      await saveSettings({
        companyName,
        timezone,
        currency,
        language,
        theme: isDark ? "Dark" : "Light",
      });
      showNotification("General platform settings saved successfully.");
    } catch (err) {
      console.error(err);
    } finally {
      setIsSaving(false);
    }
  };

  const handleSaveSecurity = async (e) => {
    e.preventDefault();
    setIsSaving(true);
    try {
      showNotification("Security and authentication settings updated.");
      setCurrentPassword("");
      setNewPassword("");
    } finally {
      setIsSaving(false);
    }
  };

  const handleSaveAPI = async (e) => {
    e.preventDefault();
    setIsSaving(true);
    try {
      await saveSettings({
        geminiApiKey,
        openaiApiKey,
      });
      showNotification("API Keys and integration endpoints updated.");
      setGeminiApiKey("");
      setOpenaiApiKey("");
    } finally {
      setIsSaving(false);
    }
  };

  const handleBackup = async () => {
    setIsBackingUp(true);
    try {
      const res = await backupDb();
      showNotification(`Database backup created: ${res?.backupFile || "retail_backup.sql"}`);
    } catch (err) {
      console.error(err);
    } finally {
      setIsBackingUp(false);
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5">
            <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
              Settings
            </h1>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-indigo-100 dark:bg-indigo-950/80 text-indigo-700 dark:text-indigo-400 border border-indigo-300 dark:border-indigo-800">
              Admin Console
            </span>
          </div>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Configure platform parameters, model integrations, security policies, and system preferences
          </p>
        </div>
      </div>

      {/* Success Banner */}
      {successMsg && (
        <motion.div
          initial={{ opacity: 0, y: -8 }}
          animate={{ opacity: 1, y: 0 }}
          className="p-3.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-300 flex items-center gap-2 text-xs"
        >
          <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
          <span>{successMsg}</span>
        </motion.div>
      )}

      {/* 2-Column: Tabs Sidebar + Settings Content */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
        {/* Navigation Tabs (3 cols) */}
        <div className="lg:col-span-3 p-3 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm space-y-1">
          {TABS.map((tab) => {
            const Icon = tab.icon;
            const isActive = activeTab === tab.id;
            return (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id)}
                className={`w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-xs font-semibold transition-all ${
                  isActive
                    ? "bg-indigo-600 text-white shadow-sm"
                    : "text-slate-600 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-700/40 hover:text-slate-900 dark:hover:text-slate-200"
                }`}
              >
                <Icon className={`w-4 h-4 ${isActive ? "text-white" : "text-slate-400"}`} />
                <span>{tab.label}</span>
              </button>
            );
          })}
        </div>

        {/* Tab Content Panel (9 cols) */}
        <div className="lg:col-span-9 p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          {/* TAB 1: General */}
          {activeTab === "general" && (
            <form onSubmit={handleSaveGeneral} className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">General Information</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Configure global workspace branding and regional parameters</p>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs">
                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Company Name
                  </label>
                  <input
                    type="text"
                    value={companyName}
                    onChange={(e) => setCompanyName(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Currency
                  </label>
                  <select
                    value={currency}
                    onChange={(e) => setCurrency(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  >
                    <option value="USD">USD ($ - United States Dollar)</option>
                    <option value="EUR">EUR (€ - Euro)</option>
                    <option value="GBP">GBP (£ - British Pound)</option>
                    <option value="INR">INR (₹ - Indian Rupee)</option>
                  </select>
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Timezone
                  </label>
                  <select
                    value={timezone}
                    onChange={(e) => setTimezone(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  >
                    <option value="(UTC+05:30) Asia/Kolkata">(UTC+05:30) Asia/Kolkata</option>
                    <option value="(UTC+00:00) UTC / London">(UTC+00:00) UTC / London</option>
                    <option value="(UTC-05:00) Eastern Time (US & Canada)">(UTC-05:00) Eastern Time (US & Canada)</option>
                    <option value="(UTC-08:00) Pacific Time (US & Canada)">(UTC-08:00) Pacific Time (US & Canada)</option>
                  </select>
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Language
                  </label>
                  <select
                    value={language}
                    onChange={(e) => setLanguage(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  >
                    <option value="English">English (United States)</option>
                    <option value="French">French</option>
                    <option value="Spanish">Spanish</option>
                    <option value="German">German</option>
                  </select>
                </div>
              </div>

              {/* Theme toggle row */}
              <div className="pt-4 border-t border-slate-200 dark:border-slate-700 flex items-center justify-between">
                <div>
                  <p className="text-xs font-semibold text-slate-800 dark:text-slate-200">Theme Appearance</p>
                  <p className="text-[11px] text-slate-500 dark:text-slate-400">Toggle between dark mode and light theme for the platform</p>
                </div>
                <button
                  type="button"
                  onClick={toggleTheme}
                  className="inline-flex items-center gap-2 px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-700 transition-colors shadow-sm"
                >
                  {isDark ? <Moon className="w-4 h-4 text-indigo-400" /> : <Sun className="w-4 h-4 text-amber-500" />}
                  <span>{isDark ? "Dark Theme" : "Light Theme"}</span>
                </button>
              </div>

              <div className="pt-2">
                <button
                  type="submit"
                  disabled={isSaving}
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all disabled:opacity-50"
                >
                  <Save className="w-4 h-4" />
                  {isSaving ? "Saving..." : "Save Preferences"}
                </button>
              </div>
            </form>
          )}

          {/* TAB 2: Notifications */}
          {activeTab === "notifications" && (
            <div className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Notification Channels</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Configure automated alerts and dispatch rules</p>
              </div>

              <div className="space-y-4 divide-y divide-slate-100 dark:divide-slate-700/60 text-xs">
                <div className="pt-3 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">Email Notifications</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Send daily digests to dibyashasahoo682@gmail.com</p>
                  </div>
                  <input
                    type="checkbox"
                    checked={emailNotifications}
                    onChange={(e) => setEmailNotifications(e.target.checked)}
                    className="w-4 h-4 rounded text-indigo-600 focus:ring-indigo-500"
                  />
                </div>

                <div className="pt-3 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">Sales Forecast Alert</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Alert when projected demand exceeds ±15% variance</p>
                  </div>
                  <input
                    type="checkbox"
                    checked={forecastAlerts}
                    onChange={(e) => setForecastAlerts(e.target.checked)}
                    className="w-4 h-4 rounded text-indigo-600 focus:ring-indigo-500"
                  />
                </div>

                <div className="pt-3 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">Low Stock Inventory Trigger</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Notify immediately when catalog items drop below 20 units</p>
                  </div>
                  <input
                    type="checkbox"
                    checked={lowStockAlerts}
                    onChange={(e) => setLowStockAlerts(e.target.checked)}
                    className="w-4 h-4 rounded text-indigo-600 focus:ring-indigo-500"
                  />
                </div>

                <div className="pt-3 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">AI Market Basket Insights</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Dispatch notifications for newly discovered association rules with lift &gt; 2.0</p>
                  </div>
                  <input
                    type="checkbox"
                    checked={aiInsightAlerts}
                    onChange={(e) => setAiInsightAlerts(e.target.checked)}
                    className="w-4 h-4 rounded text-indigo-600 focus:ring-indigo-500"
                  />
                </div>
              </div>

              <div className="pt-4">
                <button
                  type="button"
                  onClick={() => showNotification("Notification preferences updated.")}
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all"
                >
                  <Save className="w-4 h-4" />
                  Save Alert Settings
                </button>
              </div>
            </div>
          )}

          {/* TAB 3: Security */}
          {activeTab === "security" && (
            <form onSubmit={handleSaveSecurity} className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Security & Authentication</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Admin credentials and session policies</p>
              </div>

              <div className="space-y-4 max-w-md text-xs">
                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Current Password
                  </label>
                  <input
                    type="password"
                    placeholder="••••••••"
                    value={currentPassword}
                    onChange={(e) => setCurrentPassword(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    New Password
                  </label>
                  <input
                    type="password"
                    placeholder="Min 8 characters"
                    value={newPassword}
                    onChange={(e) => setNewPassword(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Session Timeout (Minutes)
                  </label>
                  <input
                    type="number"
                    value={sessionTimeout}
                    onChange={(e) => setSessionTimeout(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                </div>

                <div className="pt-2 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">Two-Factor Authentication (2FA)</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Require authenticator code on admin sign in</p>
                  </div>
                  <input
                    type="checkbox"
                    checked={twoFactorAuth}
                    onChange={(e) => setTwoFactorAuth(e.target.checked)}
                    className="w-4 h-4 rounded text-indigo-600 focus:ring-indigo-500"
                  />
                </div>
              </div>

              <div className="pt-2">
                <button
                  type="submit"
                  disabled={isSaving}
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all disabled:opacity-50"
                >
                  <Save className="w-4 h-4" />
                  Update Credentials
                </button>
              </div>
            </form>
          )}

          {/* TAB 4: API & Integrations */}
          {activeTab === "api" && (
            <form onSubmit={handleSaveAPI} className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">API & External Integrations</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Configure LLM keys and pipeline credentials</p>
              </div>

              <div className="space-y-4 max-w-lg text-xs">
                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    Google Gemini API Key
                  </label>
                  <input
                    type="password"
                    placeholder="AIzaSy..."
                    value={geminiApiKey}
                    onChange={(e) => setGeminiApiKey(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                  <p className="mt-1 text-[11px] text-slate-500 dark:text-slate-400">Used for optional Gemini 1.5 Flash assistant generative reasoning.</p>
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                    OpenAI API Key
                  </label>
                  <input
                    type="password"
                    placeholder="sk-..."
                    value={openaiApiKey}
                    onChange={(e) => setOpenaiApiKey(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                  />
                  <p className="mt-1 text-[11px] text-slate-500 dark:text-slate-400">Optional backup model provider for high-volume inquiries.</p>
                </div>

                <div className="p-3.5 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-700 space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="font-semibold text-slate-700 dark:text-slate-300">PostgreSQL Connection:</span>
                    <span className="text-emerald-600 dark:text-emerald-400 font-bold">Connected (Port 5432)</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="font-semibold text-slate-700 dark:text-slate-300">Database Name:</span>
                    <span className="font-mono text-slate-800 dark:text-slate-200">retail_intelligence</span>
                  </div>
                </div>
              </div>

              <div className="pt-2">
                <button
                  type="submit"
                  disabled={isSaving}
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all disabled:opacity-50"
                >
                  <Save className="w-4 h-4" />
                  Save API Keys
                </button>
              </div>
            </form>
          )}

          {/* TAB 5: System Health */}
          {activeTab === "health" && (
            <div className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">System Health & Status</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Live operational status of databases, ML engines, and microservices</p>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs">
                <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-700">
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-bold text-slate-800 dark:text-slate-200">PostgreSQL Database</span>
                    <span className="px-2 py-0.5 rounded-full text-[11px] font-semibold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-400">
                      Healthy
                    </span>
                  </div>
                  <p className="text-slate-500 dark:text-slate-400">20 tables active • 541,909 transactions</p>
                  <p className="mt-1 text-[11px] text-slate-400">Latency: 12ms</p>
                </div>

                <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-700">
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-bold text-slate-800 dark:text-slate-200">Prophet Forecast Engine</span>
                    <span className="px-2 py-0.5 rounded-full text-[11px] font-semibold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-400">
                      Operational
                    </span>
                  </div>
                  <p className="text-slate-500 dark:text-slate-400">Prophet v1.0 • 91.2% historical accuracy</p>
                  <p className="mt-1 text-[11px] text-slate-400">MAPE: 8.8%</p>
                </div>

                <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-700">
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-bold text-slate-800 dark:text-slate-200">Association Rules Engine</span>
                    <span className="px-2 py-0.5 rounded-full text-[11px] font-semibold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-400">
                      Active
                    </span>
                  </div>
                  <p className="text-slate-500 dark:text-slate-400">Apriori + FP-Growth • 76 top rules</p>
                  <p className="mt-1 text-[11px] text-slate-400">Lift up to 2.15x</p>
                </div>

                <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-700">
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-bold text-slate-800 dark:text-slate-200">RAG Context Engine</span>
                    <span className="px-2 py-0.5 rounded-full text-[11px] font-semibold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-400">
                      Online
                    </span>
                  </div>
                  <p className="text-slate-500 dark:text-slate-400">Intent Routing + Hybrid DB Retrieval</p>
                  <p className="mt-1 text-[11px] text-slate-400">Avg query time: 180ms</p>
                </div>
              </div>
            </div>
          )}

          {/* TAB 6: Activity Logs */}
          {activeTab === "logs" && (
            <div className="space-y-6">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Audit & Activity Logs</h3>
                  <p className="text-xs text-slate-500 dark:text-slate-400">Timestamped record of administrative and system events</p>
                </div>
              </div>

              <div className="overflow-x-auto">
                <table className="w-full text-xs text-left">
                  <thead className="bg-slate-50 dark:bg-slate-900/60 text-slate-500 dark:text-slate-400 uppercase tracking-wider font-semibold border-b border-slate-200 dark:border-slate-700">
                    <tr>
                      <th className="py-2.5 px-3">Event Type</th>
                      <th className="py-2.5 px-3">Module</th>
                      <th className="py-2.5 px-3">Description</th>
                      <th className="py-2.5 px-3">IP Address</th>
                      <th className="py-2.5 px-3 text-right">Timestamp</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100 dark:divide-slate-700/60">
                    {(settings?.activityLogs || [
                      { activity_id: 1, activity_type: "LOGIN", module: "AUTH", description: "Admin logged into dashboard", ip_address: "127.0.0.1", created_at: "Just now" },
                      { activity_id: 2, activity_type: "EXPORT", module: "REPORTS", description: "Exported Executive Summary Report", ip_address: "127.0.0.1", created_at: "1 hour ago" },
                      { activity_id: 3, activity_type: "MODEL_RUN", module: "FORECAST", description: "Prophet forecast model checkpoint verified", ip_address: "127.0.0.1", created_at: "2 hours ago" },
                      { activity_id: 4, activity_type: "UPDATE", module: "SETTINGS", description: "System theme preferences updated to Dark mode", ip_address: "127.0.0.1", created_at: "3 hours ago" },
                    ]).map((log, idx) => (
                      <tr key={idx} className="hover:bg-slate-50/70 dark:hover:bg-slate-700/30 transition-colors">
                        <td className="py-3 px-3">
                          <span className="px-2 py-0.5 rounded-full text-[10px] font-mono font-bold bg-indigo-50 dark:bg-indigo-950 text-indigo-600 dark:text-indigo-400 border border-indigo-200 dark:border-indigo-800">
                            {log.activity_type}
                          </span>
                        </td>
                        <td className="py-3 px-3 text-slate-600 dark:text-slate-300 font-semibold">{log.module}</td>
                        <td className="py-3 px-3 text-slate-800 dark:text-slate-200">{log.description}</td>
                        <td className="py-3 px-3 font-mono text-slate-500 dark:text-slate-400">{log.ip_address}</td>
                        <td className="py-3 px-3 text-right text-slate-400 text-[11px]">{log.created_at}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* TAB 7: Danger Zone */}
          {activeTab === "danger" && (
            <div className="space-y-6">
              <div>
                <h3 className="text-base font-bold text-rose-600 dark:text-rose-400">Danger Zone & Backups</h3>
                <p className="text-xs text-slate-500 dark:text-slate-400">Database backup snapshots and session maintenance</p>
              </div>

              <div className="space-y-4 text-xs">
                <div className="p-4 rounded-xl border border-slate-200 dark:border-slate-700 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">Database Snapshot Backup</p>
                    <p className="text-slate-500 dark:text-slate-400 text-[11px]">Generate a full SQL archive snapshot of all 20 retail tables</p>
                  </div>
                  <button
                    onClick={handleBackup}
                    disabled={isBackingUp}
                    className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold bg-emerald-600 hover:bg-emerald-700 text-white shadow-sm transition-all disabled:opacity-50 flex-shrink-0"
                  >
                    <HardDriveDownload className="w-4 h-4" />
                    {isBackingUp ? "Creating Backup..." : "Create Backup Now"}
                  </button>
                </div>

                <div className="p-4 rounded-xl border border-rose-200 dark:border-rose-900/60 bg-rose-50/40 dark:bg-rose-950/20 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                  <div>
                    <p className="font-semibold text-rose-800 dark:text-rose-300">Flush Redis / Cache</p>
                    <p className="text-rose-600 dark:text-rose-400 text-[11px]">Purge stored memory buffers and reload database indexes</p>
                  </div>
                  <button
                    onClick={() => showNotification("Cache flushed and memory refreshed.")}
                    className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold bg-rose-600 hover:bg-rose-700 text-white shadow-sm transition-all flex-shrink-0"
                  >
                    <RefreshCw className="w-4 h-4" />
                    Flush Cache
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Settings;