import { useEffect, useState } from "react";
import { motion, useMotionValue, animate } from "framer-motion";
import { GitBranch, TrendingUp, Target, Layers, Star, ArrowUp, ArrowDown } from "lucide-react";
import LineChart from "../charts/LineChart";

const CountUp = ({ value, decimals = 0, suffix = "" }) => {
  const motionVal = useMotionValue(0);
  const [display, setDisplay] = useState(0);

  useEffect(() => {
    const controls = animate(motionVal, value, {
      duration: 1,
      ease: "easeOut",
      onUpdate: (v) => setDisplay(v),
    });
    return () => controls.stop();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  return (
    <>
      {display.toLocaleString("en-US", { maximumFractionDigits: decimals, minimumFractionDigits: decimals })}
      {suffix}
    </>
  );
};

const CARD_META = [
  { key: "totalRules", label: "Total Association Rules", icon: GitBranch, iconBg: "bg-violet-100 dark:bg-violet-500/15", iconColor: "text-violet-600 dark:text-violet-400", decimals: 0, suffix: "" },
  { key: "avgLift", label: "Average Lift", icon: TrendingUp, iconBg: "bg-emerald-100 dark:bg-emerald-500/15", iconColor: "text-emerald-600 dark:text-emerald-400", decimals: 2, suffix: "" },
  { key: "avgConfidence", label: "Average Confidence", icon: Target, iconBg: "bg-blue-100 dark:bg-blue-500/15", iconColor: "text-blue-600 dark:text-blue-400", decimals: 1, suffix: "%" },
  { key: "frequentItemsets", label: "Frequent Itemsets", icon: Layers, iconBg: "bg-orange-100 dark:bg-orange-500/15", iconColor: "text-orange-600 dark:text-orange-400", decimals: 0, suffix: "" },
  { key: "strongCrossSell", label: "Strong Cross-Sell Opportunities", icon: Star, iconBg: "bg-pink-100 dark:bg-pink-500/15", iconColor: "text-pink-600 dark:text-pink-400", decimals: 0, suffix: "" },
];

const KPICardSkeleton = () => (
  <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700">
    <div className="w-11 h-11 rounded-xl bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-4" />
    <div className="h-3 w-24 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-2" />
    <div className="h-6 w-16 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-3" />
    <div className="h-8 w-full rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse" />
  </div>
);

const MBAKPISection = ({ kpis, isLoading }) => {
  if (isLoading) {
    return (
      <div className="grid sm:grid-cols-2 lg:grid-cols-5 gap-4">
        {CARD_META.map((m) => (
          <KPICardSkeleton key={m.key} />
        ))}
      </div>
    );
  }

  return (
    <div className="grid sm:grid-cols-2 lg:grid-cols-5 gap-4">
      {CARD_META.map((meta, i) => {
        const Icon = meta.icon;
        const metric = kpis?.[meta.key];
        const change = metric?.changePercentage ?? 0;
        const isPositive = change >= 0;
        const trend = metric?.trend ?? [];

        return (
          <motion.div
            key={meta.key}
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: i * 0.06 }}
            className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm hover:shadow-lg hover:shadow-indigo-500/5 hover:-translate-y-1 transition-all duration-300"
          >
            <span className={`w-11 h-11 rounded-xl ${meta.iconBg} flex items-center justify-center mb-3.5`}>
              <Icon className={`w-5 h-5 ${meta.iconColor}`} strokeWidth={2} />
            </span>
            <p className="text-xs font-medium text-slate-500 dark:text-slate-400 mb-1">{meta.label}</p>
            <p className="text-2xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight mb-1.5">
              <CountUp value={metric?.value ?? 0} decimals={meta.decimals} suffix={meta.suffix} />
            </p>
            {metric?.changePercentage !== undefined && (
              <div className={`inline-flex items-center gap-1 text-xs font-semibold ${isPositive ? "text-emerald-600 dark:text-emerald-400" : "text-red-500 dark:text-red-400"}`}>
                {isPositive ? <ArrowUp className="w-3 h-3" /> : <ArrowDown className="w-3 h-3" />}
                {Math.abs(change).toFixed(1)}%
                <span className="text-slate-400 dark:text-slate-500 font-normal ml-1">vs last 7 days</span>
              </div>
            )}
            {trend.length > 0 && (
              <div className="mt-2.5 -mx-1">
                <LineChart data={trend} dataKey="value" color={isPositive ? "#7C3AED" : "#EF4444"} />
              </div>
            )}
          </motion.div>
        );
      })}
    </div>
  );
};

export default MBAKPISection;