import { useEffect, useState } from "react";
import { AnimatePresence, motion } from "framer-motion";
import { AlertTriangle, TrendingUp, Users, LineChart, Bell } from "lucide-react";
import { getRecentAlerts } from "../../services/dashboardService";
import { timeAgo } from "../../utils/formatters";

const TYPE_META = {
  revenue: { icon: TrendingUp, bg: "bg-emerald-100 dark:bg-emerald-500/15", color: "text-emerald-600 dark:text-emerald-400" },
  inventory: { icon: AlertTriangle, bg: "bg-amber-100 dark:bg-amber-500/15", color: "text-amber-600 dark:text-amber-400" },
  segment: { icon: Users, bg: "bg-blue-100 dark:bg-blue-500/15", color: "text-blue-600 dark:text-blue-400" },
  forecast: { icon: LineChart, bg: "bg-violet-100 dark:bg-violet-500/15", color: "text-violet-600 dark:text-violet-400" },
};

const PRIORITY_DOT = {
  high: "bg-red-500",
  medium: "bg-amber-500",
  low: "bg-slate-400",
};

const NotificationsDropdown = ({ panelRef, isOpen }) => {
  const [alerts, setAlerts] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const [hasFetched, setHasFetched] = useState(false);

  useEffect(() => {
    if (!isOpen || hasFetched) return;

    let isMounted = true;

    const fetchAlerts = async () => {
      setIsLoading(true);
      setError(null);
      try {
        const response = await getRecentAlerts(5);
        const rows = response?.data ?? [];
        if (isMounted) {
          setAlerts(
            rows.map((row) => ({
              id: row.notification_id,
              title: row.title,
              message: row.message,
              type: row.notification_type,
              priority: row.priority,
              isRead: Boolean(row.is_read),
              createdAt: row.created_at,
            }))
          );
          setHasFetched(true);
        }
      } catch (err) {
        if (process.env.NODE_ENV === "development") {
          console.error("Failed to load notifications:", err);
        }
        if (isMounted) setError("Unable to load notifications.");
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    fetchAlerts();
    return () => {
      isMounted = false;
    };
  }, [isOpen, hasFetched]);

  const unreadCount = alerts.filter((a) => !a.isRead).length;

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          ref={panelRef}
          initial={{ opacity: 0, y: -8 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -8 }}
          transition={{ duration: 0.15 }}
          className="absolute right-0 mt-2 w-80 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 shadow-xl overflow-hidden"
        >
          <div className="flex items-center justify-between px-4 py-3 border-b border-slate-100 dark:border-slate-700">
            <p className="text-sm font-bold text-slate-800 dark:text-slate-100">Notifications</p>
            {unreadCount > 0 && (
              <span className="px-2 py-0.5 rounded-full bg-indigo-100 dark:bg-indigo-500/20 text-indigo-600 dark:text-indigo-400 text-[11px] font-semibold">
                {unreadCount} new
              </span>
            )}
          </div>

          <div className="max-h-80 overflow-y-auto">
            {isLoading ? (
              <div className="p-4 space-y-3">
                {Array.from({ length: 3 }).map((_, i) => (
                  <div key={i} className="h-14 rounded-lg bg-slate-100 dark:bg-slate-700/60 animate-pulse" />
                ))}
              </div>
            ) : error ? (
              <p className="p-4 text-xs text-red-500">{error}</p>
            ) : alerts.length === 0 ? (
              <div className="flex flex-col items-center justify-center py-10 px-4 text-center">
                <Bell className="w-6 h-6 text-slate-300 dark:text-slate-600 mb-2" />
                <p className="text-xs text-slate-400 dark:text-slate-500">You're all caught up.</p>
              </div>
            ) : (
              <ul className="divide-y divide-slate-100 dark:divide-slate-700">
                {alerts.map((alert) => {
                  const meta = TYPE_META[alert.type] || TYPE_META.revenue;
                  const Icon = meta.icon;
                  return (
                    <li
                      key={alert.id}
                      className={`flex gap-3 px-4 py-3 hover:bg-slate-50 dark:hover:bg-slate-700/40 transition-colors ${
                        !alert.isRead ? "bg-indigo-50/40 dark:bg-indigo-500/5" : ""
                      }`}
                    >
                      <span className={`w-8 h-8 rounded-lg ${meta.bg} flex items-center justify-center shrink-0`}>
                        <Icon className={`w-4 h-4 ${meta.color}`} strokeWidth={2} />
                      </span>
                      <div className="min-w-0 flex-1">
                        <div className="flex items-center gap-1.5">
                          <p className="text-sm font-semibold text-slate-800 dark:text-slate-100 truncate">
                            {alert.title}
                          </p>
                          {alert.priority && (
                            <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${PRIORITY_DOT[alert.priority] || PRIORITY_DOT.low}`} />
                          )}
                        </div>
                        <p className="text-xs text-slate-500 dark:text-slate-400 line-clamp-2">{alert.message}</p>
                        <p className="text-[11px] text-slate-400 dark:text-slate-500 mt-1">{timeAgo(alert.createdAt)}</p>
                      </div>
                    </li>
                  );
                })}
              </ul>
            )}
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default NotificationsDropdown;