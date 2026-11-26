// import React from "react";
import { Search, RotateCcw, Calendar } from "lucide-react";
// import { DEFAULT_MBA_FILTERS } from "../../hooks/useMBA";

const MBAFilters = ({
  filters,
  updateFilter,
  resetFilters,
  hasActiveFilters,
  filterMeta,
  rulesSearch,
  setRulesSearch,
}) => {
  return (
    <div className="p-4 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <div className="flex flex-wrap items-center gap-3">
        {/* Search */}
        <div className="relative flex-1 min-w-[200px]">
          <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 dark:text-slate-500" />
          <input
            type="text"
            value={rulesSearch}
            onChange={(e) => setRulesSearch(e.target.value)}
            placeholder="Search product..."
            aria-label="Search products in association rules"
            className="w-full pl-10 pr-4 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-900/50 border border-slate-200 dark:border-slate-700 text-sm text-slate-800 dark:text-slate-100 placeholder:text-slate-400 outline-none focus:border-indigo-300 dark:focus:border-indigo-500/50 focus:ring-4 focus:ring-indigo-50 dark:focus:ring-indigo-500/10 transition-all"
          />
        </div>

        {/* Category */}
        <select
          value={filters.category}
          onChange={(e) => updateFilter("category", e.target.value)}
          aria-label="Filter by category"
          className="px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50 text-sm text-slate-700 dark:text-slate-200 outline-none focus:border-indigo-300 dark:focus:border-indigo-500/50 cursor-pointer"
        >
          <option value="">All Categories</option>
          {filterMeta.categories.map((c) => (
            <option key={c} value={c}>{c}</option>
          ))}
        </select>

        {/* Country */}
        <select
          value={filters.country}
          onChange={(e) => updateFilter("country", e.target.value)}
          aria-label="Filter by country"
          className="px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50 text-sm text-slate-700 dark:text-slate-200 outline-none focus:border-indigo-300 dark:focus:border-indigo-500/50 cursor-pointer"
        >
          <option value="">All Countries</option>
          {filterMeta.countries.map((c) => (
            <option key={c} value={c}>{c}</option>
          ))}
        </select>

        {/* Min Support */}
        <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50">
          <label htmlFor="minSupport" className="text-xs font-medium text-slate-500 dark:text-slate-400 whitespace-nowrap">
            Min Support
          </label>
          <input
            id="minSupport"
            type="range"
            min="0"
            max="1"
            step="0.01"
            value={filters.minSupport}
            onChange={(e) => updateFilter("minSupport", Number(e.target.value))}
            className="w-20 accent-indigo-600"
          />
          <span className="text-xs font-semibold text-slate-700 dark:text-slate-200 w-9">
            {(filters.minSupport * 100).toFixed(0)}%
          </span>
        </div>

        {/* Min Confidence */}
        <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50">
          <label htmlFor="minConfidence" className="text-xs font-medium text-slate-500 dark:text-slate-400 whitespace-nowrap">
            Min Confidence
          </label>
          <input
            id="minConfidence"
            type="range"
            min="0"
            max="1"
            step="0.01"
            value={filters.minConfidence}
            onChange={(e) => updateFilter("minConfidence", Number(e.target.value))}
            className="w-20 accent-indigo-600"
          />
          <span className="text-xs font-semibold text-slate-700 dark:text-slate-200 w-9">
            {(filters.minConfidence * 100).toFixed(0)}%
          </span>
        </div>

        {/* Lift range */}
        <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50">
          <label className="text-xs font-medium text-slate-500 dark:text-slate-400 whitespace-nowrap">Lift</label>
          <input
            type="number"
            min="0"
            step="0.1"
            value={filters.liftMin}
            onChange={(e) => updateFilter("liftMin", Number(e.target.value))}
            aria-label="Minimum lift"
            className="w-14 px-1.5 py-1 rounded-lg border border-slate-200 dark:border-slate-700 bg-transparent text-xs text-slate-700 dark:text-slate-200 outline-none"
          />
          <span className="text-slate-400 text-xs">–</span>
          <input
            type="number"
            min="0"
            step="0.1"
            value={filters.liftMax}
            onChange={(e) => updateFilter("liftMax", Number(e.target.value))}
            aria-label="Maximum lift"
            className="w-14 px-1.5 py-1 rounded-lg border border-slate-200 dark:border-slate-700 bg-transparent text-xs text-slate-700 dark:text-slate-200 outline-none"
          />
        </div>

        {/* Date range */}
        <div className="flex items-center gap-1.5 px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900/50">
          <Calendar className="w-3.5 h-3.5 text-slate-400" />
          <input
            type="date"
            value={filters.startDate}
            onChange={(e) => updateFilter("startDate", e.target.value)}
            aria-label="Start date"
            className="bg-transparent text-xs text-slate-700 dark:text-slate-200 outline-none"
          />
          <span className="text-slate-400 text-xs">–</span>
          <input
            type="date"
            value={filters.endDate}
            onChange={(e) => updateFilter("endDate", e.target.value)}
            aria-label="End date"
            className="bg-transparent text-xs text-slate-700 dark:text-slate-200 outline-none"
          />
        </div>

        {/* Reset */}
        {hasActiveFilters && (
          <button
            onClick={resetFilters}
            className="inline-flex items-center gap-1.5 px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 text-xs font-semibold text-slate-600 dark:text-slate-300 hover:text-red-500 hover:border-red-200 dark:hover:border-red-500/40 transition-colors"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            Reset Filters
          </button>
        )}
      </div>
    </div>
  );
};

export default MBAFilters;