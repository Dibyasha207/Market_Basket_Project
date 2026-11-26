import { useState } from "react";
import { motion } from "framer-motion";
import {
  Users,
  UserPlus,
  Repeat,
  DollarSign,
  Award,
  Calendar,
  ChevronDown,
  Download,
  TrendingUp,
  TrendingDown,
  ArrowUpRight,
  ShieldCheck,
} from "lucide-react";
import {
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Tooltip,
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Legend,
} from "recharts";
import { useCustomers } from "../hooks/useCustomers";

const SEGMENT_COLORS = {
  Premium: "#8B5CF6",
  Regular: "#3B82F6",
  "Low Value": "#EC4899",
};

const CustomerSegmentation = () => {
  const { data, isLoading, error, refetch } = useCustomers();
  const [dateRange] = useState("May 12, 2025 - May 18, 2025");

  const kpis = data?.kpis || {
    totalCustomers: 8562,
    newCustomers: 1245,
    repeatCustomers: 3642,
    avgOrderValue: 48.75,
    customerLifetimeValue: 215.40,
    growthRate: 8.2,
  };

  const segments = data?.segments || [
    { segment: "Premium", customers: 2997, percentage: 35, revenue: 215430, avgOrderValue: 71.62, purchaseFrequency: 8.6, clv: 325.30 },
    { segment: "Regular", customers: 3853, percentage: 45, revenue: 144870, avgOrderValue: 41.21, purchaseFrequency: 4.2, clv: 178.40 },
    { segment: "Low Value", customers: 1712, percentage: 20, revenue: 62340, avgOrderValue: 26.18, purchaseFrequency: 2.1, clv: 89.20 },
  ];

  const topCustomers = data?.topCustomers || [
    { id: 1, name: "Sarah Johnson", revenue: 2350.40 },
    { id: 2, name: "Michael Brown", revenue: 1980.75 },
    { id: 3, name: "David Lee", revenue: 1725.60 },
    { id: 4, name: "Emily Davis", revenue: 1540.20 },
    { id: 5, name: "James Wilson", revenue: 1310.45 },
  ];

  const newVsReturning = data?.newVsReturning || [
    { date: "May 12", newCustomers: 120, returningCustomers: 280 },
    { date: "May 13", newCustomers: 145, returningCustomers: 310 },
    { date: "May 14", newCustomers: 110, returningCustomers: 295 },
    { date: "May 15", newCustomers: 165, returningCustomers: 340 },
    { date: "May 16", newCustomers: 190, returningCustomers: 380 },
    { date: "May 17", newCustomers: 220, returningCustomers: 410 },
    { date: "May 18", newCustomers: 210, returningCustomers: 390 },
  ];

  const acquisitionTrend = data?.acquisitionTrend || [
    { day: "May 12", customers: 140 },
    { day: "May 13", customers: 165 },
    { day: "May 14", customers: 130 },
    { day: "May 15", customers: 185 },
    { day: "May 16", customers: 210 },
    { day: "May 17", customers: 250 },
    { day: "May 18", customers: 235 },
  ];

  const behaviorInsights = data?.behaviorInsights || [
    { metric: "Avg. Order Value", all: "$48.75", premium: "$71.62", regular: "$41.21", lowValue: "$26.18", trend: "up" },
    { metric: "Purchase Frequency", all: "4.7", premium: "8.6", regular: "4.2", lowValue: "2.1", trend: "up" },
    { metric: "Repeat Purchase Rate", all: "42.5%", premium: "75.1%", regular: "41.2%", lowValue: "18.7%", trend: "up" },
    { metric: "Avg. Days Between Orders", all: "12.4", premium: "6.1", regular: "13.8", lowValue: "27.5", trend: "down" },
  ];

  const takeaways = data?.takeaways || [
    "Premium customers spend 74% more than regular customers.",
    "Repeat purchase rate increased by 5.3% this week.",
    "Low value segment decreased by 3.2% this month.",
    "Targeted offers can help increase customer retention.",
  ];

  const exportReport = () => {
    const rows = [
      ["Segment", "Customers", "Percentage (%)", "Revenue ($)", "AOV ($)", "Frequency", "CLV ($)"],
      ...segments.map((s) => [s.segment, s.customers, s.percentage, s.revenue, s.avgOrderValue, s.purchaseFrequency, s.clv]),
    ];
    const blob = new Blob([rows.map((e) => e.join(",")).join("\n")], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "customer_segmentation.csv";
    a.click();
  };

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
            Customer Intelligence
          </h1>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Understand your customers and improve engagement
          </p>
        </div>

        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs sm:text-sm font-medium text-slate-700 dark:text-slate-200 shadow-sm">
            <Calendar className="w-4 h-4 text-slate-400 dark:text-slate-500" />
            <span>{dateRange}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400" />
          </div>

          <button
            onClick={exportReport}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-medium shadow-sm shadow-indigo-500/20 transition-all duration-200"
          >
            <Download className="w-4 h-4" />
            <span>Export</span>
          </button>
        </div>
      </div>

      {/* 5 KPI Cards */}
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-3.5 sm:gap-4">
        {/* Total Customers */}
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          className="p-4 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
        >
          <div className="flex items-center justify-between">
            <span className="w-8 h-8 rounded-lg bg-indigo-50 dark:bg-indigo-500/10 flex items-center justify-center text-indigo-600 dark:text-indigo-400">
              <Users className="w-4 h-4" />
            </span>
          </div>
          <p className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-slate-100 mt-2">
            {kpis.totalCustomers.toLocaleString()}
          </p>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Total Customers</p>
          <p className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1">
            +8.2% vs last 7 days
          </p>
        </motion.div>

        {/* New Customers */}
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.05 }}
          className="p-4 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
        >
          <div className="flex items-center justify-between">
            <span className="w-8 h-8 rounded-lg bg-blue-50 dark:bg-blue-500/10 flex items-center justify-center text-blue-600 dark:text-blue-400">
              <UserPlus className="w-4 h-4" />
            </span>
          </div>
          <p className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-slate-100 mt-2">
            {kpis.newCustomers.toLocaleString()}
          </p>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">New Customers</p>
          <p className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1">
            +10.7% vs last 7 days
          </p>
        </motion.div>

        {/* Repeat Customers */}
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="p-4 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
        >
          <div className="flex items-center justify-between">
            <span className="w-8 h-8 rounded-lg bg-emerald-50 dark:bg-emerald-500/10 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
              <Repeat className="w-4 h-4" />
            </span>
          </div>
          <p className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-slate-100 mt-2">
            {kpis.repeatCustomers.toLocaleString()}
          </p>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Repeat Customers</p>
          <p className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1">
            +6.5% vs last 7 days
          </p>
        </motion.div>

        {/* Avg Order Value */}
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.15 }}
          className="p-4 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm"
        >
          <div className="flex items-center justify-between">
            <span className="w-8 h-8 rounded-lg bg-amber-50 dark:bg-amber-500/10 flex items-center justify-center text-amber-600 dark:text-amber-400">
              <DollarSign className="w-4 h-4" />
            </span>
          </div>
          <p className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-slate-100 mt-2">
            ${kpis.avgOrderValue}
          </p>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Avg. Order Value</p>
          <p className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1">
            +2.1% vs last 7 days
          </p>
        </motion.div>

        {/* Customer Lifetime Value */}
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="p-4 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm col-span-2 sm:col-span-1"
        >
          <div className="flex items-center justify-between">
            <span className="w-8 h-8 rounded-lg bg-purple-50 dark:bg-purple-500/10 flex items-center justify-center text-purple-600 dark:text-purple-400">
              <Award className="w-4 h-4" />
            </span>
          </div>
          <p className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-slate-100 mt-2">
            ${kpis.customerLifetimeValue}
          </p>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Customer Lifetime Value</p>
          <p className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1">
            +4.8% vs last 7 days
          </p>
        </motion.div>
      </div>

      {/* Row 2: Customer Segments Donut + Customer Segment Overview Table */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* Customer Segments Donut Chart */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-1">
              Customer Segments
            </h2>
            <p className="text-xs text-slate-500 dark:text-slate-400 mb-4">
              Distribution of customer tiers by RFM clustering
            </p>

            <div className="h-52">
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={segments}
                    dataKey="percentage"
                    nameKey="segment"
                    cx="50%"
                    cy="50%"
                    innerRadius={55}
                    outerRadius={80}
                    paddingAngle={3}
                  >
                    {segments.map((entry) => (
                      <Cell key={`cell-${entry.segment}`} fill={SEGMENT_COLORS[entry.segment] || "#8B5CF6"} />
                    ))}
                  </Pie>
                  <Tooltip
                    formatter={(value) => [`${value}%`, "Share"]}
                    contentStyle={{ backgroundColor: "#1e293b", borderColor: "#334155", borderRadius: "0.75rem", color: "#f8fafc" }}
                  />
                </PieChart>
              </ResponsiveContainer>
            </div>
          </div>

          <div className="mt-4 space-y-2 text-xs">
            {segments.map((seg) => (
              <div key={seg.segment} className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <span className="w-2.5 h-2.5 rounded-full" style={{ backgroundColor: SEGMENT_COLORS[seg.segment] || "#8B5CF6" }} />
                  <span className="text-slate-600 dark:text-slate-300 font-medium">{seg.segment}</span>
                </div>
                <div className="flex items-center gap-3">
                  <span className="text-slate-800 dark:text-slate-200 font-semibold">{seg.customers.toLocaleString()}</span>
                  <span className="text-slate-400 w-7 text-right">{seg.percentage}%</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Customer Segment Overview Table (2 cols) */}
        <div className="lg:col-span-2 p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Customer Segment Overview
              </h2>
              <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
                View full segment analysis →
              </button>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse text-sm">
                <thead>
                  <tr className="border-b border-slate-200/60 dark:border-slate-700/60 text-slate-400 dark:text-slate-500 text-xs uppercase tracking-wider">
                    <th className="pb-3 font-semibold">Segment</th>
                    <th className="pb-3 font-semibold text-right">Customers</th>
                    <th className="pb-3 font-semibold text-right">Revenue</th>
                    <th className="pb-3 font-semibold text-right">Avg. Order Value</th>
                    <th className="pb-3 font-semibold text-right">Purchase Frequency</th>
                    <th className="pb-3 font-semibold text-right">CLV</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-700/40">
                  {segments.map((s) => (
                    <tr key={s.segment} className="hover:bg-slate-50/50 dark:hover:bg-slate-700/20 transition-colors">
                      <td className="py-3.5 font-semibold text-slate-900 dark:text-slate-100 flex items-center gap-2">
                        <span className="w-2 h-2 rounded-full" style={{ backgroundColor: SEGMENT_COLORS[s.segment] }} />
                        <span>{s.segment}</span>
                      </td>
                      <td className="py-3.5 text-right font-medium text-slate-700 dark:text-slate-300">
                        {s.customers.toLocaleString()} ({s.percentage}%)
                      </td>
                      <td className="py-3.5 text-right font-bold text-slate-900 dark:text-slate-100">
                        ${s.revenue.toLocaleString()}
                      </td>
                      <td className="py-3.5 text-right text-slate-700 dark:text-slate-300">
                        ${s.avgOrderValue}
                      </td>
                      <td className="py-3.5 text-right text-slate-700 dark:text-slate-300">
                        {s.purchaseFrequency}
                      </td>
                      <td className="py-3.5 text-right font-semibold text-emerald-600 dark:text-emerald-400">
                        ${s.clv}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-slate-100 dark:border-slate-700/60 text-xs text-slate-500 dark:text-slate-400">
            Premium customers contribute 62% of total revenue.
          </div>
        </div>
      </div>

      {/* Row 3: New vs Returning Customers + Acquisition Trend + Top Customers */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* New vs Returning Customers Line Chart */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-1">
            New vs Returning Customers
          </h2>
          <p className="text-xs text-slate-500 dark:text-slate-400 mb-4">
            Daily split of new vs repeat buyers
          </p>

          <div className="h-56">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={newVsReturning}>
                <CartesianGrid strokeDasharray="3 3" stroke="#94a3b8" opacity={0.15} />
                <XAxis dataKey="date" stroke="#94a3b8" fontSize={11} tickLine={false} />
                <YAxis stroke="#94a3b8" fontSize={11} tickLine={false} />
                <Tooltip contentStyle={{ backgroundColor: "#1e293b", borderColor: "#334155", borderRadius: "0.75rem", color: "#f8fafc" }} />
                <Legend iconType="circle" wrapperStyle={{ fontSize: "11px", paddingTop: "6px" }} />
                <Line type="monotone" dataKey="newCustomers" stroke="#3B82F6" strokeWidth={2} name="New Customers" dot={{ r: 2 }} />
                <Line type="monotone" dataKey="returningCustomers" stroke="#8B5CF6" strokeWidth={2} name="Returning Customers" dot={{ r: 2 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Customer Acquisition Trend Bar Chart */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-1">
            Customer Acquisition Trend
          </h2>
          <p className="text-xs text-slate-500 dark:text-slate-400 mb-4">
            New customer signups per day
          </p>

          <div className="h-56">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={acquisitionTrend}>
                <CartesianGrid strokeDasharray="3 3" stroke="#94a3b8" opacity={0.15} />
                <XAxis dataKey="day" stroke="#94a3b8" fontSize={11} tickLine={false} />
                <YAxis stroke="#94a3b8" fontSize={11} tickLine={false} />
                <Tooltip contentStyle={{ backgroundColor: "#1e293b", borderColor: "#334155", borderRadius: "0.75rem", color: "#f8fafc" }} />
                <Bar dataKey="customers" fill="#8B5CF6" radius={[4, 4, 0, 0]} name="New Customers" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Top Customers by Revenue */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Top Customers by Revenue
              </h2>
              <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
                View All
              </button>
            </div>

            <div className="space-y-3">
              {topCustomers.map((cust) => (
                <div key={cust.id} className="flex items-center justify-between py-1">
                  <div className="flex items-center gap-3">
                    <span className="w-8 h-8 rounded-full bg-gradient-to-br from-indigo-500 to-violet-500 flex items-center justify-center text-white text-xs font-bold shrink-0">
                      {cust.name.charAt(0)}
                    </span>
                    <div>
                      <p className="text-xs font-semibold text-slate-800 dark:text-slate-200">{cust.name}</p>
                      <p className="text-[10px] text-slate-400">Active Spender</p>
                    </div>
                  </div>
                  <span className="text-xs font-bold text-slate-900 dark:text-slate-100">
                    ${cust.revenue.toLocaleString()}
                  </span>
                </div>
              ))}
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-slate-100 dark:border-slate-700/60 text-xs text-slate-500 dark:text-slate-400">
            Top 5 customers account for $8,907 in lifetime revenue.
          </div>
        </div>
      </div>

      {/* Row 4: Customer Behavior Insights Table & Customer Insights Takeaways */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* Customer Behavior Insights Table (2 cols) */}
        <div className="lg:col-span-2 p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-4">
            Customer Behavior Insights
          </h2>

          <div className="overflow-x-auto">
            <table className="w-full text-left text-xs border-collapse">
              <thead>
                <tr className="border-b border-slate-200/60 dark:border-slate-700/60 text-slate-400 dark:text-slate-500 uppercase tracking-wider">
                  <th className="pb-3 font-semibold">Metric</th>
                  <th className="pb-3 font-semibold text-right">All Customers</th>
                  <th className="pb-3 font-semibold text-right">Premium</th>
                  <th className="pb-3 font-semibold text-right">Regular</th>
                  <th className="pb-3 font-semibold text-right">Low Value</th>
                  <th className="pb-3 font-semibold text-center">Trend</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100 dark:divide-slate-700/40">
                {behaviorInsights.map((b) => (
                  <tr key={b.metric} className="hover:bg-slate-50/50 dark:hover:bg-slate-700/20 transition-colors">
                    <td className="py-3 font-medium text-slate-800 dark:text-slate-200">{b.metric}</td>
                    <td className="py-3 text-right font-semibold text-slate-900 dark:text-slate-100">{b.all}</td>
                    <td className="py-3 text-right font-semibold text-indigo-600 dark:text-indigo-400">{b.premium}</td>
                    <td className="py-3 text-right text-slate-600 dark:text-slate-300">{b.regular}</td>
                    <td className="py-3 text-right text-slate-400">{b.lowValue}</td>
                    <td className="py-3 text-center">
                      {b.trend === "up" ? (
                        <span className="inline-flex items-center text-emerald-500">
                          <TrendingUp className="w-3.5 h-3.5" />
                        </span>
                      ) : (
                        <span className="inline-flex items-center text-blue-500">
                          <TrendingDown className="w-3.5 h-3.5" />
                        </span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Customer Insights Bullet Cards (1 col) */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-4">
              Customer Insights
            </h2>

            <div className="space-y-3">
              {takeaways.map((point, index) => (
                <div key={index} className="flex items-start gap-3 p-3 rounded-xl bg-slate-50 dark:bg-slate-700/30 text-xs">
                  <span className="w-2 h-2 rounded-full bg-indigo-500 shrink-0 mt-1.5" />
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">{point}</p>
                </div>
              ))}
            </div>
          </div>

          <button
            onClick={() => refetch()}
            className="mt-4 w-full py-2 rounded-xl border border-indigo-200 dark:border-indigo-500/30 text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:bg-indigo-50 dark:hover:bg-indigo-500/10 transition-colors"
          >
            Refresh Customer Data
          </button>
        </div>
      </div>
    </div>
  );
};

export default CustomerSegmentation;