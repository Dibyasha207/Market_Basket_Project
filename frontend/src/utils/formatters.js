export const formatCurrency = (value, currency = "USD") => {
  if (value === null || value === undefined || Number.isNaN(value)) return "—";
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency,
    maximumFractionDigits: 0,
  }).format(value);
};

export const formatNumber = (value) => {
  if (value === null || value === undefined || Number.isNaN(value)) return "—";
  return new Intl.NumberFormat("en-US").format(value);
};

export const formatPercentage = (value, { withSign = true } = {}) => {
  if (value === null || value === undefined || Number.isNaN(value)) return "—";
  const sign = withSign && value > 0 ? "+" : "";
  return `${sign}${value.toFixed(1)}%`;
};

export const formatDateShort = (dateString) => {
  const date = new Date(dateString);
  if (Number.isNaN(date.getTime())) return dateString;
  return date.toLocaleDateString("en-US", { month: "short", day: "numeric" });
};

export const formatDateRange = (start, end) => {
  return `${formatDateShort(start)} - ${formatDateShort(end)}, ${new Date(end).getFullYear()}`;
};

export const timeAgo = (dateString) => {
  const date = new Date(dateString);
  if (Number.isNaN(date.getTime())) return dateString;
  const seconds = Math.floor((Date.now() - date.getTime()) / 1000);

  const intervals = [
    { label: "year", secs: 31536000 },
    { label: "month", secs: 2592000 },
    { label: "day", secs: 86400 },
    { label: "hour", secs: 3600 },
    { label: "min", secs: 60 },
  ];

  for (const interval of intervals) {
    const count = Math.floor(seconds / interval.secs);
    if (count >= 1) return `${count} ${interval.label}${count > 1 ? "s" : ""} ago`;
  }
  return "just now";
};