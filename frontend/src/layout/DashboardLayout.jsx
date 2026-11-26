import { useState } from "react";
import { Outlet } from "react-router-dom";
import Sidebar from "./Sidebar";
import Navbar from "./Navbar";
import AIChatWidget from "../components/dashboard/AIChatWidget";

const DashboardLayout = () => {
  const [collapsed, setCollapsed] = useState(false);
  const [dateRange, setDateRange] = useState("7d");

  return (
    <div className="min-h-screen bg-slate-50 dark:bg-slate-900 transition-colors duration-300">
      <Sidebar collapsed={collapsed} onToggle={() => setCollapsed((v) => !v)} />
      <Navbar dateRange={dateRange} onDateRangeChange={setDateRange} sidebarCollapsed={collapsed} />

      <main
        className={`pt-20 min-h-screen transition-all duration-300 ${collapsed ? "pl-20" : "pl-64"}`}
      >
        <div className="px-6 lg:px-8 py-8">
          <Outlet context={{ dateRange }} />
        </div>
      </main>

      <AIChatWidget />
    </div>
  );
};

export default DashboardLayout;