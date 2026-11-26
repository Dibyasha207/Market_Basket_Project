import  { useMemo, useState } from "react";
import { ZoomIn, ZoomOut, RotateCcw as ResetIcon } from "lucide-react";
import { useTheme } from "../../hooks/useTheme";
import EmptyState from "../dashboard/EmptyState";
import { ChartSkeleton } from "../dashboard/LoadingState";
import ErrorState from "../dashboard/ErrorState";

const CATEGORY_COLORS = ["#7C3AED", "#3B82F6", "#10B981", "#F59E0B", "#EC4899", "#06B6D4"];

/**
 * Lightweight radial hub-and-spoke network visualization.
 * No graph library dependency — plain SVG with a simple radial layout.
 * Chosen because the reference design shows a single-hub pattern
 * (a central "most connected" product with satellites around it).
 * If real data is densely many-to-many, swap in react-force-graph-2d instead.
 */
const ProductNetwork = ({ data, isLoading, error, onRetry }) => {
  const { isDark } = useTheme();
  const [zoom, setZoom] = useState(1);
  const [hoveredId, setHoveredId] = useState(null);

  const layout = useMemo(() => {
    const nodes = data?.nodes ?? [];
    if (nodes.length === 0) return { positioned: [], hubId: null };

    // Hub = node with the most edges
    const edgeCounts = {};
    (data?.edges ?? []).forEach((e) => {
      edgeCounts[e.source] = (edgeCounts[e.source] ?? 0) + 1;
      edgeCounts[e.target] = (edgeCounts[e.target] ?? 0) + 1;
    });
    const hub = nodes.reduce(
      (best, n) => ((edgeCounts[n.id] ?? 0) > (edgeCounts[best?.id] ?? -1) ? n : best),
      nodes[0]
    );

    const satellites = nodes.filter((n) => n.id !== hub.id);
    const radius = 110;
    const positioned = [
      { ...hub, x: 200, y: 140, isHub: true },
      ...satellites.map((n, i) => {
        const angle = (i / satellites.length) * 2 * Math.PI;
        return {
          ...n,
          x: 200 + radius * Math.cos(angle),
          y: 140 + radius * Math.sin(angle),
          isHub: false,
        };
      }),
    ];

    return { positioned, hubId: hub.id };
  }, [data]);

  if (isLoading) return <ChartSkeleton height={280} />;

  const categoryColor = (category, index) =>
    CATEGORY_COLORS[Math.abs((category || "").length + index) % CATEGORY_COLORS.length];

  return (
    <div className="p-6 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 shadow-sm">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-base font-bold text-slate-900 dark:text-slate-100">Product Relationship Network</h3>
        <div className="flex items-center gap-1">
          <button
            onClick={() => setZoom((z) => Math.min(z + 0.2, 2))}
            aria-label="Zoom in"
            className="w-7 h-7 rounded-lg border border-slate-200 dark:border-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400 hover:border-indigo-200 dark:hover:border-indigo-500/40 transition-colors"
          >
            <ZoomIn className="w-3.5 h-3.5" />
          </button>
          <button
            onClick={() => setZoom((z) => Math.max(z - 0.2, 0.6))}
            aria-label="Zoom out"
            className="w-7 h-7 rounded-lg border border-slate-200 dark:border-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400 hover:border-indigo-200 dark:hover:border-indigo-500/40 transition-colors"
          >
            <ZoomOut className="w-3.5 h-3.5" />
          </button>
          <button
            onClick={() => setZoom(1)}
            aria-label="Reset zoom"
            className="w-7 h-7 rounded-lg border border-slate-200 dark:border-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400 hover:border-indigo-200 dark:hover:border-indigo-500/40 transition-colors"
          >
            <ResetIcon className="w-3.5 h-3.5" />
          </button>
        </div>
      </div>

      {error ? (
        <ErrorState message={error} onRetry={onRetry} compact />
      ) : layout.positioned.length === 0 ? (
        <EmptyState message="No product network data available for the selected filters." />
      ) : (
        <svg
          viewBox="0 0 400 280"
          className="w-full"
          style={{ height: 280, transform: `scale(${zoom})`, transformOrigin: "center" }}
          role="img"
          aria-label="Product relationship network diagram"
        >
          {(data.edges ?? []).map((edge, i) => {
            const source = layout.positioned.find((n) => n.id === edge.source);
            const target = layout.positioned.find((n) => n.id === edge.target);
            if (!source || !target) return null;
            const isHighlighted = hoveredId && (edge.source === hoveredId || edge.target === hoveredId);
            return (
              <line
                key={i}
                x1={source.x}
                y1={source.y}
                x2={target.x}
                y2={target.y}
                stroke={isHighlighted ? "#7C3AED" : isDark ? "#475569" : "#CBD5E1"}
                strokeWidth={isHighlighted ? 2 : 1}
                strokeDasharray={isHighlighted ? "0" : "3 3"}
                opacity={hoveredId && !isHighlighted ? 0.25 : 1}
              />
            );
          })}

          {layout.positioned.map((node, i) => {
            const dimmed = hoveredId && node.id !== hoveredId && !(data.edges ?? []).some(
              (e) => (e.source === hoveredId && e.target === node.id) || (e.target === hoveredId && e.source === node.id)
            );
            return (
              <g
                key={node.id}
                onMouseEnter={() => setHoveredId(node.id)}
                onMouseLeave={() => setHoveredId(null)}
                tabIndex={0}
                role="button"
                aria-label={`${node.name}${node.isHub ? " (hub)" : ""}`}
                style={{ cursor: "pointer", opacity: dimmed ? 0.35 : 1 }}
              >
                <circle
                  cx={node.x}
                  cy={node.y}
                  r={node.isHub ? 20 : 12}
                  fill={node.isHub ? "#7C3AED" : categoryColor(node.category, i)}
                  stroke={isDark ? "#1E293B" : "#fff"}
                  strokeWidth={2}
                />
                <text
                  x={node.x}
                  y={node.y + (node.isHub ? 34 : 24)}
                  textAnchor="middle"
                  fontSize={node.isHub ? 11 : 9}
                  fontWeight={node.isHub ? 700 : 500}
                  fill={isDark ? "#CBD5E1" : "#475569"}
                >
                  {node.name}
                </text>
              </g>
            );
          })}
        </svg>
      )}
    </div>
  );
};

export default ProductNetwork;