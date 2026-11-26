import  { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { motion } from "framer-motion";
import { ShieldCheck } from "lucide-react";
import LoginIllustration from "../components/auth/LoginIllustration";
import LoginForm from "../components/auth/LoginForm";
import { useAuth } from "../hooks/useAuth";

const AdminLogin = () => {
  const { isAuthenticated, isLoading } = useAuth();
  const navigate = useNavigate();

  // Redirect already-authenticated admins straight to the dashboard
  useEffect(() => {
    if (!isLoading && isAuthenticated) {
      navigate("/dashboard", { replace: true });
    }
  }, [isAuthenticated, isLoading, navigate]);

  return (
    <div className="min-h-screen grid lg:grid-cols-2 bg-white">
      <LoginIllustration />

      <div className="relative flex items-center justify-center px-6 sm:px-10 py-16 overflow-hidden">
        {/* Ambient background for the form side */}
        <div className="pointer-events-none absolute inset-0 overflow-hidden">
          <div className="absolute -top-32 -right-32 w-96 h-96 rounded-full bg-indigo-100/60 blur-3xl" />
          <div className="absolute -bottom-32 -left-32 w-96 h-96 rounded-full bg-violet-100/50 blur-3xl" />
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, ease: "easeOut" }}
          className="relative z-10 w-full max-w-md p-8 sm:p-10 rounded-3xl bg-white/80 backdrop-blur-xl border border-slate-200/70 shadow-2xl shadow-indigo-500/10"
        >
          {/* Mobile-only logo (desktop shows it in the illustration panel) */}
          <div className="flex lg:hidden items-center gap-2.5 mb-8">
            <span className="flex items-center justify-center w-9 h-9 rounded-xl bg-gradient-to-br from-indigo-600 via-violet-600 to-purple-600 shadow-md">
              <ShieldCheck className="w-4.5 h-4.5 text-white" strokeWidth={2.4} />
            </span>
            <span className="text-base font-bold text-slate-900">
              AI Retail Intelligence
            </span>
          </div>

          <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight">
            Administrator Login
          </h1>
          <p className="mt-2.5 mb-9 text-sm text-slate-500">
            Sign in to access the Retail Intelligence Dashboard.
          </p>

          <LoginForm />
        </motion.div>
      </div>
    </div>
  );
};

export default AdminLogin;