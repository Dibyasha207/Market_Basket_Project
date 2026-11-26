// import React from "react";

export const KPICardSkeleton = () => (
  <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700">
    <div className="w-11 h-11 rounded-xl bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-4" />
    <div className="h-3 w-20 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-2" />
    <div className="h-6 w-28 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-3" />
    <div className="h-8 w-full rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse" />
  </div>
);

export const ChartSkeleton = ({ height = 300 }) => (
  <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700">
    <div className="h-4 w-40 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-5" />
    <div className="rounded-xl bg-slate-100 dark:bg-slate-700/60 animate-pulse" style={{ height }} />
  </div>
);

export const ListSkeleton = ({ rows = 4 }) => (
  <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700">
    <div className="h-4 w-32 rounded bg-slate-100 dark:bg-slate-700/60 animate-pulse mb-5" />
    <div className="space-y-3">
      {Array.from({ length: rows }).map((_, i) => (
        <div key={i} className="h-14 rounded-xl bg-slate-100 dark:bg-slate-700/60 animate-pulse" />
      ))}
    </div>
  </div>
);