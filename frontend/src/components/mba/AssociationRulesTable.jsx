// import React from "react";
import { Eye, ShoppingCart, ChevronLeft, ChevronRight } from "lucide-react";
import EmptyState from "../dashboard/EmptyState";
import ErrorState from "../dashboard/ErrorState";
import { ListSkeleton } from "../dashboard/LoadingState";

const STRENGTH_STYLES = {
  "Very Strong": "bg-emerald-50 dark:bg-emerald-500/15 text-emerald-600 dark:text-emerald-400",
  Strong: "bg-blue-50 dark:bg-blue-500/15 text-blue-600 dark:text-blue-400",
  Medium: "bg-amber-50 dark:bg-amber-500/15 text-amber-600 dark:text-amber-400",
  Weak: "bg-slate-100 dark:bg-slate-700/60 text-slate-500 dark:text-slate-400",
};

const AssociationRulesTable = ({ rulesData, isLoading, error, onRetry, page, onPageChange }) => {
  const { rules, pagination } = rulesData;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <h3 className="text-base font-bold text-slate-900 dark:text-slate-100 mb-5">Association Rules</h3>

      {isLoading ? (
        <ListSkeleton rows={5} />
      ) : error ? (
        <ErrorState message={error} onRetry={onRetry} />
      ) : rules.length === 0 ? (
        <EmptyState message="No association rules match the current filters." />
      ) : (
        <>
          <div className="overflow-x-auto -mx-2">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-[11px] font-semibold text-slate-400 dark:text-slate-500 uppercase tracking-wide">
                  <th className="px-2 pb-3">Antecedent</th>
                  <th className="px-2 pb-3"></th>
                  <th className="px-2 pb-3">Consequent</th>
                  <th className="px-2 pb-3">Support</th>
                  <th className="px-2 pb-3">Confidence</th>
                  <th className="px-2 pb-3">Lift</th>
                  <th className="px-2 pb-3">Conviction</th>
                  <th className="px-2 pb-3">Strength</th>
                  <th className="px-2 pb-3 text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100 dark:divide-slate-700">
                {rules.map((rule) => (
                  <tr key={rule.id} className="hover:bg-slate-50 dark:hover:bg-slate-700/30 transition-colors">
                    <td className="px-2 py-3 font-medium text-slate-800 dark:text-slate-100 whitespace-nowrap">
                      {rule.antecedent}
                    </td>
                    <td className="px-2 py-3 text-slate-300 dark:text-slate-600">→</td>
                    <td className="px-2 py-3 font-medium text-slate-800 dark:text-slate-100 whitespace-nowrap">
                      {rule.consequent}
                    </td>
                    <td className="px-2 py-3 text-slate-600 dark:text-slate-300">{(rule.support * 100).toFixed(2)}%</td>
                    <td className="px-2 py-3 text-slate-600 dark:text-slate-300">{(rule.confidence * 100).toFixed(2)}%</td>
                    <td className="px-2 py-3 text-slate-600 dark:text-slate-300">{rule.lift.toFixed(2)}</td>
                    <td className="px-2 py-3 text-slate-600 dark:text-slate-300">{rule.conviction.toFixed(2)}</td>
                    <td className="px-2 py-3">
                      {rule.strength && (
                        <span className={`px-2 py-0.5 rounded-md text-[11px] font-semibold ${STRENGTH_STYLES[rule.strength] || STRENGTH_STYLES.Weak}`}>
                          {rule.strength}
                        </span>
                      )}
                    </td>
                    <td className="px-2 py-3">
                      <div className="flex items-center justify-end gap-1.5">
                        <button
                          aria-label="View rule details"
                          className="w-7 h-7 rounded-lg flex items-center justify-center text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 dark:hover:bg-indigo-500/10 transition-colors"
                        >
                          <Eye className="w-3.5 h-3.5" />
                        </button>
                        <button
                          aria-label="Create bundle from rule"
                          className="w-7 h-7 rounded-lg flex items-center justify-center text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 dark:hover:bg-indigo-500/10 transition-colors"
                        >
                          <ShoppingCart className="w-3.5 h-3.5" />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex items-center justify-between mt-5 pt-4 border-t border-slate-100 dark:border-slate-700">
            <p className="text-xs text-slate-400 dark:text-slate-500">
              Showing {(pagination.page - 1) * pagination.limit + 1} to{" "}
              {Math.min(pagination.page * pagination.limit, pagination.total)} of {pagination.total} rules
            </p>
            <div className="flex items-center gap-1.5">
              <button
                onClick={() => onPageChange(Math.max(page - 1, 1))}
                disabled={page <= 1}
                aria-label="Previous page"
                className="w-8 h-8 rounded-lg border border-slate-200 dark:border-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400 hover:border-indigo-200 dark:hover:border-indigo-500/40 disabled:opacity-40 disabled:pointer-events-none transition-colors"
              >
                <ChevronLeft className="w-4 h-4" />
              </button>
              <span className="text-xs font-semibold text-slate-600 dark:text-slate-300 px-2">
                {pagination.page} / {pagination.totalPages}
              </span>
              <button
                onClick={() => onPageChange(Math.min(page + 1, pagination.totalPages))}
                disabled={page >= pagination.totalPages}
                aria-label="Next page"
                className="w-8 h-8 rounded-lg border border-slate-200 dark:border-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400 hover:border-indigo-200 dark:hover:border-indigo-500/40 disabled:opacity-40 disabled:pointer-events-none transition-colors"
              >
                <ChevronRight className="w-4 h-4" />
              </button>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default AssociationRulesTable;