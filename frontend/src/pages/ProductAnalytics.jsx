import { useState } from "react";
import { motion } from "framer-motion";
import {
  Package,
  Layers,
  DollarSign,
  AlertTriangle,
  Download,
  Calendar,
  ChevronDown,
  TrendingUp,
  ArrowUpRight,
  Sparkles,
} from "lucide-react";
import {
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Tooltip,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Legend,
} from "recharts";
import { useProducts } from "../hooks/useProducts";

const ProductAnalytics = () => {
  const { data, isLoading, error, refetch } = useProducts();
  const [dateRange] = useState("May 12, 2025 - May 18, 2025");

  const kpis = data?.kpis || {
    totalProducts: 2340,
    totalProductsChange: 3.1,
    topCategory: "Beverages",
    topCategoryShare: "35% of total sales",
    avgPrice: 28.45,
    avgPriceChange: 1.2,
    lowStockCount: 28,
  };

  const topProducts = data?.topProducts || [
    { id: 1, name: "Coca Cola 500ml", category: "Beverages", revenue: 12430, unitsSold: 1245, trend: [20, 35, 45, 60, 55, 75, 85] },
    { id: 2, name: "Lay's Classic 100g", category: "Snacks", revenue: 9875, unitsSold: 985, trend: [15, 25, 40, 50, 48, 65, 70] },
    { id: 3, name: "Amul Milk 1L", category: "Dairy", revenue: 7650, unitsSold: 876, trend: [25, 30, 35, 45, 50, 55, 60] },
    { id: 4, name: "Britannia Bread", category: "Bakery", revenue: 6540, unitsSold: 765, trend: [18, 22, 30, 38, 42, 48, 52] },
    { id: 5, name: "Nescafe Classic 100g", category: "Beverages", revenue: 5430, unitsSold: 643, trend: [10, 15, 22, 28, 35, 40, 45] },
  ];

  const categorySales = data?.categorySales || [
    { category: "Beverages", revenue: 45230, percentage: 35, color: "#8B5CF6" },
    { category: "Snacks", revenue: 32180, percentage: 25, color: "#EC4899" },
    { category: "Dairy", revenue: 25890, percentage: 20, color: "#3B82F6" },
    { category: "Bakery", revenue: 15570, percentage: 12, color: "#10B981" },
    { category: "Others", revenue: 10230, percentage: 8, color: "#F59E0B" },
  ];

  const categoryPerformanceOverTime = data?.categoryPerformanceOverTime || [
    { date: "May 12", Beverages: 3800, Snacks: 2900, Dairy: 2400, Bakery: 1800, Others: 1100 },
    { date: "May 13", Beverages: 4100, Snacks: 3100, Dairy: 2550, Bakery: 1950, Others: 1200 },
    { date: "May 14", Beverages: 3950, Snacks: 3000, Dairy: 2480, Bakery: 1880, Others: 1150 },
    { date: "May 15", Beverages: 4400, Snacks: 3300, Dairy: 2700, Bakery: 2100, Others: 1300 },
    { date: "May 16", Beverages: 4800, Snacks: 3600, Dairy: 2900, Bakery: 2300, Others: 1450 },
    { date: "May 17", Beverages: 5200, Snacks: 3900, Dairy: 3100, Bakery: 2450, Others: 1600 },
    { date: "May 18", Beverages: 5050, Snacks: 3800, Dairy: 3050, Bakery: 2400, Others: 1550 },
  ];

  const lowStockItems = data?.lowStockItems || [
    { id: 1, name: "Maggi 2-Minute Noodles", category: "Grocery", stockLeft: 15, status: "Low" },
    { id: 2, name: "Red Bull 250ml", category: "Beverages", stockLeft: 12, status: "Low" },
    { id: 3, name: "Tide Detergent 1kg", category: "Household", stockLeft: 8, status: "Critical" },
    { id: 4, name: "Colgate Toothpaste 150g", category: "Personal Care", stockLeft: 6, status: "Critical" },
    { id: 5, name: "Parle-G Biscuit 100g", category: "Snacks", stockLeft: 18, status: "Low" },
  ];

  const exportCSV = () => {
    const csvRows = [
      ["Product ID", "Product Name", "Category", "Revenue ($)", "Units Sold"],
      ...topProducts.map((p) => [p.id, p.name, p.category, p.revenue, p.unitsSold]),
    ];
    const blob = new Blob([csvRows.map((e) => e.join(",")).join("\n")], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "product_analytics.csv";
    a.click();
  };

  return (
    <div className="space-y-6">
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
            Product Analytics
          </h1>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Track product performance and category insights
          </p>
        </div>

        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs sm:text-sm font-medium text-slate-700 dark:text-slate-200 shadow-sm">
            <Calendar className="w-4 h-4 text-slate-400 dark:text-slate-500" />
            <span>{dateRange}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400" />
          </div>

          <button
            onClick={exportCSV}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-medium shadow-sm shadow-indigo-500/20 transition-all duration-200"
          >
            <Download className="w-4 h-4" />
            <span>Export</span>
          </button>
        </div>
      </div>

      {/* KPI Cards (4 Cards) */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-5">
        {/* Total Products */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <p className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">
              Total Products
            </p>
            <p className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 mt-1">
              {kpis.totalProducts.toLocaleString()}
            </p>
            <p className="flex items-center gap-1 text-xs text-emerald-600 dark:text-emerald-400 font-medium mt-1.5">
              <TrendingUp className="w-3.5 h-3.5" />
              <span>+{kpis.totalProductsChange}% vs last 7 days</span>
            </p>
          </div>
          <div className="w-12 h-12 rounded-xl bg-indigo-50 dark:bg-indigo-500/10 flex items-center justify-center text-indigo-600 dark:text-indigo-400">
            <Package className="w-6 h-6" />
          </div>
        </motion.div>

        {/* Top Category */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.05 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <p className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">
              Top Category
            </p>
            <p className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 mt-1">
              {kpis.topCategory}
            </p>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-medium mt-1.5">
              {kpis.topCategoryShare}
            </p>
          </div>
          <div className="w-12 h-12 rounded-xl bg-blue-50 dark:bg-blue-500/10 flex items-center justify-center text-blue-600 dark:text-blue-400">
            <Layers className="w-6 h-6" />
          </div>
        </motion.div>

        {/* Avg Price */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <p className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">
              Avg. Price
            </p>
            <p className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 mt-1">
              ${kpis.avgPrice}
            </p>
            <p className="flex items-center gap-1 text-xs text-emerald-600 dark:text-emerald-400 font-medium mt-1.5">
              <TrendingUp className="w-3.5 h-3.5" />
              <span>+{kpis.avgPriceChange}% vs last 7 days</span>
            </p>
          </div>
          <div className="w-12 h-12 rounded-xl bg-emerald-50 dark:bg-emerald-500/10 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
            <DollarSign className="w-6 h-6" />
          </div>
        </motion.div>

        {/* Low Stock Items */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.15 }}
          className="p-5 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex items-center justify-between"
        >
          <div>
            <p className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">
              Low Stock Items
            </p>
            <p className="text-2xl sm:text-3xl font-extrabold text-amber-600 dark:text-amber-400 mt-1">
              {kpis.lowStockCount}
            </p>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-medium mt-1.5">
              View low stock products
            </p>
          </div>
          <div className="w-12 h-12 rounded-xl bg-amber-50 dark:bg-amber-500/10 flex items-center justify-center text-amber-600 dark:text-amber-400">
            <AlertTriangle className="w-6 h-6" />
          </div>
        </motion.div>
      </div>

      {/* Row 2: Top Products by Revenue & Sales by Category */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* Top Products by Revenue (2 cols) */}
        <div className="lg:col-span-2 p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
              Top Products by Revenue
            </h2>
            <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
              View All
            </button>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse text-sm">
              <thead>
                <tr className="border-b border-slate-200/60 dark:border-slate-700/60 text-slate-400 dark:text-slate-500 text-xs uppercase tracking-wider">
                  <th className="pb-3 font-semibold">Product</th>
                  <th className="pb-3 font-semibold">Category</th>
                  <th className="pb-3 font-semibold text-right">Revenue</th>
                  <th className="pb-3 font-semibold text-right">Units Sold</th>
                  <th className="pb-3 font-semibold text-center">Trend</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100 dark:divide-slate-700/40">
                {topProducts.map((p) => (
                  <tr key={p.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-700/20 transition-colors">
                    <td className="py-3.5 font-medium text-slate-900 dark:text-slate-100">
                      {p.name}
                    </td>
                    <td className="py-3.5 text-xs text-slate-500 dark:text-slate-400">
                      <span className="px-2 py-0.5 rounded-md bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300 font-medium">
                        {p.category}
                      </span>
                    </td>
                    <td className="py-3.5 text-right font-semibold text-slate-900 dark:text-slate-100">
                      ${p.revenue.toLocaleString()}
                    </td>
                    <td className="py-3.5 text-right text-slate-600 dark:text-slate-300 font-medium">
                      {p.unitsSold.toLocaleString()}
                    </td>
                    <td className="py-3.5 text-center">
                      <span className="inline-flex items-center text-emerald-500 dark:text-emerald-400">
                        <TrendingUp className="w-4 h-4" />
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Sales by Category Donut Chart (1 col) */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-2">
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Sales by Category
              </h2>
              <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
                View All
              </button>
            </div>
            <p className="text-xs text-slate-500 dark:text-slate-400 mb-4">
              Beverages is the top performing category contributing 35% of total revenue.
            </p>

            <div className="h-52">
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={categorySales}
                    dataKey="revenue"
                    nameKey="category"
                    cx="50%"
                    cy="50%"
                    innerRadius={55}
                    outerRadius={80}
                    paddingAngle={3}
                  >
                    {categorySales.map((entry, index) => (
                      <Cell key={`cell-${index}`} fill={entry.color} />
                    ))}
                  </Pie>
                  <Tooltip
                    formatter={(value) => [`$${value.toLocaleString()}`, "Revenue"]}
                    contentStyle={{ backgroundColor: "#1e293b", borderColor: "#334155", borderRadius: "0.75rem", color: "#f8fafc" }}
                  />
                </PieChart>
              </ResponsiveContainer>
            </div>
          </div>

          <div className="mt-4 space-y-2 text-xs">
            {categorySales.map((cat) => (
              <div key={cat.category} className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <span className="w-2.5 h-2.5 rounded-full" style={{ backgroundColor: cat.color }} />
                  <span className="text-slate-600 dark:text-slate-300 font-medium">{cat.category}</span>
                </div>
                <div className="flex items-center gap-3">
                  <span className="text-slate-800 dark:text-slate-200 font-semibold">${cat.revenue.toLocaleString()}</span>
                  <span className="text-slate-400 w-7 text-right">{cat.percentage}%</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Row 3: Category Performance Over Time & Low Stock Products */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* Category Performance Over Time Multi-line Chart (2 cols) */}
        <div className="lg:col-span-2 p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Category Performance Over Time
              </h2>
              <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
                Revenue trends across top product categories
              </p>
            </div>
          </div>

          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={categoryPerformanceOverTime}>
                <CartesianGrid strokeDasharray="3 3" stroke="#94a3b8" opacity={0.15} />
                <XAxis dataKey="date" stroke="#94a3b8" fontSize={12} tickLine={false} />
                <YAxis stroke="#94a3b8" fontSize={12} tickLine={false} tickFormatter={(v) => `$${v / 1000}k`} />
                <Tooltip
                  formatter={(value) => [`$${value.toLocaleString()}`]}
                  contentStyle={{ backgroundColor: "#1e293b", borderColor: "#334155", borderRadius: "0.75rem", color: "#f8fafc" }}
                />
                <Legend iconType="circle" wrapperStyle={{ fontSize: "12px", paddingTop: "8px" }} />
                <Line type="monotone" dataKey="Beverages" stroke="#8B5CF6" strokeWidth={2.5} dot={{ r: 3 }} />
                <Line type="monotone" dataKey="Snacks" stroke="#EC4899" strokeWidth={2.5} dot={{ r: 3 }} />
                <Line type="monotone" dataKey="Dairy" stroke="#3B82F6" strokeWidth={2.5} dot={{ r: 3 }} />
                <Line type="monotone" dataKey="Bakery" stroke="#10B981" strokeWidth={2.5} dot={{ r: 3 }} />
                <Line type="monotone" dataKey="Others" stroke="#F59E0B" strokeWidth={2.5} dot={{ r: 3 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Low Stock Products (1 col) */}
        <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Low Stock Products
              </h2>
              <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
                View All
              </button>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left text-xs border-collapse">
                <thead>
                  <tr className="border-b border-slate-200/60 dark:border-slate-700/60 text-slate-400 dark:text-slate-500 uppercase tracking-wider">
                    <th className="pb-2.5 font-semibold">Product</th>
                    <th className="pb-2.5 font-semibold text-center">Stock Left</th>
                    <th className="pb-2.5 font-semibold text-right">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-700/40">
                  {lowStockItems.map((item) => (
                    <tr key={item.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-700/20 transition-colors">
                      <td className="py-2.5 font-medium text-slate-800 dark:text-slate-200">
                        <div className="truncate max-w-[140px]" title={item.name}>{item.name}</div>
                        <div className="text-[10px] text-slate-400">{item.category}</div>
                      </td>
                      <td className="py-2.5 text-center font-bold text-slate-900 dark:text-slate-100">
                        {item.stockLeft}
                      </td>
                      <td className="py-2.5 text-right">
                        <span
                          className={`px-2 py-0.5 rounded-md font-semibold text-[10px] ${
                            item.status === "Critical"
                              ? "bg-red-50 dark:bg-red-500/15 text-red-600 dark:text-red-400"
                              : "bg-amber-50 dark:bg-amber-500/15 text-amber-600 dark:text-amber-400"
                          }`}
                        >
                          {item.status}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-slate-100 dark:border-slate-700/60 flex items-center justify-between text-xs text-slate-500 dark:text-slate-400">
            <span>28 total products need reorder</span>
            <button className="font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
              Create PO
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductAnalytics;