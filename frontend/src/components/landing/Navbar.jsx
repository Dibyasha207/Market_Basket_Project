import  { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import { ShieldCheck, Menu, X } from "lucide-react";

const NAV_LINKS = [
  { label: "Home", href: "#home" },
  { label: "Features", href: "#features" },
  { label: "How It Works", href: "#how-it-works" },
  { label: "Technology", href: "#technology" },
  { label: "Contact", href: "#contact" },
];

const Navbar = () => {
  const [scrolled, setScrolled] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [activeHash, setActiveHash] = useState("#home");
  const navigate = useNavigate();

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 12);
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const handleNavClick = (e, href) => {
    e.preventDefault();
    setActiveHash(href);
    setMobileOpen(false);
    const el = document.querySelector(href);
    if (el) {
      el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  };

  const goToAdminLogin = () => {
    setMobileOpen(false);
    navigate("/admin/login");
  };

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        scrolled
          ? "bg-white/80 backdrop-blur-xl shadow-[0_4px_30px_rgba(99,102,241,0.08)] border-b border-slate-200/60"
          : "bg-white/40 backdrop-blur-md border-b border-transparent"
      }`}
    >
      <nav className="max-w-7xl mx-auto px-6 lg:px-10 h-20 flex items-center justify-between">
        {/* Logo */}
        <Link
          to="/"
          className="flex items-center gap-2.5 group"
          onClick={() => setActiveHash("#home")}
        >
          <span className="relative flex items-center justify-center w-10 h-10 rounded-xl bg-gradient-to-br from-indigo-600 via-violet-600 to-purple-600 shadow-lg shadow-indigo-500/30 group-hover:shadow-indigo-500/50 transition-shadow duration-300">
            <ShieldCheck className="w-5 h-5 text-white" strokeWidth={2.4} />
          </span>
          <span className="text-lg font-bold tracking-tight text-slate-900">
            AI Retail Intelligence
          </span>
        </Link>

        {/* Desktop Links */}
        <ul className="hidden lg:flex items-center gap-9">
          {NAV_LINKS.map((link) => (
            <li key={link.href} className="relative">
              <a
                href={link.href}
                onClick={(e) => handleNavClick(e, link.href)}
                className={`text-sm font-medium transition-colors duration-200 ${
                  activeHash === link.href
                    ? "text-indigo-600"
                    : "text-slate-600 hover:text-indigo-600"
                }`}
              >
                {link.label}
              </a>
              {activeHash === link.href && (
                <motion.span
                  layoutId="nav-underline"
                  className="absolute -bottom-2 left-1/2 -translate-x-1/2 w-1.5 h-1.5 rounded-full bg-indigo-600"
                  transition={{ type: "spring", stiffness: 380, damping: 30 }}
                />
              )}
            </li>
          ))}
        </ul>

        {/* Admin Login (Desktop) */}
        <button
          onClick={goToAdminLogin}
          className="hidden lg:inline-flex items-center gap-2 px-5 py-2.5 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white text-sm font-semibold shadow-md shadow-indigo-500/25 hover:shadow-lg hover:shadow-indigo-500/40 hover:-translate-y-0.5 active:translate-y-0 transition-all duration-200"
        >
          <ShieldCheck className="w-4 h-4" />
          Admin Login
        </button>

        {/* Mobile Toggle */}
        <button
          className="lg:hidden p-2 rounded-lg text-slate-700 hover:bg-slate-100 transition-colors"
          onClick={() => setMobileOpen((v) => !v)}
          aria-label="Toggle menu"
        >
          {mobileOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
        </button>
      </nav>

      {/* Mobile Menu */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: "auto", opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.25, ease: "easeInOut" }}
            className="lg:hidden overflow-hidden bg-white/95 backdrop-blur-xl border-t border-slate-200/60"
          >
            <div className="px-6 py-5 flex flex-col gap-4">
              {NAV_LINKS.map((link) => (
                <a
                  key={link.href}
                  href={link.href}
                  onClick={(e) => handleNavClick(e, link.href)}
                  className={`text-sm font-medium ${
                    activeHash === link.href ? "text-indigo-600" : "text-slate-600"
                  }`}
                >
                  {link.label}
                </a>
              ))}
              <button
                onClick={goToAdminLogin}
                className="mt-2 w-full inline-flex items-center justify-center gap-2 px-5 py-3 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white text-sm font-semibold shadow-md shadow-indigo-500/25"
              >
                <ShieldCheck className="w-4 h-4" />
                Admin Login
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
};

export default Navbar;