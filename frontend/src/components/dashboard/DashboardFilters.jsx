// import React from "react";
import { Calendar, ChevronDown } from "lucide-react";
import { DATE_RANGE_PRESETS, GRANULARITY_OPTIONS } from "../../utils/constants";
import { formatDateRange } from "../../utils/formatters";

const DashboardFilters = ({ preset, granularity, startDate, endDate, onPresetChange, onGranularityChange }) => {
  return (
    <div className="flex flex-wrap items-center gap-3">
      <div className="relative">
        <select
          value={preset}
          onChange={(e) => onPresetChange(e.target.value)}
          className="appearance-none flex items-center gap-2 pl-9 pr-9 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-sm font-medium text-slate-700 dark:text-slate-200 outline-none focus:border-indigo-300 dark:focus:border-indigo-500/50 cursor-pointer"
        >
          {DATE_RANGE_PRESETS.map((p) => (
            <option key={p.value} value={p.value}>
              {p.label}
            </option>
          ))}
        </select>
        <Calendar className="w-4 h-4 text-slate-400 dark:text-slate-500 absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" />
        <ChevronDown className="w-3.5 h-3.5 text-slate-400 dark:text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
      </div>

      <div className="relative">
        <select
          value={granularity}
          onChange={(e) => onGranularityChange(e.target.value)}
          className="appearance-none pl-4 pr-9 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-sm font-medium text-slate-700 dark:text-slate-200 outline-none focus:border-indigo-300 dark:focus:border-indigo-500/50 cursor-pointer"
        >
          {GRANULARITY_OPTIONS.map((g) => (
            <option key={g.value} value={g.value}>
              {g.label}
            </option>
          ))}
        </select>
        <ChevronDown className="w-3.5 h-3.5 text-slate-400 dark:text-slate-500 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" />
      </div>

      {startDate && endDate && (
        <span className="text-xs text-slate-400 dark:text-slate-500 font-medium hidden sm:inline">
          {formatDateRange(startDate, endDate)}
        </span>
      )}
    </div>
  );
};

export default DashboardFilters;