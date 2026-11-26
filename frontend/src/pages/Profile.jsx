// import React from "react";
import { motion } from "framer-motion";
import { ShieldCheck, Mail, Calendar, Clock, LogOut } from "lucide-react";
import { useAuth } from "../hooks/useAuth";

const Profile = () => {
  const { admin, logout } = useAuth();

  const handleLogout = () => {
    logout();
  };

  return (
    <div className="flex flex-col items-center space-y-6">
      <div className="text-center">
        <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
          Profile
        </h1>
        <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
          Your administrator account details
        </p>
      </div>

      <motion.div
        initial={{ opacity: 0, y: 16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.4 }}
        className="w-full p-8 rounded-2xl bg-white dark:bg-slate-800 border-slate-200/80 dark:border-slate-700 shadow-sm max-w-2xl"
      >
        <div className="flex items-center justify-center gap-4 mb-8">
          <span className="w-16 h-16 rounded-2xl bg-gradient-to-br from-indigo-500 to-violet-500 flex items-center justify-center text-white text-2xl font-bold shrink-0">
            {admin?.name?.charAt(0)?.toUpperCase() || "A"}
          </span>
          <div className="text-center">
            <p className="text-lg font-bold text-slate-900 dark:text-slate-100">
              {admin?.name || "Admin User"}
            </p>
            <span className="inline-flex items-center justify-center gap-1 mt-1 px-2.5 py-1 rounded-md bg-indigo-50 dark:bg-indigo-500/15 text-indigo-600 dark:text-indigo-400 text-xs font-semibold">
              <ShieldCheck className="w-3.5 h-3.5" />
              Administrator
            </span>
          </div>
        </div>

        {/* Yaha change kiya: flex-col + items-center */}
        <dl className="flex flex-col items-center space-y-5 mb-8">
          <div className="flex items-center gap-3 w-full max-w-sm">
            <span className="w-9 h-9 rounded-lg bg-slate-100 dark:bg-slate-700/60 flex items-center justify-center shrink-0">
              <Mail className="w-4 h-4 text-slate-500 dark:text-slate-300" />
            </span>
            <div>
              <dt className="text-xs text-slate-400 dark:text-slate-500">Email</dt>
              <dd className="text-sm font-medium text-slate-800 dark:text-slate-100">{admin?.email || "—"}</dd>
            </div>
          </div>

          {admin?.created_at && (
            <div className="flex items-center gap-3 w-full max-w-sm">
              <span className="w-9 h-9 rounded-lg bg-slate-100 dark:bg-slate-700/60 flex items-center justify-center shrink-0">
                <Calendar className="w-4 h-4 text-slate-500 dark:text-slate-300" />
              </span>
              <div>
                <dt className="text-xs text-slate-400 dark:text-slate-500">Account Created</dt>
                <dd className="text-sm font-medium text-slate-800 dark:text-slate-100">
                  {new Date(admin.created_at).toLocaleDateString("en-US", {
                    year: "numeric",
                    month: "long",
                    day: "numeric",
                  })}
                </dd>
              </div>
            </div>
          )}

          {admin?.last_login && (
            <div className="flex items-center gap-3 w-full max-w-sm">
              <span className="w-9 h-9 rounded-lg bg-slate-100 dark:bg-slate-700/60 flex items-center justify-center shrink-0">
                <Clock className="w-4 h-4 text-slate-500 dark:text-slate-300" />
              </span>
              <div>
                <dt className="text-xs text-slate-400 dark:text-slate-500">Last Login</dt>
                <dd className="text-sm font-medium text-slate-800 dark:text-slate-100">
                  {new Date(admin.last_login).toLocaleString("en-US")}
                </dd>
              </div>
            </div>
          )}
        </dl>

        {/* Logout Button */}
        <button
          onClick={handleLogout}
          className="w-full flex items-center justify-center gap-2 px-4 py-2.5 rounded-xl bg-red-500 hover:bg-red-600 text-white font-semibold transition-colors duration-200"
        >
          <LogOut className="w-4 h-4" />
          Logout
        </button>
      </motion.div>
    </div>
  );
};

export default Profile;