// import React from "react";
import { motion } from "framer-motion";
import { GitBranch, Users, TrendingUp, Target } from "lucide-react";

const STATS = [
  {
    icon: GitBranch,
    value: "76",
    label: "Association Rules",
    color: "from-indigo-500 to-violet-500",
  },
  {
    icon: Users,
    value: "4,338",
    label: "Customer Segments",
    color: "from-emerald-500 to-teal-500",
  },
  {
    icon: TrendingUp,
    value: "13",
    label: "Sales Forecast Records",
    color: "from-orange-500 to-amber-500",
  },
  {
    icon: Target,
    value: "99.9%",
    label: "Data Accuracy",
    color: "from-fuchsia-500 to-pink-500",
  },
];

const Stats = () => {
  return (
    <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-6">
      {STATS.map((stat, i) => {
        const Icon = stat.icon;
        return (
          <motion.div
            key={stat.label}
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-60px" }}
            transition={{ duration: 0.5, delay: i * 0.1 }}
            className="group relative p-5 rounded-2xl bg-white/70 backdrop-blur-xl border border-slate-200/70 shadow-sm hover:shadow-xl hover:shadow-indigo-500/10 hover:-translate-y-1 transition-all duration-300"
          >
            <div
              className={`w-11 h-11 rounded-xl bg-gradient-to-br ${stat.color} flex items-center justify-center shadow-md mb-4`}
            >
              <Icon className="w-5 h-5 text-white" strokeWidth={2} />
            </div>
            <div className="text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight">
              {stat.value}
            </div>
            <div className="mt-1 text-sm text-slate-500 font-medium">
              {stat.label}
            </div>
          </motion.div>
        );
      })}
    </div>
  );
};

export default Stats;