import { useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import toast from "react-hot-toast";
import { Mail, Lock, Eye, EyeOff, Loader2, ShieldCheck } from "lucide-react";
import { useAuth } from "../../hooks/useAuth";

const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

const LoginForm = () => {
  const { login } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();

  const [form, setForm] = useState({ email: "", password: "" });
  const [rememberMe, setRememberMe] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  const redirectTo = location.state?.from?.pathname || "/dashboard";

  const validate = () => {
    const errs = {};
    if (!form.email.trim()) {
      errs.email = "Administrator email is required";
    } else if (!EMAIL_REGEX.test(form.email.trim())) {
      errs.email = "Enter a valid email address";
    }

    if (!form.password) {
      errs.password = "Password is required";
    } else if (form.password.length < 6) {
      errs.password = "Password must be at least 6 characters";
    }

    setErrors(errs);
    return Object.keys(errs).length === 0;
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
    if (errors[name]) setErrors((prev) => ({ ...prev, [name]: undefined }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (isSubmitting) return;
    if (!validate()) return;

    setIsSubmitting(true);
    try {
      await login({ ...form, rememberMe });
      toast.success("Welcome back, Administrator");
      navigate(redirectTo, { replace: true });
    } catch (error) {
      const message =
        error.response?.data?.message ||
        "Invalid email or password. Please try again.";
      toast.error(message);
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} noValidate className="w-full">
      {/* Email */}
      <div className="mb-5">
        <label
          htmlFor="email"
          className="block text-sm font-semibold text-slate-700 mb-2"
        >
          Administrator Email
        </label>
        <div className="relative">
          <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-4.5 h-4.5 text-slate-400" />
          <input
            id="email"
            name="email"
            type="email"
            autoComplete="email"
            value={form.email}
            onChange={handleChange}
            placeholder="admin@retailintelligence.ai"
            className={`w-full pl-11 pr-4 py-3.5 rounded-xl border bg-white text-sm text-slate-900 placeholder:text-slate-400 outline-none transition-all duration-200 focus:ring-4 ${
              errors.email
                ? "border-red-300 focus:ring-red-100"
                : "border-slate-200 focus:border-indigo-400 focus:ring-indigo-100"
            }`}
          />
        </div>
        {errors.email && (
          <p className="mt-1.5 text-xs text-red-500">{errors.email}</p>
        )}
      </div>

      {/* Password */}
      <div className="mb-4">
        <label
          htmlFor="password"
          className="block text-sm font-semibold text-slate-700 mb-2"
        >
          Password
        </label>
        <div className="relative">
          <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-4.5 h-4.5 text-slate-400" />
          <input
            id="password"
            name="password"
            type={showPassword ? "text" : "password"}
            autoComplete="current-password"
            value={form.password}
            onChange={handleChange}
            placeholder="••••••••"
            className={`w-full pl-11 pr-11 py-3.5 rounded-xl border bg-white text-sm text-slate-900 placeholder:text-slate-400 outline-none transition-all duration-200 focus:ring-4 ${
              errors.password
                ? "border-red-300 focus:ring-red-100"
                : "border-slate-200 focus:border-indigo-400 focus:ring-indigo-100"
            }`}
          />
          <button
            type="button"
            onClick={() => setShowPassword((v) => !v)}
            className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 hover:text-indigo-600 transition-colors"
            tabIndex={-1}
            aria-label={showPassword ? "Hide password" : "Show password"}
          >
            {showPassword ? (
              <EyeOff className="w-4.5 h-4.5" />
            ) : (
              <Eye className="w-4.5 h-4.5" />
            )}
          </button>
        </div>
        {errors.password && (
          <p className="mt-1.5 text-xs text-red-500">{errors.password}</p>
        )}
      </div>

      {/* Remember me / Forgot password */}
      <div className="flex items-center justify-between mb-7">
        <label className="flex items-center gap-2 cursor-pointer select-none">
          <input
            type="checkbox"
            checked={rememberMe}
            onChange={(e) => setRememberMe(e.target.checked)}
            className="w-4 h-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-400 cursor-pointer"
          />
          <span className="text-sm text-slate-600">Remember me</span>
        </label>
        <button
          type="button"
          onClick={() => toast("Contact your system administrator to reset access.")}
          className="text-sm font-medium text-indigo-600 hover:text-indigo-700 transition-colors"
        >
          Forgot Password?
        </button>
      </div>

      {/* Submit */}
      <button
        type="submit"
        disabled={isSubmitting}
        className="w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white font-semibold shadow-lg shadow-indigo-500/25 hover:shadow-xl hover:shadow-indigo-500/40 hover:-translate-y-0.5 active:translate-y-0 transition-all duration-200 disabled:opacity-70 disabled:cursor-not-allowed disabled:translate-y-0"
      >
        {isSubmitting ? (
          <>
            <Loader2 className="w-4.5 h-4.5 animate-spin" />
            Signing in...
          </>
        ) : (
          <>
            <ShieldCheck className="w-4.5 h-4.5" />
            Login to Dashboard
          </>
        )}
      </button>

      <p className="mt-6 flex items-center justify-center gap-1.5 text-xs text-slate-400">
        <ShieldCheck className="w-3.5 h-3.5" />
        Protected by JWT Authentication
      </p>
    </form>
  );
};

export default LoginForm;