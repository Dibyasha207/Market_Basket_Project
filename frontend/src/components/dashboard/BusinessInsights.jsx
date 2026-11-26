// import React from "react";
import { Sparkles, ChevronRight } from "lucide-react";
import { ListSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";
import EmptyState from "./EmptyState";
import { timeAgo } from "../../utils/formatters";

const PRIORITY_STYLES = {
  high: "bg-red-50 dark:bg-red-500/15 text-red-600 dark:text-red-400",
  medium: "bg-amber-50 dark:bg-amber-500/15 text-amber-600 dark:text-amber-400",
  low: "bg-slate-100 dark:bg-slate-700/60 text-slate-500 dark:text-slate-400",
};

const BusinessInsights = ({ insights, isLoading, error, onRetry }) => {
  if (isLoading) return <ListSkeleton rows={4} />;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm h-full">
      <div className="flex items-center justify-between mb-5">
        <div className="flex items-center gap-2.5">
          <span className="w-9 h-9 rounded-xl bg-violet-100 dark:bg-violet-500/15 flex items-center justify-center">
            <Sparkles className="w-4.5 h-4.5 text-violet-600 dark:text-violet-400" />
          </span>
          <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Business Insights</h3>
        </div>
        <button className="inline-flex items-center gap-1 text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:text-indigo-700 dark:hover:text-indigo-300 transition-colors">
          View All
          <ChevronRight className="w-3.5 h-3.5" />
        </button>
      </div>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !insights || insights.length === 0 ? (
        <EmptyState message="No business insights available yet." />
      ) : (
        <ul className="space-y-3">
          {insights.map((insight) => (
            <li key={insight.id} className="p-3.5 rounded-xl border border-slate-100 dark:border-slate-700 hover:border-indigo-200 dark:hover:border-indigo-500/40 transition-colors">
              <div className="flex items-start justify-between gap-3 mb-1.5">
                <p className="text-sm font-semibold text-slate-800 dark:text-slate-100">{insight.title}</p>
                {insight.priority && (
                  <span className={`px-2 py-0.5 rounded-md text-[11px] font-semibold shrink-0 ${PRIORITY_STYLES[insight.priority] || PRIORITY_STYLES.low}`}>
                    {insight.priority}
                  </span>
                )}
              </div>
              <p className="text-xs text-slate-500 dark:text-slate-400 leading-relaxed mb-2">{insight.description}</p>
              <div className="flex items-center justify-between text-[11px] text-slate-400 dark:text-slate-500">
                <span>{insight.source}</span>
                <span>{timeAgo(insight.createdAt)}</span>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default BusinessInsights;