import { useEffect, useState } from "react";
import { useMotionValue, animate } from "framer-motion";
import { ArrowUp, ArrowDown } from "lucide-react";
import LineChart from "../charts/LineChart";
import { formatCurrency, formatNumber, formatPercentage } from "../../utils/formatters";

const CountUp = ({ value, isCurrency }) => {
  const motionVal = useMotionValue(0);
  const [display, setDisplay] = useState(0);

  useEffect(() => {
    const controls = animate(motionVal, value, {
      duration: 1,
      ease: "easeOut",
      onUpdate: (v) => setDisplay(Math.round(v)),
    });
    return () => controls.stop();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  return <>{isCurrency ? formatCurrency(display) : formatNumber(display)}</>;
};

const KPICard = ({ icon: Icon, label, metric, iconBg, iconColor, isCurrency }) => {
  const value = metric?.value ?? 0;
  const change = metric?.changePercentage ?? 0;
  const trend = metric?.trend ?? [];
  const isPositive = change >= 0;

  return (
    <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm hover:shadow-lg hover:shadow-indigo-500/5 hover:-translate-y-1 transition-all duration-300">
      <span className={`w-11 h-11 rounded-xl ${iconBg} flex items-center justify-center mb-4`}>
        <Icon className={`w-5 h-5 ${iconColor}`} strokeWidth={2} />
      </span>
      <p className="text-sm font-medium text-slate-500 dark:text-slate-400 mb-1">{label}</p>
      <p className="text-2xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight mb-1.5">
        <CountUp value={value} isCurrency={isCurrency} />
      </p>
      <div className={`inline-flex items-center gap-1 text-xs font-semibold ${isPositive ? "text-emerald-600 dark:text-emerald-400" : "text-red-500 dark:text-red-400"}`}>
        {isPositive ? <ArrowUp className="w-3 h-3" /> : <ArrowDown className="w-3 h-3" />}
        {formatPercentage(Math.abs(change))}
        <span className="text-slate-400 dark:text-slate-500 font-normal ml-1">vs last 7 days</span>
      </div>

      {trend.length > 0 && (
        <div className="mt-3 -mx-1">
          <LineChart data={trend} dataKey="value" color={isPositive ? "#7C3AED" : "#EF4444"} />
        </div>
      )}
    </div>
  );
};

export default KPICard;