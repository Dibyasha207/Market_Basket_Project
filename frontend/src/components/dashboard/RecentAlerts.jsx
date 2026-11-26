// import React from "react";
import { TrendingUp, AlertTriangle, Users, LineChart, ChevronRight } from "lucide-react";
import { ListSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";
import EmptyState from "./EmptyState";
import { timeAgo } from "../../utils/formatters";

const ICON_MAP = {
  revenue: { icon: TrendingUp, bg: "bg-emerald-100 dark:bg-emerald-500/15", color: "text-emerald-600 dark:text-emerald-400" },
  stock: { icon: AlertTriangle, bg: "bg-amber-100 dark:bg-amber-500/15", color: "text-amber-600 dark:text-amber-400" },
  segment: { icon: Users, bg: "bg-blue-100 dark:bg-blue-500/15", color: "text-blue-600 dark:text-blue-400" },
  forecast: { icon: LineChart, bg: "bg-violet-100 dark:bg-violet-500/15", color: "text-violet-600 dark:text-violet-400" },
};

const RecentAlerts = ({ alerts, isLoading, error, onRetry }) => {
  if (isLoading) return <ListSkeleton rows={4} />;

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm h-full">
      <div className="flex items-center justify-between mb-5">
        <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Recent Alerts</h3>
        <button className="inline-flex items-center gap-1 text-xs font-semibold text-indigo-600 dark:text-indigo-400 hover:text-indigo-700 dark:hover:text-indigo-300 transition-colors">
          View All
          <ChevronRight className="w-3.5 h-3.5" />
        </button>
      </div>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : !alerts || alerts.length === 0 ? (
        <EmptyState message="No recent alerts." />
      ) : (
        <ul className="space-y-1.5">
          {alerts.map((alert) => {
            const meta = ICON_MAP[alert.type] || ICON_MAP.revenue;
            const Icon = meta.icon;
            return (
              <li
                key={alert.id}
                className={`flex items-center justify-between gap-4 p-3 rounded-xl hover:bg-slate-50 dark:hover:bg-slate-700/40 transition-colors duration-200 ${
                  !alert.isRead ? "bg-indigo-50/40 dark:bg-indigo-500/5" : ""
                }`}
              >
                <div className="flex items-center gap-3 min-w-0">
                  <span className={`w-9 h-9 rounded-lg ${meta.bg} flex items-center justify-center shrink-0`}>
                    <Icon className={`w-4 h-4 ${meta.color}`} strokeWidth={2} />
                  </span>
                  <span className="text-sm text-slate-700 dark:text-slate-200 font-medium truncate">{alert.message}</span>
                </div>
                <span className="text-xs text-slate-400 dark:text-slate-500 shrink-0">{timeAgo(alert.createdAt)}</span>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
};

export default RecentAlerts;