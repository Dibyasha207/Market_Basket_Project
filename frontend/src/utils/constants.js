import {
  LayoutDashboard,
  // BarChart3,
  Boxes,
  Sparkles,
  Users2,
  PackageSearch,
  LineChart,
  BotMessageSquare,
  FileText,
  Settings,
  LogOut,
} from "lucide-react";

export const SIDEBAR_LINKS = [
  { label: "Dashboard", icon: LayoutDashboard, path: "/dashboard", exact: true },
  { label: "Product Analytics", icon: PackageSearch, path: "/product-analytics" },
  { label: "Recommendations", icon: Sparkles, path: "/recommendations" },
  { label: "Customer Intelligence", icon: Users2, path: "/customer-segmentation" },
  { label: "Sales Forecast", icon: LineChart, path: "/sales-forecast" },
  { label: "Market Basket Analysis", icon: Boxes, path: "/dashboard/market-basket" },
  { label: "AI Assistant", icon: BotMessageSquare, path: "/ai-assistant" },
];

export const SIDEBAR_FOOTER_LINKS = [
  { label: "Reports", icon: FileText, path: "/reports" },
  { label: "Settings", icon: Settings, path: "/settings" },
];

export const LOGOUT_LINK = { label: "Logout", icon: LogOut };

export const CHART_COLORS = {
  primary: "#7C3AED",
  primaryLight: "#A78BFA",
  secondary: "#3B82F6",
  success: "#10B981",
  warning: "#F59E0B",
  danger: "#EF4444",
  neutral: "#94A3B8",
  palette: ["#7C3AED", "#3B82F6", "#10B981", "#F59E0B", "#94A3B8", "#EC4899"],
};

/**
 * ASSUMPTION: query param key names sent to the backend for date filtering.
 * If your backend expects different keys (e.g. "from"/"to" instead of
 * "start_date"/"end_date"), this is the ONLY place to change them —
 * useDashboardData.js reads from here, never hardcodes the keys itself.
 */
export const DASHBOARD_FILTER_PARAM_KEYS = {
  startDate: "start_date",
  endDate: "end_date",
  granularity: "granularity",
};

export const DATE_RANGE_PRESETS = [
  { label: "Last 7 Days", value: "7d", days: 7 },
  { label: "Last 30 Days", value: "30d", days: 30 },
  { label: "Last 90 Days", value: "90d", days: 90 },
];

export const GRANULARITY_OPTIONS = [
  { label: "Daily", value: "daily" },
  { label: "Weekly", value: "weekly" },
  { label: "Monthly", value: "monthly" },
];

export const DASHBOARD_FILTER_DEFAULTS = {
  preset: "30d",
  granularity: "daily",
};