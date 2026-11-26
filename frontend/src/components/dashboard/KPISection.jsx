// import React from "react";
import { DollarSign, ShoppingCart, Users, Package } from "lucide-react";
import KPICard from "./KPICard";
import { KPICardSkeleton } from "./LoadingState";
import ErrorState from "./ErrorState";

const CARD_META = [
  { key: "totalRevenue", label: "Total Revenue", icon: DollarSign, iconBg: "bg-violet-100", iconColor: "text-violet-600", isCurrency: true },
  { key: "totalOrders", label: "Total Orders", icon: ShoppingCart, iconBg: "bg-blue-100", iconColor: "text-blue-600", isCurrency: false },
  { key: "totalCustomers", label: "Total Customers", icon: Users, iconBg: "bg-emerald-100", iconColor: "text-emerald-600", isCurrency: false },
  { key: "totalProducts", label: "Total Products", icon: Package, iconBg: "bg-orange-100", iconColor: "text-orange-600", isCurrency: false },
];

const KPISection = ({ kpis, isLoading, error, onRetry }) => {
  if (isLoading) {
    return (
      <div className="grid sm:grid-cols-2 xl:grid-cols-4 gap-5">
        {CARD_META.map((meta) => (
          <KPICardSkeleton key={meta.key} />
        ))}
      </div>
    );
  }

  if (error) {
    return <ErrorState message={error} onRetry={onRetry} />;
  }

  return (
    <div className="grid sm:grid-cols-2 xl:grid-cols-4 gap-5">
      {CARD_META.map((meta) => (
        <KPICard
          key={meta.key}
          icon={meta.icon}
          label={meta.label}
          metric={kpis?.[meta.key]}
          iconBg={meta.iconBg}
          iconColor={meta.iconColor}
          isCurrency={meta.isCurrency}
        />
      ))}
    </div>
  );
};

export default KPISection;