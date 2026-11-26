// import React from "react";
import { Package } from "lucide-react";
import EmptyState from "../dashboard/EmptyState";
import { ListSkeleton } from "../dashboard/LoadingState";
import ErrorState from "../dashboard/ErrorState";

const TAG_STYLES = {
  "Best Seller": "bg-amber-50 dark:bg-amber-500/15 text-amber-600 dark:text-amber-400",
  "High Impact": "bg-emerald-50 dark:bg-emerald-500/15 text-emerald-600 dark:text-emerald-400",
  Recommended: "bg-blue-50 dark:bg-blue-500/15 text-blue-600 dark:text-blue-400",
};

const RecommendedBundles = ({ bundles, isLoading, error, onRetry }) => {
  if (isLoading) return <ListSkeleton rows={3} />;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Recommended Product Bundles</h3>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !bundles || bundles.length === 0 ? (
        <EmptyState message="No bundle recommendations available yet." />
      ) : (
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-4">
          {bundles.map((bundle) => (
            <div
              key={bundle.id}
              className="p-4 rounded-xl border border-slate-200 dark:border-slate-700 hover:border-indigo-200 dark:hover:border-indigo-500/40 hover:shadow-md transition-all duration-200"
            >
              <span className="w-10 h-10 rounded-lg bg-indigo-50 dark:bg-indigo-500/15 flex items-center justify-center mb-3">
                <Package className="w-5 h-5 text-indigo-600 dark:text-indigo-400" />
              </span>
              <p className="text-sm font-bold text-slate-900 dark:text-slate-100 mb-1">{bundle.name}</p>
              <p className="text-xs text-slate-500 dark:text-slate-400 mb-3">{bundle.products.join(" + ")}</p>

              <div className="grid grid-cols-2 gap-2 text-xs mb-3">
                <div>
                  <p className="text-slate-400 dark:text-slate-500">Lift Score</p>
                  <p className="font-semibold text-slate-800 dark:text-slate-100">
                    {bundle.lift !== null ? bundle.lift.toFixed(2) : "Pending"}
                  </p>
                </div>
                <div>
                  <p className="text-slate-400 dark:text-slate-500">Confidence</p>
                  <p className="font-semibold text-slate-800 dark:text-slate-100">
                    {bundle.confidence !== null ? `${(bundle.confidence * 100).toFixed(0)}%` : "Pending"}
                  </p>
                </div>
              </div>

              {bundle.expectedRevenueIncrease && (
                <p className="text-xs text-emerald-600 dark:text-emerald-400 font-semibold mb-3">
                  ↑ {bundle.expectedRevenueIncrease}
                </p>
              )}

              {bundle.tag && (
                <span className={`inline-block px-2 py-0.5 rounded-md text-[11px] font-semibold ${TAG_STYLES[bundle.tag] || TAG_STYLES.Recommended}`}>
                  {bundle.tag}
                </span>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default RecommendedBundles;