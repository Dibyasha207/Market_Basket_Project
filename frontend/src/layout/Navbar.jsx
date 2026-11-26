import { useState, useRef } from "react";
import { useNavigate } from "react-router-dom";
import { Search, Bell, Sun, Moon, Calendar, ChevronDown, Settings, User, ShieldCheck } from "lucide-react";
import { AnimatePresence, motion } from "framer-motion";
import { DATE_RANGE_PRESETS } from "../utils/constants";
import { useAuth } from "../hooks/useAuth";
import { useTheme } from "../hooks/useTheme";
import { useClickOutside } from "../hooks/useClickOutside";
import NotificationsDropdown from "../components/dashboard/NotificationsDropdown";

const Navbar = ({ dateRange, onDateRangeChange, sidebarCollapsed }) => {
  const navigate = useNavigate();
  const { admin, logout } = useAuth();
  const { isDark, toggleTheme } = useTheme();

  const [showDateMenu, setShowDateMenu] = useState(false);
  const [showProfileMenu, setShowProfileMenu] = useState(false);
  const [showNotifications, setShowNotifications] = useState(false);

  const dateTriggerRef = useRef(null);
  const datePanelRef = useRef(null);
  const profileTriggerRef = useRef(null);
  const profilePanelRef = useRef(null);
  const notificationsTriggerRef = useRef(null);
  const notificationsPanelRef = useRef(null);

  const closeAllExcept = (which) => {
    setShowDateMenu(which === "date");
    setShowProfileMenu(which === "profile");
    setShowNotifications(which === "notifications");
  };

  useClickOutside([dateTriggerRef, datePanelRef], () => setShowDateMenu(false), showDateMenu);
  useClickOutside([profileTriggerRef, profilePanelRef], () => setShowProfileMenu(false), showProfileMenu);
  useClickOutside(
    [notificationsTriggerRef, notificationsPanelRef],
    () => setShowNotifications(false),
    showNotifications
  );

  const activePreset = DATE_RANGE_PRESETS.find((p) => p.value === dateRange) || DATE_RANGE_PRESETS[0];

  // const handleLogout = async () => {
  //   setShowProfileMenu(false);
  //   await logout();
  // };

  return (
    <header
      className={`fixed top-0 right-0 h-20 z-30 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl border-b border-slate-200/70 dark:border-slate-700/60 flex items-center justify-between px-6 lg:px-8 transition-all duration-300 ${
        sidebarCollapsed ? "left-20" : "left-64"
      }`}
    >
      {/* Search */}
      <div className="relative hidden md:block w-full max-w-xs">
        <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 dark:text-slate-500" />
        <input
          type="text"
          placeholder="Search products, orders, customers..."
          className="w-full pl-10 pr-4 py-2.5 rounded-xl bg-slate-100/80 dark:bg-slate-800/80 border border-transparent text-sm text-slate-800 dark:text-slate-100 placeholder:text-slate-400 dark:placeholder:text-slate-500 outline-none focus:bg-white dark:focus:bg-slate-800 focus:border-indigo-200 dark:focus:border-indigo-500/50 focus:ring-4 focus:ring-indigo-50 dark:focus:ring-indigo-500/10 transition-all duration-200"
        />
      </div>

      <div className="flex items-center gap-2.5 ml-auto">
        {/* Date range */}
        <div className="relative">
          <button
            ref={dateTriggerRef}
            onClick={() => closeAllExcept(showDateMenu ? null : "date")}
            className="flex items-center gap-2 px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 text-sm font-medium text-slate-700 dark:text-slate-200 hover:border-indigo-200 dark:hover:border-indigo-500/50 transition-colors"
          >
            <Calendar className="w-4 h-4 text-slate-400 dark:text-slate-500" />
            <span className="hidden sm:inline">{activePreset.label}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400 dark:text-slate-500" />
          </button>
          <AnimatePresence>
            {showDateMenu && (
              <motion.div
                ref={datePanelRef}
                initial={{ opacity: 0, y: -8 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -8 }}
                transition={{ duration: 0.15 }}
                className="absolute right-0 mt-2 w-44 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 shadow-xl overflow-hidden"
              >
                {DATE_RANGE_PRESETS.map((preset) => (
                  <button
                    key={preset.value}
                    onClick={() => {
                      onDateRangeChange(preset.value);
                      setShowDateMenu(false);
                    }}
                    className={`w-full text-left px-4 py-2.5 text-sm hover:bg-slate-50 dark:hover:bg-slate-700/50 transition-colors ${
                      preset.value === dateRange
                        ? "text-indigo-600 dark:text-indigo-400 font-semibold"
                        : "text-slate-600 dark:text-slate-300"
                    }`}
                  >
                    {preset.label}
                  </button>
                ))}
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Notifications */}
        <div className="relative">
          <button
            ref={notificationsTriggerRef}
            onClick={() => closeAllExcept(showNotifications ? null : "notifications")}
            className="relative w-10 h-10 rounded-xl border border-slate-200 dark:border-slate-700 flex items-center justify-center hover:border-indigo-200 dark:hover:border-indigo-500/50 transition-colors"
          >
            <Bell className="w-4.5 h-4.5 text-slate-500 dark:text-slate-300" />
            <span className="absolute top-2 right-2 w-1.5 h-1.5 rounded-full bg-red-500" />
          </button>
          <NotificationsDropdown panelRef={notificationsPanelRef} isOpen={showNotifications} />
        </div>

        {/* Dark mode toggle */}
        <button
          onClick={toggleTheme}
          aria-label="Toggle dark mode"
          className="w-10 h-10 rounded-xl border border-slate-200 dark:border-slate-700 flex items-center justify-center hover:border-indigo-200 dark:hover:border-indigo-500/50 transition-colors"
        >
         {isDark ? (
  <Moon className="w-4.5 h-4.5 text-slate-300" />
) : (
  <Sun className="w-4.5 h-4.5 text-amber-500" />
)}
        </button>

        {/* Profile */}
        <div className="relative">
          <button
            ref={profileTriggerRef}
            onClick={() => closeAllExcept(showProfileMenu ? null : "profile")}
            className="w-10 h-10 rounded-xl bg-gradient-to-br from-indigo-500 to-violet-500 flex items-center justify-center text-white text-sm font-bold"
          >
            {admin?.name?.charAt(0)?.toUpperCase() || "A"}
          </button>
          <AnimatePresence>
            {showProfileMenu && (
              <motion.div
                ref={profilePanelRef}
                initial={{ opacity: 0, y: -8 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -8 }}
                transition={{ duration: 0.15 }}
                className="absolute right-0 mt-2 w-60 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 shadow-xl overflow-hidden"
              >
                <div className="px-4 py-3.5 border-b border-slate-100 dark:border-slate-700">
                  <div className="flex items-center gap-2.5">
                    <span className="w-9 h-9 rounded-xl bg-gradient-to-br from-indigo-500 to-violet-500 flex items-center justify-center text-white text-sm font-bold shrink-0">
                      {admin?.name?.charAt(0)?.toUpperCase() || "A"}
                    </span>
                    <div className="min-w-0">
                      <p className="text-sm font-semibold text-slate-800 dark:text-slate-100 truncate">
                        {admin?.name || "Admin User"}
                      </p>
                      <p className="text-xs text-slate-400 dark:text-slate-500 truncate">{admin?.email}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-1.5 mt-2.5">
                    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md bg-indigo-50 dark:bg-indigo-500/15 text-indigo-600 dark:text-indigo-400 text-[11px] font-semibold">
                      <ShieldCheck className="w-3 h-3" />
                      Administrator
                    </span>
                    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md bg-emerald-50 dark:bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 text-[11px] font-semibold">
                      <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                      Active
                    </span>
                  </div>
                </div>

                <button
                  onClick={() => {
                    navigate("/dashboard/profile");
                    setShowProfileMenu(false);
                  }}
                  className="w-full flex items-center gap-2.5 px-4 py-2.5 text-sm text-slate-600 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-700/50 transition-colors"
                >
                  <User className="w-4 h-4" /> Profile
                </button>
                <button
                  onClick={() => {
                    navigate("/dashboard/settings");
                    setShowProfileMenu(false);
                  }}
                  className="w-full flex items-center gap-2.5 px-4 py-2.5 text-sm text-slate-600 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-700/50 transition-colors"
                >
                  <Settings className="w-4 h-4" /> Account Settings
                </button>
                {/* <button
                  onClick={() => {
                    setShowProfileMenu(false);
                    closeAllExcept("notifications");
                  }}
                  className="w-full flex items-center gap-2.5 px-4 py-2.5 text-sm text-slate-600 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-700/50 transition-colors"
                >
                  <Bell className="w-4 h-4" /> Notifications
                </button> */}
                {/* <button
                  onClick={handleLogout}
                  className="w-full flex items-center gap-2.5 px-4 py-2.5 text-sm text-red-500 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-500/10 transition-colors border-t border-slate-100 dark:border-slate-700"
                >
                  <LogOut className="w-4 h-4" /> Logout
                </button> */}
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>
    </header>
  );
};

export default Navbar;