// import React from "react";
import { AlertCircle, RefreshCw } from "lucide-react";

const ErrorState = ({ message, onRetry, compact = false }) => (
  <div
    className={`flex flex-col items-center justify-center text-center rounded-2xl bg-red-50/60 dark:bg-red-500/5 border border-red-100 dark:border-red-500/20 ${
      compact ? "p-6" : "p-12"
    }`}
  >
    <span className="w-11 h-11 rounded-xl bg-red-100 dark:bg-red-500/15 flex items-center justify-center mb-3">
      <AlertCircle className="w-5 h-5 text-red-500 dark:text-red-400" />
    </span>
    <p className="text-sm font-semibold text-slate-800 dark:text-slate-100 mb-1">Something went wrong</p>
    <p className="text-xs text-slate-500 dark:text-slate-400 mb-4 max-w-xs">
      {message || "We couldn't load this data. Please try again."}
    </p>
    {onRetry && (
      <button
        onClick={onRetry}
        className="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-white dark:bg-slate-800 border border-red-200 dark:border-red-500/30 text-xs font-semibold text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-500/10 transition-colors"
      >
        <RefreshCw className="w-3.5 h-3.5" />
        Retry
      </button>
    )}
  </div>
);

export default ErrorState;