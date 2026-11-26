// import React from "react";
import { motion } from "framer-motion";
import { Download, RefreshCw } from "lucide-react";

const MBAHeader = ({ onRefresh, isRefreshing }) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: -8 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4 }}
      className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4"
    >
      <div>
        <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
          Market Basket Analysis
        </h1>
        <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
          Discover product relationships, purchase patterns, and cross-selling opportunities.
        </p>
      </div>

      <div className="flex items-center gap-2.5">
        <button
          onClick={onRefresh}
          disabled={isRefreshing}
          className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-sm font-medium text-slate-700 dark:text-slate-200 hover:border-indigo-200 dark:hover:border-indigo-500/50 transition-colors disabled:opacity-60"
        >
          <RefreshCw className={`w-4 h-4 ${isRefreshing ? "animate-spin" : ""}`} />
          Refresh
        </button>
        <button className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white text-sm font-semibold shadow-md shadow-indigo-500/25 hover:shadow-lg hover:-translate-y-0.5 transition-all duration-200">
          <Download className="w-4 h-4" />
          Export Report
        </button>
      </div>
    </motion.div>
  );
};

export default MBAHeader;