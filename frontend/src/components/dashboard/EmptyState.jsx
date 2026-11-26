// import React from "react";
import { Inbox } from "lucide-react";

const EmptyState = ({ message = "No data available for the selected period." }) => (
  <div className="flex flex-col items-center justify-center text-center py-12">
    <span className="w-11 h-11 rounded-xl bg-slate-100 dark:bg-slate-700/60 flex items-center justify-center mb-3">
      <Inbox className="w-5 h-5 text-slate-400 dark:text-slate-500" />
    </span>
    <p className="text-sm text-slate-500 dark:text-slate-400 max-w-xs">{message}</p>
  </div>
);

export default EmptyState;