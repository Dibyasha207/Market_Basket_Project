import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Sparkles,
  Search,
  Calendar,
  ChevronDown,
  Download,
  Info,
  ArrowRight,
  TrendingUp,
  Package,
  Layers,
  ArrowUpDown,
  ShoppingBag,
} from "lucide-react";
import { useRecommendations } from "../hooks/useRecommendations";

const RECENT_SEARCHES = [
  { name: "Milk", time: "2 min ago", icon: "🥛" },
  { name: "Bread", time: "15 min ago", icon: "🍞" },
  { name: "Chicken", time: "1 hour ago", icon: "🍗" },
  { name: "Eggs", time: "2 hours ago", icon: "🥚" },
  { name: "Rice", time: "1 day ago", icon: "🍚" },
];

const Recommendations = () => {
  const [searchInput, setSearchInput] = useState("Milk");
  const [sortBy, setSortBy] = useState("lift");
  const { product, data, isLoading, error, searchProduct } = useRecommendations("Milk");

  const recommendations = data?.recommendations || [
    { id: 1, productName: "Bread", category: "Bakery", support: 32.45, confidence: 68.75, lift: 2.15, strength: "Very Strong" },
    { id: 2, productName: "Butter", category: "Dairy", support: 28.12, confidence: 61.23, lift: 1.88, strength: "Strong" },
    { id: 3, productName: "Cheese", category: "Dairy", support: 24.13, confidence: 58.32, lift: 1.72, strength: "Strong" },
    { id: 4, productName: "Yogurt", category: "Dairy", support: 20.35, confidence: 54.21, lift: 1.61, strength: "Medium" },
    { id: 5, productName: "Cereal", category: "Snacks", support: 18.22, confidence: 51.14, lift: 1.45, strength: "Medium" },
  ];

  const topAssociations = data?.topAssociations || [
    { rank: 1, productA: "Milk", productB: "Bread", lift: 2.15 },
    { rank: 2, productA: "Milk", productB: "Butter", lift: 1.88 },
    { rank: 3, productA: "Milk", productB: "Cheese", lift: 1.72 },
    { rank: 4, productA: "Milk", productB: "Yogurt", lift: 1.61 },
    { rank: 5, productA: "Milk", productB: "Cereal", lift: 1.45 },
  ];

  const insight = data?.insight || `Customers who buy ${product} are 2.15x more likely to also buy Bread compared to random chance. This pair has the highest lift score.`;

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    if (searchInput.trim()) {
      searchProduct(searchInput.trim());
    }
  };

  const handleRecentClick = (term) => {
    setSearchInput(term);
    searchProduct(term);
  };

  const sortedRecommendations = [...recommendations].sort((a, b) => {
    if (sortBy === "confidence") return b.confidence - a.confidence;
    if (sortBy === "support") return b.support - a.support;
    return b.lift - a.lift;
  });

  const exportCSV = () => {
    const csvRows = [
      ["Product", "Recommended Product", "Category", "Support (%)", "Confidence (%)", "Lift"],
      ...sortedRecommendations.map((r) => [product, r.productName, r.category, r.support, r.confidence, r.lift]),
    ];
    const blob = new Blob([csvRows.map((e) => e.join(",")).join("\n")], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `recommendations_${product.toLowerCase()}.csv`;
    a.click();
  };

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
            Recommendations
          </h1>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Discover products that are frequently bought together
          </p>
        </div>

        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs sm:text-sm font-medium text-slate-700 dark:text-slate-200 shadow-sm">
            <Calendar className="w-4 h-4 text-slate-400 dark:text-slate-500" />
            <span>May 12, 2025 - May 18, 2025</span>
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

      {/* Row 1: Search Form + How it works */}
      <div className="grid lg:grid-cols-3 gap-5 items-start">
        {/* Search bar (2 cols) */}
        <div className="lg:col-span-2 p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
          <label className="block text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider mb-2">
            Search a product
          </label>
          <form onSubmit={handleSearchSubmit} className="flex items-center gap-3">
            <div className="relative flex-1">
              <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
              <input
                type="text"
                value={searchInput}
                onChange={(e) => setSearchInput(e.target.value)}
                placeholder="e.g. Milk, Bread, Coffee, Tea..."
                className="w-full pl-10 pr-4 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-700/50 border border-slate-200 dark:border-slate-600 text-sm text-slate-800 dark:text-slate-100 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all"
              />
            </div>
            <button
              type="submit"
              className="px-5 py-2.5 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold shadow-md shadow-indigo-500/20 transition-colors"
            >
              Get Recommendations
            </button>
          </form>
        </div>

        {/* How it works info card (1 col) */}
        <div className="p-6 rounded-2xl bg-indigo-50/70 dark:bg-indigo-950/30 border border-indigo-100 dark:border-indigo-800/40 shadow-sm flex items-start gap-3.5">
          <div className="w-8 h-8 rounded-lg bg-indigo-600 text-white flex items-center justify-center shrink-0 mt-0.5">
            <Info className="w-4 h-4" />
          </div>
          <div>
            <h3 className="text-sm font-bold text-indigo-950 dark:text-indigo-200">How it works?</h3>
            <p className="text-xs text-indigo-800/80 dark:text-indigo-300/80 mt-1 leading-relaxed">
              We use Market Basket Analysis (FP-Growth / Apriori) to find products that customer&apos;s often buy together.
            </p>
          </div>
        </div>
      </div>

      {/* Row 2: Main Recommendations List + Sidebar (Top Associations & Insights) */}
      <div className="grid lg:grid-cols-3 gap-5">
        {/* Recommended Products (2 cols) */}
        <div className="lg:col-span-2 space-y-4">
          <div className="flex items-center justify-between">
            <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
              Recommended Products for &quot;{product}&quot;
            </h2>

            <div className="flex items-center gap-2">
              <span className="text-xs text-slate-400 dark:text-slate-500">Sort by:</span>
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="px-3 py-1.5 rounded-lg bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs font-semibold text-slate-700 dark:text-slate-200 focus:outline-none"
              >
                <option value="lift">Lift (High to Low)</option>
                <option value="confidence">Confidence (High to Low)</option>
                <option value="support">Support (High to Low)</option>
              </select>
            </div>
          </div>

          <div className="space-y-3">
            {sortedRecommendations.map((item, index) => (
              <motion.div
                key={item.id || index}
                initial={{ opacity: 0, y: 12 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.25, delay: index * 0.05 }}
                className="p-4 sm:p-5 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm flex flex-col sm:flex-row sm:items-center justify-between gap-4 hover:shadow-md transition-shadow"
              >
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-indigo-50 to-violet-50 dark:from-slate-700 dark:to-slate-700 flex items-center justify-center text-xl shrink-0 shadow-inner">
                    {item.category === "Bakery" ? "🍞" : item.category === "Dairy" ? "🧀" : item.category === "Beverages" ? "☕" : "📦"}
                  </div>
                  <div>
                    <div className="flex items-center gap-2">
                      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">{item.productName}</h3>
                      <span className="px-2 py-0.5 rounded-md bg-slate-100 dark:bg-slate-700 text-slate-600 dark:text-slate-300 font-medium text-[11px]">
                        {item.category}
                      </span>
                    </div>
                    <p className="text-xs text-slate-400 mt-0.5">Frequently paired with {product}</p>
                  </div>
                </div>

                <div className="flex items-center justify-between sm:justify-end gap-6 sm:gap-8 pt-3 sm:pt-0 border-t sm:border-t-0 border-slate-100 dark:border-slate-700/60">
                  <div className="text-left sm:text-center">
                    <p className="text-[11px] text-slate-400 uppercase font-semibold">Support</p>
                    <p className="text-sm font-bold text-slate-800 dark:text-slate-200">{item.support}%</p>
                  </div>
                  <div className="text-left sm:text-center">
                    <p className="text-[11px] text-slate-400 uppercase font-semibold">Confidence</p>
                    <p className="text-sm font-bold text-slate-800 dark:text-slate-200">{item.confidence}%</p>
                  </div>
                  <div className="text-left sm:text-center">
                    <p className="text-[11px] text-slate-400 uppercase font-semibold">Lift</p>
                    <span className="inline-block px-2.5 py-0.5 rounded-full bg-emerald-50 dark:bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 text-xs font-bold">
                      {item.lift}
                    </span>
                  </div>

                  <button className="px-3.5 py-1.5 rounded-xl border border-indigo-200 dark:border-indigo-500/30 text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:bg-indigo-50 dark:hover:bg-indigo-500/10 transition-colors">
                    View Details
                  </button>
                </div>
              </motion.div>
            ))}
          </div>

          <div className="text-center pt-2">
            <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
              View all recommendations →
            </button>
          </div>
        </div>

        {/* Right Sidebar: Top Product Associations & Recommendation Insights (1 col) */}
        <div className="space-y-5">
          {/* Top Product Associations Card */}
          <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-base font-bold text-slate-900 dark:text-slate-100">
                Top Product Associations
              </h2>
              <button className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:underline">
                View All
              </button>
            </div>

            <div className="space-y-3">
              {topAssociations.map((assoc) => (
                <div
                  key={assoc.rank}
                  className="flex items-center justify-between p-2.5 rounded-xl hover:bg-slate-50 dark:hover:bg-slate-700/30 transition-colors"
                >
                  <div className="flex items-center gap-2.5">
                    <span className="w-5 h-5 rounded-full bg-amber-100 dark:bg-amber-500/20 text-amber-700 dark:text-amber-400 text-xs font-bold flex items-center justify-center">
                      {assoc.rank}
                    </span>
                    <span className="text-xs font-semibold text-slate-800 dark:text-slate-200">
                      {assoc.productA}
                    </span>
                    <span className="text-slate-400 text-xs font-bold">↔</span>
                    <span className="text-xs font-semibold text-slate-800 dark:text-slate-200">
                      {assoc.productB}
                    </span>
                  </div>

                  <div className="text-right">
                    <span className="px-2 py-0.5 rounded-md bg-emerald-50 dark:bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 text-[11px] font-bold">
                      Lift {assoc.lift}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Recommendation Insights Card */}
          <div className="p-6 rounded-2xl bg-emerald-50/60 dark:bg-emerald-950/20 border border-emerald-100 dark:border-emerald-800/40 shadow-sm">
            <div className="flex items-center gap-2 mb-2">
              <Sparkles className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
              <h3 className="text-sm font-bold text-emerald-950 dark:text-emerald-200">
                Recommendation Insights
              </h3>
            </div>
            <p className="text-xs text-emerald-900/80 dark:text-emerald-300/80 leading-relaxed font-medium">
              {insight}
            </p>
          </div>
        </div>
      </div>

      {/* Row 3: Recently Searched Chips */}
      <div className="p-6 rounded-2xl bg-white dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
        <h3 className="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-3">
          Recently Searched
        </h3>
        <div className="flex flex-wrap items-center gap-3">
          {RECENT_SEARCHES.map((item) => (
            <button
              key={item.name}
              onClick={() => handleRecentClick(item.name)}
              className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-slate-50 dark:bg-slate-700/50 hover:bg-indigo-50 dark:hover:bg-indigo-500/15 border border-slate-200/80 dark:border-slate-700 text-xs font-medium text-slate-700 dark:text-slate-300 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors"
            >
              <span className="text-sm">{item.icon}</span>
              <span className="font-semibold">{item.name}</span>
              <span className="text-[10px] text-slate-400">{item.time}</span>
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Recommendations;