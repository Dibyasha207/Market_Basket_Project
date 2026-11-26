// import React from "react";
import { Sparkles } from "lucide-react";
import EmptyState from "../dashboard/EmptyState";
import { ListSkeleton } from "../dashboard/LoadingState";
import ErrorState from "../dashboard/ErrorState";
import { timeAgo } from "../../utils/formatters";

const IMPACT_STYLES = {
  "High Impact": "bg-red-50 dark:bg-red-500/15 text-red-600 dark:text-red-400",
  "Medium Impact": "bg-amber-50 dark:bg-amber-500/15 text-amber-600 dark:text-amber-400",
  "Trend Detected": "bg-blue-50 dark:bg-blue-500/15 text-blue-600 dark:text-blue-400",
};

const MBAInsights = ({ insights, isLoading, error, onRetry }) => {
  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm h-full">
      <div className="flex items-center gap-2.5 mb-5">
        <span className="w-9 h-9 rounded-xl bg-violet-100 dark:bg-violet-500/15 flex items-center justify-center">
          <Sparkles className="w-4.5 h-4.5 text-violet-600 dark:text-violet-400" />
        </span>
        <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">AI Recommendation Engine</h3>
      </div>

      {isLoading ? (
        <ListSkeleton rows={4} />
      ) : error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !insights || insights.length === 0 ? (
        <EmptyState message="No AI insights available for the current data." />
      ) : (
        <ul className="space-y-3">
          {insights.map((insight) => (
            <li key={insight.id} className="p-3.5 rounded-xl border border-slate-100 dark:border-slate-700">
              <p className="text-sm font-semibold text-slate-800 dark:text-slate-100 mb-1">{insight.title}</p>
              <p className="text-xs text-slate-500 dark:text-slate-400 leading-relaxed mb-2.5">{insight.description}</p>
              <div className="flex items-center justify-between">
                {insight.impact && (
                  <span className={`px-2 py-0.5 rounded-md text-[11px] font-semibold ${IMPACT_STYLES[insight.impact] || IMPACT_STYLES["Medium Impact"]}`}>
                    {insight.impact}
                  </span>
                )}
                {insight.createdAt && (
                  <span className="text-[11px] text-slate-400 dark:text-slate-500">{timeAgo(insight.createdAt)}</span>
                )}
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default MBAInsights;