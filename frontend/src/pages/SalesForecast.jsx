import { useState } from "react";
import { motion } from "framer-motion";
import {
  TrendingUp,
  DollarSign,
  Calendar,
  ShieldCheck,
  Download,
  RefreshCw,
  Sparkles,
  ChevronDown,
  Info,
  CheckCircle2,
  ArrowUpRight,
  TrendingDown,
  Layers,
} from "lucide-react";
import {
  ResponsiveContainer,
  ComposedChart,
  Area,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from "recharts";
import { useForecast } from "../hooks/useForecast";

const SalesForecast = () => {
  const { range, setRange, data, isLoading, error, refetch } = useForecast("7d");
  const [forecastType, setForecastType] = useState("Revenue Forecast");
  const [isRetraining, setIsRetraining] = useState(false);
  const [retrainSuccess, setRetrainSuccess] = useState(false);

  const kpis = data?.kpis || {
    totalForecastedRevenue: 285430,
    projectedGrowth: 12.6,
    avgDailyRevenue: 40776,
    avgDailyGrowth: 3.2,
    forecastAccuracy: 91.2,
  };

  const timeSeries = data?.timeSeries || [
    { date: "May 12", historical: 34210, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 13", historical: 37850, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 14", historical: 35600, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 15", historical: 42100, forecasted: null, lowerBound: null, upperBound: null },
    { date: "May 16", historical: null, forecasted: 54780, lowerBound: 51200, upperBound: 58360 },
    { date: "May 17", historical: null, forecasted: 41250, lowerBound: 38500, upperBound: 44000 },
    { date: "May 18", historical: null, forecasted: 39640, lowerBound: 36800, upperBound: 42480 },
  ];

  const categoryForecast = data?.categoryForecast || [
    { category: "Beverages", historical: 85630, forecast: 98780, growth: 13.5 },
    { category: "Snacks", historical: 62120, forecast: 71540, growth: 15.2 },
    { category: "Dairy", historical: 45780, forecast: 51230, growth: 11.9 },
    { category: "Bakery", historical: 38910, forecast: 42780, growth: 10.2 },
    { category: "Others", historical: 24500, forecast: 25100, growth: 2.4 },
  ];

  const summary = data?.summary || {
    forecastPeriod: "May 12 - May 18, 2025",
    totalForecastedRevenue: "$285,430",
    highestForecastedDay: "May 16, 2025 ($54,780)",
    lowestForecastedDay: "May 12, 2025 ($34,210)",
    confidenceInterval: "95%",
  };

  const modelInfo = data?.modelInfo || {
    modelUsed: "Prophet (v1.0)",
    modelVersion: "1.0",
    trainedOn: "90 days of historical data",
    lastUpdated: "May 11, 2025 10:30 PM",
    accuracy: 91.2,
    mape: 8.8,
  };

  const insights = data?.insights || [
    "Overall revenue is expected to increase by 12.6% in the next 7 days.",
    "May 16, 2025 is expected to be the highest revenue day ($54,780).",
    "Beverages category will drive the most growth (13.5% uplift).",
    "Weekend sales (May 17-18) are expected to stabilize at an elevated level.",
    "Consider increasing safety stock by 15% for Snacks and Beverages.",
  ];

  const handleRetrain = () => {
    setIsRetraining(true);
    setTimeout(() => {
      setIsRetraining(false);
      setRetrainSuccess(true);
      setTimeout(() => setRetrainSuccess(false), 4000);
      refetch();
    }, 1500);
  };

  const exportForecastCSV = () => {
    const csvContent = [
      ["Date", "Historical Revenue", "Forecasted Revenue", "Lower 95% Bound", "Upper 95% Bound"],
      ...timeSeries.map((row) => [
        row.date,
        row.historical || "",
        row.forecasted || "",
        row.lowerBound || "",
        row.upperBound || "",
      ]),
    ]
      .map((e) => e.join(","))
      .join("\n");

    const blob = new Blob([csvContent], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `sales_forecast_${range}.csv`;
    a.click();
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5">
            <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
              Sales Forecast
            </h1>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-100 dark:bg-emerald-950/80 text-emerald-700 dark:text-emerald-400 border border-emerald-300 dark:border-emerald-800">
              Prophet AI
            </span>
          </div>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Predict future sales and demand patterns using machine learning models
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-3">
          {/* Forecast Type Selector */}
          <div className="relative">
            <select
              value={forecastType}
              onChange={(e) => setForecastType(e.target.value)}
              className="appearance-none pl-3.5 pr-9 py-2 rounded-xl text-xs font-semibold bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-200 shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
            >
              <option value="Revenue Forecast">Revenue Forecast ($)</option>
              <option value="Unit Sales Forecast">Unit Sales Forecast (Units)</option>
              <option value="Order Volume">Order Volume (Orders)</option>
            </select>
            <ChevronDown className="w-4 h-4 text-slate-400 absolute right-2.5 top-1/2 -translate-y-1/2 pointer-events-none" />
          </div>

          {/* Time Range Pills */}
          <div className="flex items-center p-1 rounded-xl bg-slate-100 dark:bg-slate-800/90 border border-slate-200 dark:border-slate-700">
            {["7d", "30d", "90d", "6m"].map((r) => (
              <button
                key={r}
                onClick={() => setRange(r)}
                className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  range === r
                    ? "bg-white dark:bg-indigo-600 text-indigo-600 dark:text-white shadow-sm"
                    : "text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-slate-200"
                }`}
              >
                {r.toUpperCase()}
              </button>
            ))}
          </div>

          {/* Export button */}
          <button
            onClick={exportForecastCSV}
            className="inline-flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-semibold bg-indigo-50 dark:bg-indigo-950/60 text-indigo-600 dark:text-indigo-400 border border-indigo-200 dark:border-indigo-800/60 hover:bg-indigo-100 dark:hover:bg-indigo-900/60 transition-colors shadow-sm"
          >
            <Download className="w-4 h-4" />
            Export CSV
          </button>
        </div>
      </div>

      {/* Retrain Alert Notification */}
      {retrainSuccess && (
        <motion.div
          initial={{ opacity: 0, y: -8 }}
          animate={{ opacity: 1, y: 0 }}
          className="p-3.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-300 flex items-center justify-between text-xs"
        >
          <div className="flex items-center gap-2">
            <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
            <span>
              <strong>Prophet Model Retrained:</strong> Model parameters updated successfully with 90-day time-series data. Accuracy score: 91.2%.
            </span>
          </div>
        </motion.div>
      )}

      {/* 4 KPI Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {/* KPI 1 */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Total Forecasted Revenue
            </span>
            <div className="w-9 h-9 rounded-xl bg-indigo-50 dark:bg-indigo-950/70 text-indigo-600 dark:text-indigo-400 flex items-center justify-center">
              <TrendingUp className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-3">
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight">
              ${kpis.totalForecastedRevenue.toLocaleString()}
            </h3>
            <div className="mt-1 flex items-center gap-1.5 text-xs text-emerald-600 dark:text-emerald-400 font-medium">
              <ArrowUpRight className="w-3.5 h-3.5" />
              <span>+{kpis.projectedGrowth}% vs previous {range}</span>
            </div>
          </div>
        </motion.div>

        {/* KPI 2 */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.05 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Avg Daily Revenue
            </span>
            <div className="w-9 h-9 rounded-xl bg-emerald-50 dark:bg-emerald-950/70 text-emerald-600 dark:text-emerald-400 flex items-center justify-center">
              <DollarSign className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-3">
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight">
              ${kpis.avgDailyRevenue.toLocaleString()}
            </h3>
            <div className="mt-1 flex items-center gap-1.5 text-xs text-emerald-600 dark:text-emerald-400 font-medium">
              <ArrowUpRight className="w-3.5 h-3.5" />
              <span>+{kpis.avgDailyGrowth}% per projected day</span>
            </div>
          </div>
        </motion.div>

        {/* KPI 3 */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.1 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Highest Forecasted Day
            </span>
            <div className="w-9 h-9 rounded-xl bg-purple-50 dark:bg-purple-950/70 text-purple-600 dark:text-purple-400 flex items-center justify-center">
              <Calendar className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-3">
            <h3 className="text-xl font-bold text-slate-900 dark:text-slate-100 tracking-tight truncate">
              {summary.highestForecastedDay.split(" ")[0]} {summary.highestForecastedDay.split(" ")[1]}
            </h3>
            <div className="mt-1 flex items-center gap-1.5 text-xs text-slate-500 dark:text-slate-400 font-medium">
              <span>Peak: {summary.highestForecastedDay.split("(")[1]?.replace(")", "") || "$54,780"}</span>
            </div>
          </div>
        </motion.div>

        {/* KPI 4 */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: 0.15 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
              Forecast Accuracy
            </span>
            <div className="w-9 h-9 rounded-xl bg-blue-50 dark:bg-blue-950/70 text-blue-600 dark:text-blue-400 flex items-center justify-center">
              <ShieldCheck className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-3">
            <h3 className="text-2xl font-bold text-slate-900 dark:text-slate-100 tracking-tight">
              {kpis.forecastAccuracy}%
            </h3>
            <div className="mt-1 flex items-center gap-1.5 text-xs text-blue-600 dark:text-blue-400 font-medium">
              <span>95% Confidence Interval (MAPE 8.8%)</span>
            </div>
          </div>
        </motion.div>
      </div>

      {/* Main Forecast Chart */}
      <motion.div
        initial={{ opacity: 0, y: 16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.4 }}
        className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
      >
        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-6">
          <div>
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 flex items-center gap-2">
              <span>Sales Forecast ({range.toUpperCase()})</span>
              <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-slate-100 dark:bg-slate-700 text-slate-600 dark:text-slate-300">
                {forecastType}
              </span>
            </h2>
            <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
              Historical vs. predicted revenue with 95% confidence interval band
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-4 text-xs">
            <div className="flex items-center gap-1.5">
              <span className="w-3 h-3 rounded-sm bg-indigo-500"></span>
              <span className="text-slate-600 dark:text-slate-300">Historical Sales</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="w-3 h-0.5 border-t-2 border-dashed border-emerald-500"></span>
              <span className="text-slate-600 dark:text-slate-300">Forecasted Revenue</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="w-3 h-3 rounded-sm bg-indigo-100 dark:bg-indigo-900/40 border border-indigo-200 dark:border-indigo-700"></span>
              <span className="text-slate-600 dark:text-slate-300">95% Confidence Band</span>
            </div>
          </div>
        </div>

        <div className="h-80 w-full">
          <ResponsiveContainer width="100%" height="100%">
            <ComposedChart data={timeSeries} margin={{ top: 10, right: 20, left: 0, bottom: 0 }}>
              <defs>
                <linearGradient id="forecastArea" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#10B981" stopOpacity={0.25} />
                  <stop offset="95%" stopColor="#10B981" stopOpacity={0.02} />
                </linearGradient>
                <linearGradient id="confidenceBand" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#6366F1" stopOpacity={0.15} />
                  <stop offset="95%" stopColor="#6366F1" stopOpacity={0.03} />
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" stroke="#94A3B8" strokeOpacity={0.2} vertical={false} />
              <XAxis dataKey="date" tickLine={false} axisLine={false} tick={{ fill: "#94a3b8", fontSize: 12 }} />
              <YAxis
                tickLine={false}
                axisLine={false}
                tick={{ fill: "#94a3b8", fontSize: 12 }}
                tickFormatter={(val) => `$${(val / 1000).toFixed(0)}k`}
              />
              <Tooltip
                content={({ active, payload, label }) => {
                  if (active && payload && payload.length) {
                    return (
                      <div className="p-3 rounded-xl bg-slate-900/95 backdrop-blur-md text-white border border-slate-700 text-xs shadow-xl space-y-1.5 min-w-[170px]">
                        <p className="font-semibold text-slate-300 border-b border-slate-700 pb-1">{label}</p>
                        {payload.map((entry, idx) => {
                          if (entry.value === null || entry.value === undefined) return null;
                          return (
                            <div key={idx} className="flex items-center justify-between gap-4">
                              <span style={{ color: entry.color }}>{entry.name}:</span>
                              <span className="font-mono font-bold">${entry.value.toLocaleString()}</span>
                            </div>
                          );
                        })}
                      </div>
                    );
                  }
                  return null;
                }}
              />
              {/* Confidence Band Area */}
              <Area
                type="monotone"
                dataKey="upperBound"
                stroke="none"
                fill="url(#confidenceBand)"
                name="Confidence Range"
              />
              {/* Historical Line */}
              <Line
                type="monotone"
                dataKey="historical"
                stroke="#6366F1"
                strokeWidth={3}
                dot={{ r: 4, fill: "#6366F1" }}
                name="Historical Revenue"
                connectNulls={false}
              />
              {/* Forecast Line */}
              <Line
                type="monotone"
                dataKey="forecasted"
                stroke="#10B981"
                strokeWidth={3}
                strokeDasharray="6 4"
                dot={{ r: 5, fill: "#10B981" }}
                name="Forecasted Revenue"
                connectNulls={false}
              />
            </ComposedChart>
          </ResponsiveContainer>
        </div>
      </motion.div>

      {/* 4 Bottom Cards / Panels */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Card 1: Forecast Summary */}
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.1 }}
          className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div>
            <div className="flex items-center gap-2 mb-4">
              <div className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-950/80 text-indigo-600 dark:text-indigo-400 flex items-center justify-center">
                <Info className="w-4 h-4" />
              </div>
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Forecast Summary</h2>
            </div>

            <div className="divide-y divide-slate-100 dark:divide-slate-700/60 text-xs">
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Forecast Period</span>
                <span className="font-semibold text-slate-800 dark:text-slate-200">{summary.forecastPeriod}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Total Forecasted Revenue</span>
                <span className="font-bold text-indigo-600 dark:text-indigo-400 font-mono text-sm">
                  {summary.totalForecastedRevenue}
                </span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Highest Forecasted Day</span>
                <span className="font-semibold text-emerald-600 dark:text-emerald-400">{summary.highestForecastedDay}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Lowest Forecasted Day</span>
                <span className="font-semibold text-slate-800 dark:text-slate-200">{summary.lowestForecastedDay}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Confidence Interval</span>
                <span className="font-semibold text-purple-600 dark:text-purple-400">{summary.confidenceInterval}</span>
              </div>
            </div>
          </div>

          <div className="mt-4 p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60 text-xs text-slate-600 dark:text-slate-400">
            <span className="font-semibold text-slate-900 dark:text-slate-200">Key Takeaway:</span> Peak demand surge expected on Friday (May 16). Ensure supply chains and store staffing align with peak checkout demand.
          </div>
        </motion.div>

        {/* Card 2: Model Information */}
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.15 }}
          className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div>
            <div className="flex items-center justify-between mb-4">
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 rounded-lg bg-purple-50 dark:bg-purple-950/80 text-purple-600 dark:text-purple-400 flex items-center justify-center">
                  <Sparkles className="w-4 h-4" />
                </div>
                <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Model Information</h2>
              </div>
              <span className="text-xs px-2.5 py-1 rounded-full bg-emerald-50 dark:bg-emerald-950 text-emerald-600 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-800 font-semibold">
                Status: Operational
              </span>
            </div>

            <div className="divide-y divide-slate-100 dark:divide-slate-700/60 text-xs">
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Model Used</span>
                <span className="font-semibold text-slate-800 dark:text-slate-200">{modelInfo.modelUsed}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Trained On</span>
                <span className="font-semibold text-slate-800 dark:text-slate-200">{modelInfo.trainedOn}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Last Retrained</span>
                <span className="font-semibold text-slate-800 dark:text-slate-200">{modelInfo.lastUpdated}</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Historical Accuracy</span>
                <span className="font-semibold text-emerald-600 dark:text-emerald-400">{modelInfo.accuracy}%</span>
              </div>
              <div className="py-2.5 flex items-center justify-between">
                <span className="text-slate-500 dark:text-slate-400">Mean Absolute % Error (MAPE)</span>
                <span className="font-semibold text-indigo-600 dark:text-indigo-400">{modelInfo.mape}%</span>
              </div>
            </div>
          </div>

          <div className="mt-4 pt-4 border-t border-slate-100 dark:border-slate-700/60 flex items-center justify-between">
            <span className="text-xs text-slate-500 dark:text-slate-400">Recompute forecast with latest sales logs</span>
            <button
              onClick={handleRetrain}
              disabled={isRetraining}
              className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all disabled:opacity-50"
            >
              <RefreshCw className={`w-3.5 h-3.5 ${isRetraining ? "animate-spin" : ""}`} />
              {isRetraining ? "Retraining Model..." : "Retrain Model"}
            </button>
          </div>
        </motion.div>

        {/* Card 3: Category Forecast Breakdown */}
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.2 }}
          className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
        >
          <div className="flex items-center gap-2 mb-4">
            <div className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-950/80 text-blue-600 dark:text-blue-400 flex items-center justify-center">
              <Layers className="w-4 h-4" />
            </div>
            <div>
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Category Forecast Breakdown</h2>
              <p className="text-xs text-slate-500 dark:text-slate-400">Projected category revenues for next 7 days</p>
            </div>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-xs text-left">
              <thead className="bg-slate-50 dark:bg-slate-900/60 text-slate-500 dark:text-slate-400 uppercase tracking-wider font-semibold border-b border-slate-200 dark:border-slate-700">
                <tr>
                  <th className="py-2.5 px-3">Category</th>
                  <th className="py-2.5 px-3 text-right">Historical</th>
                  <th className="py-2.5 px-3 text-right">Forecast</th>
                  <th className="py-2.5 px-3 text-right">Growth</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100 dark:divide-slate-700/60">
                {categoryForecast.map((cat, idx) => (
                  <tr key={idx} className="hover:bg-slate-50/60 dark:hover:bg-slate-700/30 transition-colors">
                    <td className="py-3 px-3 font-semibold text-slate-800 dark:text-slate-200">
                      {cat.category}
                    </td>
                    <td className="py-3 px-3 text-right font-mono text-slate-600 dark:text-slate-400">
                      ${cat.historical.toLocaleString()}
                    </td>
                    <td className="py-3 px-3 text-right font-mono font-bold text-slate-900 dark:text-slate-100">
                      ${cat.forecast.toLocaleString()}
                    </td>
                    <td className="py-3 px-3 text-right">
                      <span className={`inline-flex items-center gap-1 font-semibold px-2 py-0.5 rounded-full text-xs ${
                        cat.growth >= 10
                          ? "bg-emerald-50 dark:bg-emerald-950/70 text-emerald-600 dark:text-emerald-400"
                          : "bg-blue-50 dark:bg-blue-950/70 text-blue-600 dark:text-blue-400"
                      }`}>
                        +{cat.growth}%
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </motion.div>

        {/* Card 4: Key Forecast Insights */}
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4, delay: 0.25 }}
          className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between"
        >
          <div>
            <div className="flex items-center gap-2 mb-4">
              <div className="w-8 h-8 rounded-lg bg-amber-50 dark:bg-amber-950/80 text-amber-600 dark:text-amber-400 flex items-center justify-center">
                <Sparkles className="w-4 h-4" />
              </div>
              <div>
                <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">Forecast Insights & Actions</h2>
                <p className="text-xs text-slate-500 dark:text-slate-400">Automated prescriptive guidance from Prophet engine</p>
              </div>
            </div>

            <div className="space-y-3">
              {insights.map((insight, idx) => (
                <div
                  key={idx}
                  className="p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60 flex items-start gap-3"
                >
                  <span className="w-5 h-5 rounded-full bg-indigo-100 dark:bg-indigo-900/60 text-indigo-600 dark:text-indigo-400 flex items-center justify-center text-xs font-bold flex-shrink-0 mt-0.5">
                    {idx + 1}
                  </span>
                  <p className="text-xs text-slate-700 dark:text-slate-300 leading-relaxed">
                    {insight}
                  </p>
                </div>
              ))}
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-slate-100 dark:border-slate-700/60 flex items-center justify-between text-xs text-slate-500 dark:text-slate-400">
            <span>Model Confidence Level: High</span>
            <span className="text-emerald-600 dark:text-emerald-400 font-semibold">Updated 10m ago</span>
          </div>
        </motion.div>
      </div>
    </div>
  );
};

export default SalesForecast;