import  { useEffect, useState } from "react";
import { AlertTriangle } from "lucide-react";
import { getTopProducts } from "../../services/dashboardService";
import { formatCurrency, formatNumber } from "../../utils/formatters";

const ProductAnalyticsTable = () => {
  const [topProducts, setTopProducts] = useState([]);
  const [lowStock, setLowStock] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let isMounted = true;

    const fetchProducts = async () => {
      try {
        const data = await getTopProducts({ limit: 6 });
        if (isMounted) {
          setTopProducts(data.topProducts ?? data.products ?? []);
          setLowStock(data.lowStock ?? []);
        }
      } catch (err) {
        console.error("Failed to load product analytics:", err);
        if (isMounted) setError("Unable to load product data.");
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    fetchProducts();
    return () => {
      isMounted = false;
    };
  }, []);

  if (isLoading) {
    return <div className="h-96 rounded-2xl bg-slate-100 animate-pulse" />;
  }

  if (error) {
    return (
      <div className="p-6 rounded-2xl bg-red-50 border border-red-100 text-sm text-red-600">
        {error}
      </div>
    );
  }

  return (
    <div className="grid lg:grid-cols-3 gap-5">
      {/* Top Products */}
      <div className="lg:col-span-2 p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm">
        <h3 className="text-base font-bold text-slate-900 mb-5">Top Products</h3>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left text-xs font-semibold text-slate-400 uppercase tracking-wide">
                <th className="pb-3 font-semibold">Product</th>
                <th className="pb-3 font-semibold">Category</th>
                <th className="pb-3 font-semibold text-right">Units Sold</th>
                <th className="pb-3 font-semibold text-right">Revenue</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {topProducts.map((product) => (
                <tr key={product.id} className="hover:bg-slate-50 transition-colors">
                  <td className="py-3 font-medium text-slate-800">{product.name}</td>
                  <td className="py-3 text-slate-500">{product.category}</td>
                  <td className="py-3 text-right text-slate-700">{formatNumber(product.unitsSold)}</td>
                  <td className="py-3 text-right font-semibold text-slate-900">
                    {formatCurrency(product.revenue)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Low Stock */}
      <div className="p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm">
        <div className="flex items-center gap-2.5 mb-5">
          <span className="w-9 h-9 rounded-xl bg-amber-100 flex items-center justify-center">
            <AlertTriangle className="w-4.5 h-4.5 text-amber-600" />
          </span>
          <h3 className="text-base font-bold text-slate-900">Low Stock Products</h3>
        </div>
        <ul className="space-y-3">
          {lowStock.map((item) => (
            <li key={item.id} className="flex items-center justify-between text-sm">
              <span className="text-slate-700 font-medium truncate">{item.name}</span>
              <span className="px-2 py-0.5 rounded-md bg-red-50 text-red-600 text-xs font-semibold shrink-0">
                {item.stock} left
              </span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default ProductAnalyticsTable;