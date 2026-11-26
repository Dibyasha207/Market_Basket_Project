import { Routes, Route } from "react-router-dom";

import LandingPage from "../pages/LandingPage";
import AdminLogin from "../pages/AdminLogin";
import Dashboard from "../pages/Dashboard";
import Recommendations from "../pages/Recommendations";
import CustomerSegmentation from "../pages/CustomerSegmentation";
import SalesForecast from "../pages/SalesForecast";
import ProductAnalytics from "../pages/ProductAnalytics";
import AIAssistant from "../pages/AIAssistant";
import Reports from "../pages/Reports";
import Settings from "../pages/Settings";
import MarketBasketAnalysis from "../pages/MarketBasketAnalysis";
import NotFound from "../pages/NotFound";
import Profile from "../pages/Profile";

import ProtectedRoute from "../layout/ProtectedRoute";
import DashboardLayout from "../layout/DashboardLayout";

function AppRoutes() {
  return (
    <Routes>
      {/* Public Routes */}
      <Route path="/" element={<LandingPage />} />
      <Route path="/admin/login" element={<AdminLogin />} />

      {/* Protected Dashboard */}
      <Route element={<ProtectedRoute />}>
        <Route element={<DashboardLayout />}>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/dashboard/profile" element={<Profile />} />
          
          {/* Main Prompt Routes */}
          <Route path="/product-analytics" element={<ProductAnalytics />} />
          <Route path="/recommendations" element={<Recommendations />} />
          <Route path="/customer-segmentation" element={<CustomerSegmentation />} />
          <Route path="/sales-forecast" element={<SalesForecast />} />
          <Route path="/ai-assistant" element={<AIAssistant />} />
          <Route path="/reports" element={<Reports />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="/market-basket" element={<MarketBasketAnalysis />} />
          <Route path="/dashboard/market-basket" element={<MarketBasketAnalysis />} />

          {/* Route Aliases */}
          <Route path="/dashboard/products" element={<ProductAnalytics />} />
          <Route path="/dashboard/recommendations" element={<Recommendations />} />
          <Route path="/dashboard/customers" element={<CustomerSegmentation />} />
          <Route path="/dashboard/forecast" element={<SalesForecast />} />
          <Route path="/dashboard/assistant" element={<AIAssistant />} />
          <Route path="/dashboard/reports" element={<Reports />} />
          <Route path="/dashboard/settings" element={<Settings />} />
        </Route>
      </Route>

      {/* 404 */}
      <Route path="*" element={<NotFound />} />
    </Routes>
  );
}

export default AppRoutes;