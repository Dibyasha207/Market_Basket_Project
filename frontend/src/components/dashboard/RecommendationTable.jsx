import { useEffect, useState } from "react";
import { Boxes, ArrowRight } from "lucide-react";
import { getRecommendations } from "../../services/recommendationService";

const MetricPill = ({ label, value, color }) => (
  <span className={`px-2.5 py-1 rounded-lg text-xs font-semibold ${color}`}>
    {label}: {value}
  </span>
);

const RecommendationTable = () => {
  const [rules, setRules] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let isMounted = true;

    const fetchRules = async () => {
      try {
        const data = await getRecommendations({ limit: 8 });
        if (isMounted) setRules(data.rules ?? data.data ?? []);
      } catch (err) {
        console.error("Failed to load recommendations:", err);
        if (isMounted) setError("Unable to load recommendation data.");
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    fetchRules();
    return () => {
      isMounted = false;
    };
  }, []);

  return (
    <div className="p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm">
      <div className="flex items-center gap-2.5 mb-6">
        <span className="w-9 h-9 rounded-xl bg-violet-100 flex items-center justify-center">
          <Boxes className="w-4.5 h-4.5 text-violet-600" />
        </span>
        <h3 className="text-base font-bold text-slate-900">Frequently Bought Together</h3>
      </div>

      {isLoading ? (
        <div className="space-y-3">
          {Array.from({ length: 4 }).map((_, i) => (
            <div key={i} className="h-20 rounded-xl bg-slate-100 animate-pulse" />
          ))}
        </div>
      ) : error ? (
        <p className="text-sm text-red-500">{error}</p>
      ) : (
        <div className="grid sm:grid-cols-2 gap-4">
          {rules.map((rule) => (
            <div
              key={rule.id}
              className="p-4 rounded-xl border border-slate-200/80 hover:border-indigo-200 hover:shadow-md transition-all duration-200"
            >
              <div className="flex items-center gap-2 mb-3 text-sm font-semibold text-slate-800">
                <span className="truncate">{rule.productA}</span>
                <ArrowRight className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                <span className="truncate">{rule.productB}</span>
              </div>
              <div className="flex flex-wrap gap-2">
                <MetricPill label="Support" value={`${rule.support}%`} color="bg-blue-50 text-blue-600" />
                <MetricPill label="Confidence" value={`${rule.confidence}%`} color="bg-emerald-50 text-emerald-600" />
                <MetricPill label="Lift" value={rule.lift} color="bg-violet-50 text-violet-600" />
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default RecommendationTable;