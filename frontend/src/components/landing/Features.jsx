// import React from "react";
import { motion } from "framer-motion";
import { Boxes, Users2, LineChart, BotMessageSquare, ArrowRight } from "lucide-react";

const FEATURES = [
  {
    icon: Boxes,
    title: "Smart Product Recommendations",
    description:
      "Generate Frequently Bought Together recommendations using Association Rule Mining.",
    gradient: "from-indigo-500 to-blue-500",
  },
  {
    icon: Users2,
    title: "Customer Segmentation",
    description:
      "Identify Patterns, Regular and Low-Value customers using Machine Learning clustering.",
    gradient: "from-emerald-500 to-teal-500",
  },
  {
    icon: LineChart,
    title: "Sales Forecasting",
    description:
      "Predict future sales trends using Machine Learning forecasting models.",
    gradient: "from-orange-500 to-amber-500",
  },
  {
    icon: BotMessageSquare,
    title: "AI Business Assistant",
    description:
      "Ask business questions and receive intelligent insights from retail transaction data.",
    gradient: "from-fuchsia-500 to-purple-500",
  },
];

const Features = () => {
  return (
    <section id="features" className="relative py-24 lg:py-32 bg-white">
      <div className="max-w-7xl mx-auto px-6 lg:px-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-80px" }}
          transition={{ duration: 0.5 }}
          className="text-center max-w-2xl mx-auto mb-16"
        >
          <span className="inline-block text-xs font-bold tracking-[0.15em] text-indigo-600 uppercase mb-3">
            Features
          </span>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">
            Powerful Features to Drive Your Business
          </h2>
          <p className="mt-4 text-slate-600 text-lg">
            Advanced AI capabilities to help you make smarter decisions and
            grow faster.
          </p>
        </motion.div>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {FEATURES.map((feature, i) => {
            const Icon = feature.icon;
            return (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 24 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: "-60px" }}
                transition={{ duration: 0.5, delay: i * 0.1 }}
                className="group relative p-7 rounded-2xl bg-white border border-slate-200/80 shadow-sm hover:shadow-2xl hover:shadow-indigo-500/10 hover:-translate-y-2 hover:border-indigo-200 transition-all duration-300"
              >
                <div
                  className={`w-14 h-14 rounded-2xl bg-gradient-to-br ${feature.gradient} flex items-center justify-center shadow-lg mb-6 group-hover:scale-110 group-hover:rotate-3 transition-transform duration-300`}
                >
                  <Icon className="w-7 h-7 text-white" strokeWidth={1.8} />
                </div>
                <h3 className="text-lg font-bold text-slate-900 mb-2.5">
                  {feature.title}
                </h3>
                <p className="text-sm text-slate-600 leading-relaxed mb-4">
                  {feature.description}
                </p>
                <button className="inline-flex items-center gap-1.5 text-sm font-semibold text-indigo-600 group-hover:gap-2.5 transition-all duration-200">
                  Learn more
                  <ArrowRight className="w-3.5 h-3.5" />
                </button>

                {/* subtle glow on hover */}
                <div className="pointer-events-none absolute inset-0 rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-gradient-to-br from-indigo-50/50 to-transparent -z-10" />
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
};

export default Features;