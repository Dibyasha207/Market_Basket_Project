// import React from "react";
import { NavLink } from "react-router-dom";
import { ChevronLeft, ShieldCheck, LogOut } from "lucide-react";
import { SIDEBAR_LINKS, SIDEBAR_FOOTER_LINKS } from "../utils/constants";
import { useAuth } from "../hooks/useAuth";

const Sidebar = ({ collapsed, onToggle }) => {
  const { admin, logout } = useAuth();

  const linkClasses = ({ isActive }) =>
    `group flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-sm font-medium transition-all duration-200 ${
      isActive
        ? "bg-gradient-to-r from-indigo-600 to-violet-600 text-white shadow-md shadow-indigo-500/20"
        : "text-slate-400 dark:text-slate-500 hover:text-white hover:bg-white/5"
    }`;

  return (
    <aside
      className={`fixed top-0 left-0 h-screen bg-slate-950 dark:bg-slate-950 border-r border-slate-800/60 flex flex-col z-40 transition-all duration-300 ${
        collapsed ? "w-20" : "w-64"
      }`}
    >
      {/* Logo - Sticky top */}
      <div className="flex items-center justify-between h-20 px-5 border-b border-slate-800/60 shrink-0 bg-slate-950 z-10">
        <div className="flex items-center gap-2.5 overflow-hidden">
          <span className="flex items-center justify-center w-9 h-9 rounded-xl bg-gradient-to-br from-indigo-500 to-violet-500 shadow-md shrink-0">
            <ShieldCheck className="w-4.5 h-4.5 text-white" strokeWidth={2.4} />
          </span>
          {!collapsed && (
            <span className="text-sm font-bold text-white whitespace-nowrap">AI Retail Intelligence</span>
          )}
        </div>
        <button
          onClick={onToggle}
          className="p-1.5 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors shrink-0"
        >
          <ChevronLeft className={`w-4 h-4 transition-transform duration-300 ${collapsed ? "rotate-180" : ""}`} />
        </button>
      </div>

      {/* Main nav - Only this scrolls */}
      <nav className="flex-1 overflow-y-auto px-3 py-6 space-y-1.5 scrollbar-thin scrollbar-thumb-slate-700 scrollbar-track-transparent">
        {SIDEBAR_LINKS.map((link) => {
          const Icon = link.icon;
          return (
            <NavLink key={link.path} to={link.path} end={link.exact} className={linkClasses}>
              <Icon className="w-[18px] h-[18px] shrink-0" strokeWidth={2} />
              {!collapsed && <span className="truncate">{link.label}</span>}
            </NavLink>
          );
        })}
      </nav>

      {/* Footer nav - Sticky bottom */}
      <div className="px-3 py-4 border-t border-slate-800/60 space-y-1.5 shrink-0 bg-slate-950">
        {SIDEBAR_FOOTER_LINKS.map((link) => {
          const Icon = link.icon;
          return (
            <NavLink key={link.path} to={link.path} className={linkClasses}>
              <Icon className="w-[18px] h-[18px] shrink-0" strokeWidth={2} />
              {!collapsed && <span className="truncate">{link.label}</span>}
            </NavLink>
          );
        })}
        <button
          onClick={logout}
          className="w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-sm font-medium text-slate-400 hover:text-red-400 hover:bg-red-500/5 transition-all duration-200"
        >
          <LogOut className="w-[18px] h-[18px] shrink-0" strokeWidth={2} />
          {!collapsed && <span>Logout</span>}
        </button>
      </div>

      {/* Profile - Sticky bottom */}
      {!collapsed && admin && (
        <div className="flex items-center gap-3 px-5 py-4 border-t border-slate-800/60 shrink-0 bg-slate-950">
          <span className="w-9 h-9 rounded-full bg-gradient-to-br from-indigo-500 to-violet-500 flex items-center justify-center text-white text-sm font-bold shrink-0">
            {admin.name?.charAt(0)?.toUpperCase() || "A"}
          </span>
          <div className="min-w-0">
            <p className="text-sm font-semibold text-white truncate">{admin.name || "Admin User"}</p>
            <p className="text-xs text-slate-500 truncate">{admin.email}</p>
          </div>
        </div>
      )}
    </aside>
  );
};

export default Sidebar;