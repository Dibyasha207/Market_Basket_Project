// import React from "react";
import { useNavigate } from "react-router-dom";
import { motion } from "framer-motion";
import {
  Sparkles,
  ShieldCheck,
  ArrowRight,
  TrendingUp,
  Brain,
  Activity,
  BarChart3,
  PieChart,
  Globe2,
  ShoppingBag,
  LineChart,
} from "lucide-react";
import Stats from "./Stats";

const floatingCards = [
  {
    icon: Sparkles,
    label: "Smart Insights",
    className: "top-2 left-4 md:left-10",
    delay: 0,
  },
  {
    icon: Brain,
    label: "AI Predictions",
    className: "top-1/3 -left-2 md:left-0",
    delay: 0.6,
  },
  {
    icon: Activity,
    label: "Real-time Analytics",
    className: "bottom-16 left-2 md:left-8",
    delay: 1.2,
  },
  {
    icon: TrendingUp,
    label: "Business Growth",
    className: "bottom-0 right-2 md:right-10",
    delay: 1.8,
  },
];

const orbitPanels = [
  { icon: BarChart3, className: "top-4 left-1/3", delay: 0 },
  { icon: PieChart, className: "top-10 right-2", delay: 0.4 },
  { icon: Globe2, className: "top-1/2 -right-4 md:right-0", delay: 0.8 },
  { icon: LineChart, className: "bottom-6 right-6", delay: 1.1 },
  { icon: BarChart3, className: "bottom-2 left-6", delay: 1.5 },
];

const Hero = () => {
  const navigate = useNavigate();

  const scrollToFeatures = () => {
    const el = document.querySelector("#features");
    if (el) el.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  return (
    <section
      id="home"
      className="relative pt-40 pb-24 lg:pt-48 lg:pb-32 overflow-hidden bg-gradient-to-b from-indigo-50/60 via-white to-white"
    >
      {/* Ambient background gradients */}
      <div className="pointer-events-none absolute inset-0 overflow-hidden">
        <div className="absolute -top-40 -right-40 w-[32rem] h-[32rem] rounded-full bg-gradient-to-br from-indigo-300/30 to-purple-300/20 blur-3xl" />
        <div className="absolute top-1/2 -left-40 w-[28rem] h-[28rem] rounded-full bg-gradient-to-br from-violet-300/20 to-fuchsia-200/20 blur-3xl" />
      </div>

      <div className="relative max-w-7xl mx-auto px-6 lg:px-10">
        <div className="grid lg:grid-cols-2 gap-16 items-center">
          {/* Left column */}
          <motion.div
            initial={{ opacity: 0, y: 24 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, ease: "easeOut" }}
          >
            <span className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-indigo-100/80 border border-indigo-200 text-indigo-700 text-xs font-semibold tracking-wide mb-6">
              <Sparkles className="w-3.5 h-3.5" />
              AI-Powered Retail Analytics Platform
            </span>

            <h1 className="text-4xl sm:text-5xl lg:text-6xl font-extrabold leading-[1.08] tracking-tight text-slate-900">
              AI-Powered Retail
              <br />
              Intelligence{" "}
              <span className="bg-gradient-to-r from-indigo-600 via-violet-600 to-fuchsia-500 bg-clip-text text-transparent">
                Dashboard
              </span>
            </h1>

            <p className="mt-6 text-lg text-slate-600 leading-relaxed max-w-xl">
              Transform retail transaction data into actionable business
              insights using Artificial Intelligence, Machine Learning, Market
              Basket Analysis, Customer Segmentation, Sales Forecasting,
              Recommendation Engine, and Business Intelligence.
            </p>

            <div className="mt-9 flex flex-col sm:flex-row gap-4">
              <button
                onClick={() => navigate("/admin/login")}
                className="group inline-flex items-center justify-center gap-2 px-7 py-3.5 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white font-semibold shadow-lg shadow-indigo-500/30 hover:shadow-xl hover:shadow-indigo-500/40 hover:-translate-y-0.5 active:translate-y-0 transition-all duration-200"
              >
                <ShieldCheck className="w-4.5 h-4.5" />
                Admin Login
              </button>
              <button
                onClick={scrollToFeatures}
                className="inline-flex items-center justify-center gap-2 px-7 py-3.5 rounded-xl bg-white text-slate-800 font-semibold border border-slate-200 shadow-sm hover:shadow-md hover:border-indigo-200 hover:text-indigo-700 transition-all duration-200"
              >
                Explore Features
                <ArrowRight className="w-4 h-4" />
              </button>
            </div>
          </motion.div>

          {/* Right column — illustration (NO dashboard, NO charts preview) */}
          <motion.div
            initial={{ opacity: 0, scale: 0.92 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.7, ease: "easeOut", delay: 0.15 }}
            className="relative h-[420px] sm:h-[480px] lg:h-[520px]"
          >
            {/* Central 3D glass podium with AI core */}
            <div className="absolute inset-0 flex items-center justify-center">
              <motion.div
                animate={{ y: [0, -14, 0] }}
                transition={{ duration: 5, repeat: Infinity, ease: "easeInOut" }}
                className="relative"
              >
                {/* glow */}
                <div className="absolute inset-0 -m-10 rounded-full bg-gradient-to-br from-indigo-400/40 to-violet-400/30 blur-3xl" />
                {/* podium ring */}
                <div className="absolute -bottom-6 left-1/2 -translate-x-1/2 w-56 h-10 rounded-full bg-gradient-to-r from-indigo-200/60 via-white/80 to-violet-200/60 blur-md" />
                {/* core cube */}
                <div className="relative w-36 h-36 sm:w-44 sm:h-44 rounded-3xl bg-gradient-to-br from-indigo-500 via-violet-600 to-purple-600 shadow-2xl shadow-indigo-500/40 flex items-center justify-center rotate-3">
                  <ShoppingBag
                    className="w-16 h-16 sm:w-20 sm:h-20 text-white/90"
                    strokeWidth={1.5}
                  />
                  {/* neural nodes */}
                  <span className="absolute -top-3 -left-3 w-3 h-3 rounded-full bg-white shadow-md" />
                  <span className="absolute -bottom-3 -right-2 w-2.5 h-2.5 rounded-full bg-fuchsia-300 shadow-md" />
                  <span className="absolute top-1/2 -right-4 w-2 h-2 rounded-full bg-indigo-200 shadow-md" />
                </div>
              </motion.div>
            </div>

            {/* Orbiting translucent analytics panels (abstract, no real charts) */}
            {orbitPanels.map((panel, i) => {
              const Icon = panel.icon;
              return (
                <motion.div
                  key={i}
                  className={`absolute ${panel.className} hidden sm:flex`}
                  animate={{ y: [0, -10, 0] }}
                  transition={{
                    duration: 4.5,
                    repeat: Infinity,
                    ease: "easeInOut",
                    delay: panel.delay,
                  }}
                >
                  <div className="w-14 h-14 rounded-2xl bg-white/70 backdrop-blur-xl border border-white/60 shadow-lg shadow-indigo-500/10 flex items-center justify-center">
                    <Icon className="w-6 h-6 text-indigo-500/70" strokeWidth={1.8} />
                  </div>
                </motion.div>
              );
            })}

            {/* Floating labeled glass badges */}
            {floatingCards.map((card, i) => {
              const Icon = card.icon;
              return (
                <motion.div
                  key={i}
                  className={`absolute ${card.className}`}
                  animate={{ y: [0, -12, 0] }}
                  transition={{
                    duration: 4,
                    repeat: Infinity,
                    ease: "easeInOut",
                    delay: card.delay,
                  }}
                >
                  <div className="flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-white/80 backdrop-blur-xl border border-white/60 shadow-lg shadow-indigo-500/10">
                    <span className="w-7 h-7 rounded-lg bg-gradient-to-br from-indigo-500 to-violet-600 flex items-center justify-center shrink-0">
                      <Icon className="w-3.5 h-3.5 text-white" />
                    </span>
                    <span className="text-xs font-semibold text-slate-700 whitespace-nowrap">
                      {card.label}
                    </span>
                  </div>
                </motion.div>
              );
            })}
          </motion.div>
        </div>

        {/* Stats row */}
        <div className="mt-20 lg:mt-24">
          <Stats />
        </div>
      </div>
    </section>
  );
};

export default Hero;