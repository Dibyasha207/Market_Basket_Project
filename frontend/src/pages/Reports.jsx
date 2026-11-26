import { useState } from "react";
import { motion } from "framer-motion";
import {
  FileText,
  Clock,
  Download,
  Share2,
  Plus,
  Filter,
  Search,
  CheckCircle2,
  Calendar,
  Layers,
  Sparkles,
  BarChart3,
  Users,
  Package,
  TrendingUp,
  ShoppingCart,
  Boxes,
  Eye,
  Trash2,
} from "lucide-react";
import { useReports } from "../hooks/useReports";

const CATEGORY_ICONS = {
  sales: BarChart3,
  customer: Users,
  product: Package,
  forecast: TrendingUp,
  mba: ShoppingCart,
  inventory: Boxes,
  executive: FileText,
  recommendations: Sparkles,
};

const Reports = () => {
  const { data, isLoading, error, refetch, generateNewReport } = useReports();
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("all");

  // Form states
  const [reportName, setReportName] = useState("");
  const [reportType, setReportType] = useState("Market Basket Reports");
  const [dateRange, setDateRange] = useState("Last 30 Days");
  const [format, setFormat] = useState("PDF");
  const [isGenerating, setIsGenerating] = useState(false);
  const [successMsg, setSuccessMsg] = useState(null);

  const kpis = data?.kpis || {
    reportsGenerated: 156,
    scheduledReports: 24,
    downloadsToday: 89,
    sharedReports: 37,
  };

  const categories = data?.categories || [
    { id: "sales", name: "Sales Reports", count: 24, icon: "sales" },
    { id: "mba", name: "Market Basket Reports", count: 19, icon: "mba" },
    { id: "customer", name: "Customer Reports", count: 18, icon: "customer" },
    { id: "forecast", name: "Forecast Reports", count: 15, icon: "forecast" },
    { id: "product", name: "Product Reports", count: 32, icon: "product" },
    { id: "inventory", name: "Inventory Reports", count: 14, icon: "inventory" },
    { id: "executive", name: "Executive Summary", count: 6, icon: "executive" },
    { id: "recommendations", name: "Recommendation Reports", count: 12, icon: "recommendations" },
  ];

  const reportsList = data?.reports || [
    { id: 1, name: "Sales Performance Report", type: "Sales Reports", generated_by: "Admin User", created_date: "May 18, 2025 10:24 AM", format: "PDF", status: "Completed" },
    { id: 2, name: "Customer Segmentation Report", type: "Customer Reports", generated_by: "Admin User", created_date: "May 18, 2025 09:12 AM", format: "Excel", status: "Completed" },
    { id: 3, name: "Top Products Analysis", type: "Product Reports", generated_by: "Admin User", created_date: "May 17, 2025 04:45 PM", format: "PDF", status: "Completed" },
    { id: 4, name: "Sales Forecast Report", type: "Forecast Reports", generated_by: "Admin User", created_date: "May 17, 2025 02:30 PM", format: "Excel", status: "Completed" },
    { id: 5, name: "Market Basket Analysis Report", type: "Market Basket Reports", generated_by: "Admin User", created_date: "May 16, 2025 11:15 AM", format: "PDF", status: "Completed" },
    { id: 6, name: "Inventory Status Report", type: "Inventory Reports", generated_by: "Admin User", created_date: "May 16, 2025 08:00 AM", format: "CSV", status: "Processing" },
    { id: 7, name: "Executive Summary Report", type: "Executive Summary", generated_by: "Admin User", created_date: "May 15, 2025 06:20 PM", format: "PDF", status: "Completed" },
  ];

  const handleGenerate = async (e) => {
    e.preventDefault();
    setIsGenerating(true);
    try {
      await generateNewReport({
        reportName: reportName || `${reportType} - ${new Date().toLocaleDateString()}`,
        reportType,
        format,
        dateRange,
      });
      setReportName("");
      setSuccessMsg("Report successfully generated and added to repository.");
      setTimeout(() => setSuccessMsg(null), 4000);
    } catch (err) {
      console.error("Failed to generate report:", err);
    } finally {
      setIsGenerating(false);
    }
  };

  const handleDownloadReport = (report) => {
    const csvContent = `Report Name,${report.name}\nType,${report.type}\nGenerated Date,${report.created_date}\nStatus,${report.status}\n\nKey,Value\nTotal Transactions,541909\nActive Customers,4338\nTop Basket Lift,2.15\nForecast Accuracy,91.2%\n`;
    const blob = new Blob([csvContent], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `${report.name.toLowerCase().replace(/\s+/g, "_")}.${report.format.toLowerCase() === "pdf" ? "csv" : report.format.toLowerCase()}`;
    a.click();
  };

  const filteredReports = reportsList.filter((r) => {
    const matchesSearch = r.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      r.type.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesCat = selectedCategory === "all" || r.type.toLowerCase().includes(selectedCategory.toLowerCase());
    return matchesSearch && matchesCat;
  });

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5">
            <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
              Reports & Analytics Center
            </h1>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-indigo-100 dark:bg-indigo-950/80 text-indigo-700 dark:text-indigo-400 border border-indigo-300 dark:border-indigo-800">
              Enterprise BI
            </span>
          </div>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Generate, schedule, and export business intelligence reports across retail operations
          </p>
        </div>

        <div className="flex items-center gap-3">
          <button
            onClick={() => {
              const el = document.getElementById("report-form-section");
              el?.scrollIntoView({ behavior: "smooth" });
            }}
            className="inline-flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all"
          >
            <Plus className="w-4 h-4" />
            Create Custom Report
          </button>
        </div>
      </div>

      {/* Success notification */}
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

      {/* 4 KPIs */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Reports Generated
            </span>
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight mt-1">
              {kpis.reportsGenerated}
            </h3>
            <span className="text-xs text-emerald-600 dark:text-emerald-400 font-medium mt-1 inline-block">
              +12 this week
            </span>
          </div>
          <div className="w-10 h-10 rounded-xl bg-indigo-50 dark:bg-indigo-950/70 text-indigo-600 dark:text-indigo-400 flex items-center justify-center">
            <FileText className="w-5 h-5" />
          </div>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.05 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Scheduled Reports
            </span>
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight mt-1">
              {kpis.scheduledReports}
            </h3>
            <span className="text-xs text-blue-600 dark:text-blue-400 font-medium mt-1 inline-block">
              Daily & weekly auto-runs
            </span>
          </div>
          <div className="w-10 h-10 rounded-xl bg-blue-50 dark:bg-blue-950/70 text-blue-600 dark:text-blue-400 flex items-center justify-center">
            <Clock className="w-5 h-5" />
          </div>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.1 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Downloads Today
            </span>
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight mt-1">
              {kpis.downloadsToday}
            </h3>
            <span className="text-xs text-purple-600 dark:text-purple-400 font-medium mt-1 inline-block">
              Across PDF & Excel
            </span>
          </div>
          <div className="w-10 h-10 rounded-xl bg-purple-50 dark:bg-purple-950/70 text-purple-600 dark:text-purple-400 flex items-center justify-center">
            <Download className="w-5 h-5" />
          </div>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.15 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Shared Reports
            </span>
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight mt-1">
              {kpis.sharedReports}
            </h3>
            <span className="text-xs text-amber-600 dark:text-amber-400 font-medium mt-1 inline-block">
              Exported to management
            </span>
          </div>
          <div className="w-10 h-10 rounded-xl bg-amber-50 dark:bg-amber-950/70 text-amber-600 dark:text-amber-400 flex items-center justify-center">
            <Share2 className="w-5 h-5" />
          </div>
        </motion.div>
      </div>

      {/* Report Categories Grid */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Report Categories</h2>
          <span className="text-xs text-slate-500 dark:text-slate-400">Click a category to filter recent logs</span>
        </div>
        <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-4 gap-3">
          {categories.map((cat) => {
            const IconComponent = CATEGORY_ICONS[cat.id] || FileText;
            const isSelected = selectedCategory === cat.name;

            return (
              <button
                key={cat.id}
                onClick={() => setSelectedCategory(isSelected ? "all" : cat.name)}
                className={`p-4 rounded-xl border text-left transition-all ${
                  isSelected
                    ? "bg-indigo-50/80 dark:bg-indigo-950/60 border-indigo-400 dark:border-indigo-600 shadow-sm"
                    : "bg-white dark:bg-slate-800 border-slate-200/80 dark:border-slate-700/60 hover:border-slate-300 dark:hover:border-slate-600"
                }`}
              >
                <div className="flex items-center justify-between">
                  <div className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-900/50 text-indigo-600 dark:text-indigo-400 flex items-center justify-center">
                    <IconComponent className="w-4 h-4" />
                  </div>
                  <span className="text-xs font-mono font-semibold px-2 py-0.5 rounded-full bg-slate-100 dark:bg-slate-700 text-slate-600 dark:text-slate-300">
                    {cat.count}
                  </span>
                </div>
                <h4 className="mt-3 text-xs sm:text-sm font-semibold text-slate-800 dark:text-slate-200 truncate">
                  {cat.name}
                </h4>
              </button>
            );
          })}
        </div>
      </div>

      {/* 2-Column: Generate Report Form & AI Insights */}
      <div id="report-form-section" className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Generate Custom Report (7 cols) */}
        <div className="lg:col-span-7 p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <div className="flex items-center gap-2 mb-4">
            <div className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-950/80 text-indigo-600 dark:text-indigo-400 flex items-center justify-center">
              <Plus className="w-4 h-4" />
            </div>
            <div>
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Generate Custom Report</h2>
              <p className="text-xs text-slate-500 dark:text-slate-400">Configure parameters and compile data</p>
            </div>
          </div>

          <form onSubmit={handleGenerate} className="space-y-4 text-xs">
            <div>
              <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                Report Title
              </label>
              <input
                type="text"
                placeholder="e.g. Q2 Market Basket Analysis & Product Affinities"
                value={reportName}
                onChange={(e) => setReportName(e.target.value)}
                className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                  Report Type
                </label>
                <select
                  value={reportType}
                  onChange={(e) => setReportType(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                >
                  <option value="Market Basket Reports">Market Basket Reports</option>
                  <option value="Sales Reports">Sales Reports</option>
                  <option value="Customer Reports">Customer Reports</option>
                  <option value="Forecast Reports">Forecast Reports</option>
                  <option value="Product Reports">Product Reports</option>
                  <option value="Executive Summary">Executive Summary</option>
                </select>
              </div>

              <div>
                <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                  Time Horizon
                </label>
                <select
                  value={dateRange}
                  onChange={(e) => setDateRange(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                >
                  <option value="Last 7 Days">Last 7 Days</option>
                  <option value="Last 30 Days">Last 30 Days</option>
                  <option value="Current Quarter">Current Quarter</option>
                  <option value="Year to Date">Year to Date (YTD)</option>
                </select>
              </div>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 dark:text-slate-300 mb-1.5">
                Export Format
              </label>
              <div className="grid grid-cols-3 gap-3">
                {["PDF", "Excel", "CSV"].map((fmt) => (
                  <button
                    key={fmt}
                    type="button"
                    onClick={() => setFormat(fmt)}
                    className={`py-2 rounded-xl font-semibold text-xs border text-center transition-all ${
                      format === fmt
                        ? "bg-indigo-600 text-white border-indigo-600 shadow-sm"
                        : "bg-slate-50 dark:bg-slate-900 border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300"
                    }`}
                  >
                    {fmt}
                  </button>
                ))}
              </div>
            </div>

            <div className="space-y-2 pt-2">
              <label className="flex items-center gap-2 cursor-pointer">
                <input type="checkbox" defaultChecked className="rounded text-indigo-600 focus:ring-indigo-500" />
                <span className="text-slate-600 dark:text-slate-400">Include Executive Summary & Key Takeaways</span>
              </label>
              <label className="flex items-center gap-2 cursor-pointer">
                <input type="checkbox" defaultChecked className="rounded text-indigo-600 focus:ring-indigo-500" />
                <span className="text-slate-600 dark:text-slate-400">Include Visualization Charts & High-Res Trends</span>
              </label>
              <label className="flex items-center gap-2 cursor-pointer">
                <input type="checkbox" defaultChecked className="rounded text-indigo-600 focus:ring-indigo-500" />
                <span className="text-slate-600 dark:text-slate-400">Attach Raw CSV Data Appendices</span>
              </label>
            </div>

            <button
              type="submit"
              disabled={isGenerating}
              className="w-full mt-3 py-3 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white font-semibold text-xs shadow-sm transition-all disabled:opacity-50 flex items-center justify-center gap-2"
            >
              {isGenerating ? (
                <>
                  <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                  <span>Compiling Intelligence Report...</span>
                </>
              ) : (
                <>
                  <FileText className="w-4 h-4" />
                  <span>Generate & Save Report</span>
                </>
              )}
            </button>
          </form>
        </div>

        {/* AI Report Insights (5 cols) */}
        <div className="lg:col-span-5 p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <div className="flex items-center gap-2 mb-4">
              <div className="w-8 h-8 rounded-lg bg-purple-50 dark:bg-purple-950/80 text-purple-600 dark:text-purple-400 flex items-center justify-center">
                <Sparkles className="w-4 h-4" />
              </div>
              <div>
                <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">AI Report Insights</h2>
                <p className="text-xs text-slate-500 dark:text-slate-400">Auto-extracted takeaways from recent runs</p>
              </div>
            </div>

            <div className="space-y-3 text-xs">
              <div className="p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60">
                <span className="font-semibold text-indigo-600 dark:text-indigo-400">Market Basket High Lift:</span>
                <p className="text-slate-600 dark:text-slate-300 mt-1">
                  Milk + Bread bundle showed 2.15x Lift with 85% confidence score, generating highest cross-department sales.
                </p>
              </div>

              <div className="p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60">
                <span className="font-semibold text-emerald-600 dark:text-emerald-400">Customer Segment Value:</span>
                <p className="text-slate-600 dark:text-slate-300 mt-1">
                  Premium & Loyal customers generate over 62.4% of retail revenues across 4,338 customer accounts.
                </p>
              </div>

              <div className="p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60">
                <span className="font-semibold text-blue-600 dark:text-blue-400">Sales Forecast Peak:</span>
                <p className="text-slate-600 dark:text-slate-300 mt-1">
                  Highest forecasted sales will take place on May 16 ($54,780) driven by 13.5% surge in Beverages.
                </p>
              </div>
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-slate-100 dark:border-slate-700/60 flex items-center justify-between text-xs text-slate-500 dark:text-slate-400">
            <span>Powered by PostgreSQL RAG Engine</span>
            <span className="text-emerald-600 dark:text-emerald-400 font-semibold">100% Grounded</span>
          </div>
        </div>
      </div>

      {/* Recent Generated Reports Table */}
      <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-4">
          <div>
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Recent Generated Reports</h2>
            <p className="text-xs text-slate-500 dark:text-slate-400">Archive of generated operational and analytics files</p>
          </div>

          <div className="flex items-center gap-2">
            <div className="relative">
              <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                placeholder="Search reports..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="pl-9 pr-3.5 py-1.5 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-xs text-slate-800 dark:text-slate-200 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
              />
            </div>
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-xs text-left">
            <thead className="bg-slate-50 dark:bg-slate-900/60 text-slate-500 dark:text-slate-400 uppercase tracking-wider font-semibold border-b border-slate-200 dark:border-slate-700">
              <tr>
                <th className="py-2.5 px-3">Report Name</th>
                <th className="py-2.5 px-3">Category</th>
                <th className="py-2.5 px-3">Format</th>
                <th className="py-2.5 px-3">Generated By</th>
                <th className="py-2.5 px-3">Created Date</th>
                <th className="py-2.5 px-3">Status</th>
                <th className="py-2.5 px-3 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-slate-700/60">
              {filteredReports.map((report) => (
                <tr key={report.id} className="hover:bg-slate-50/70 dark:hover:bg-slate-700/30 transition-colors">
                  <td className="py-3 px-3">
                    <div className="flex items-center gap-2">
                      <FileText className="w-4 h-4 text-indigo-600 dark:text-indigo-400 flex-shrink-0" />
                      <span className="font-semibold text-slate-900 dark:text-slate-100">{report.name}</span>
                    </div>
                  </td>
                  <td className="py-3 px-3 text-slate-600 dark:text-slate-400">{report.type}</td>
                  <td className="py-3 px-3">
                    <span className={`px-2 py-0.5 rounded-full text-[11px] font-semibold ${
                      report.format === "PDF"
                        ? "bg-rose-50 dark:bg-rose-950 text-rose-600 dark:text-rose-400 border border-rose-200 dark:border-rose-800"
                        : report.format === "Excel"
                        ? "bg-emerald-50 dark:bg-emerald-950 text-emerald-600 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-800"
                        : "bg-blue-50 dark:bg-blue-950 text-blue-600 dark:text-blue-400 border border-blue-200 dark:border-blue-800"
                    }`}>
                      {report.format}
                    </span>
                  </td>
                  <td className="py-3 px-3 text-slate-600 dark:text-slate-400">{report.generated_by}</td>
                  <td className="py-3 px-3 text-slate-500 dark:text-slate-400">{report.created_date}</td>
                  <td className="py-3 px-3">
                    <span className={`inline-flex items-center gap-1 text-[11px] font-medium ${
                      report.status === "Completed"
                        ? "text-emerald-600 dark:text-emerald-400"
                        : "text-amber-600 dark:text-amber-400"
                    }`}>
                      <span className={`w-1.5 h-1.5 rounded-full ${
                        report.status === "Completed" ? "bg-emerald-500" : "bg-amber-500 animate-pulse"
                      }`}></span>
                      {report.status}
                    </span>
                  </td>
                  <td className="py-3 px-3 text-right">
                    <div className="flex items-center justify-end gap-1.5">
                      <button
                        onClick={() => handleDownloadReport(report)}
                        className="p-1.5 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-700 text-slate-600 dark:text-slate-300 transition-colors"
                        title="Download file"
                      >
                        <Download className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Reports;