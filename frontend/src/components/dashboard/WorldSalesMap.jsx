import  { useEffect, useState } from "react";
import { Globe2 } from "lucide-react";
import { getOverview } from "../../services/dashboardService";
import { formatCurrency } from "../../utils/formatters";

/**
 * Lightweight regional sales breakdown (no external map library in the stack).
 * Renders as ranked bars — swap for a geo map library later if needed.
 */
const WorldSalesMap = () => {
  const [regions, setRegions] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    let isMounted = true;

    const fetchRegions = async () => {
      try {
        const data = await getOverview();
        if (isMounted) setRegions(data.regionalSales ?? []);
      } catch (err) {
        console.error("Failed to load regional sales:", err);
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    fetchRegions();
    return () => {
      isMounted = false;
    };
  }, []);

  const maxValue = Math.max(...regions.map((r) => r.revenue), 1);

  return (
    <div className="p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm">
      <div className="flex items-center gap-2.5 mb-5">
        <span className="w-9 h-9 rounded-xl bg-indigo-100 flex items-center justify-center">
          <Globe2 className="w-4.5 h-4.5 text-indigo-600" />
        </span>
        <h3 className="text-base font-bold text-slate-900">Sales by Region</h3>
      </div>

      {isLoading ? (
        <div className="h-48 rounded-xl bg-slate-100 animate-pulse" />
      ) : regions.length === 0 ? (
        <p className="text-sm text-slate-400">No regional data available.</p>
      ) : (
        <ul className="space-y-4">
          {regions.map((region) => (
            <li key={region.name}>
              <div className="flex items-center justify-between text-sm mb-1.5">
                <span className="font-medium text-slate-700">{region.name}</span>
                <span className="font-semibold text-slate-900">{formatCurrency(region.revenue)}</span>
              </div>
              <div className="h-2 rounded-full bg-slate-100 overflow-hidden">
                <div
                  className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-violet-500"
                  style={{ width: `${(region.revenue / maxValue) * 100}%` }}
                />
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default WorldSalesMap;