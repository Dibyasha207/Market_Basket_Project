// import React from "react";
import { useMBA } from "../hooks/useMBA";
import MBAHeader from "../components/mba/MBAHeader";
import MBAKPISection from "../components/mba/MBAKPISection";
import MBAFilters from "../components/mba/MBAFilters";
import TopCombinations from "../components/mba/TopCombinations";
import SupportConfidenceChart from "../components/mba/SupportConfidenceChart";
import LiftDistributionChart from "../components/mba/LiftDistributionChart";
import ProductNetwork from "../components/mba/ProductNetwork";
import AssociationRulesTable from "../components/mba/AssociationRulesTable";
import RecommendedBundles from "../components/mba/RecommendedBundles";
import MBAInsights from "../components/mba/MBAInsights";

const MarketBasketAnalysis = () => {
  const {
    filters,
    updateFilter,
    resetFilters,
    hasActiveFilters,
    rulesSearch,
    setRulesSearch,
    rulesPage,
    setRulesPage,
    data,
    isLoading,
    error,
    refetchOverview,
    rulesData,
    isRulesLoading,
    rulesError,
    refetchRules,
  } = useMBA();

  return (
    <div className="space-y-6">
      <MBAHeader onRefresh={refetchOverview} isRefreshing={isLoading} />

      <MBAKPISection kpis={data.kpis} isLoading={isLoading} />

      <div className="grid lg:grid-cols-4 gap-5">
        <div className="lg:col-span-3 space-y-5">
          <div className="grid lg:grid-cols-2 gap-5">
            <TopCombinations
              data={data.topCombinations}
              isLoading={isLoading}
              error={error}
              onRetry={refetchOverview}
            />
            <SupportConfidenceChart
              data={data.supportConfidence}
              isLoading={isLoading}
              error={error}
              onRetry={refetchOverview}
            />
          </div>

          <div className="grid lg:grid-cols-2 gap-5">
            <LiftDistributionChart
              data={data.liftDistribution}
              isLoading={isLoading}
              error={error}
              onRetry={refetchOverview}
            />
            <ProductNetwork
              data={data.productNetwork}
              isLoading={isLoading}
              error={error}
              onRetry={refetchOverview}
            />
          </div>

          <MBAFilters
            filters={filters}
            updateFilter={updateFilter}
            resetFilters={resetFilters}
            hasActiveFilters={hasActiveFilters}
            filterMeta={data.filterMeta}
            rulesSearch={rulesSearch}
            setRulesSearch={setRulesSearch}
          />

          <AssociationRulesTable
            rulesData={rulesData}
            isLoading={isRulesLoading}
            error={rulesError}
            onRetry={refetchRules}
            page={rulesPage}
            onPageChange={setRulesPage}
          />

          <RecommendedBundles
            bundles={data.bundles}
            isLoading={isLoading}
            error={error}
            onRetry={refetchOverview}
          />
        </div>

        <div className="lg:col-span-1">
          <MBAInsights
            insights={data.insights}
            isLoading={isLoading}
            error={error}
            onRetry={refetchOverview}
          />
        </div>
      </div>
    </div>
  );
};

export default MarketBasketAnalysis;