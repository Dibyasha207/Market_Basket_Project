// import React from "react";
import { motion } from "framer-motion";
import { Database, Sparkles, BrainCircuit, BarChart4 } from "lucide-react";

const STEPS = [
  {
    icon: Database,
    title: "Retail Transaction Data",
    description: "Collect transaction data from multiple retail sources.",
  },
  {
    icon: Sparkles,
    title: "Data Cleaning & Processing",
    description: "Clean, validate and prepare data for advanced analytics.",
  },
  {
    icon: BrainCircuit,
    title: "Machine Learning & AI Models",
    description:
      "Apply ML algorithms for predictions, recommendations and insights.",
  },
  {
    icon: BarChart4,
    title: "Business Intelligence Dashboard",
    description:
      "Visualize insights and make data-driven decisions with confidence.",
  },
];

const HowItWorks = () => {
  return (
    <section
      id="how-it-works"
      className="relative py-24 lg:py-32 bg-gradient-to-b from-slate-50 to-white overflow-hidden"
    >
      <div className="max-w-7xl mx-auto px-6 lg:px-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-80px" }}
          transition={{ duration: 0.5 }}
          className="text-center max-w-2xl mx-auto mb-20"
        >
          <span className="inline-block text-xs font-bold tracking-[0.15em] text-indigo-600 uppercase mb-3">
            How It Works
          </span>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">
            Simple Process, Powerful Insights
          </h2>
          <p className="mt-4 text-slate-600 text-lg">
            Transform your retail data into actionable insights in four
            simple steps.
          </p>
        </motion.div>

        <div className="relative grid sm:grid-cols-2 lg:grid-cols-4 gap-10 lg:gap-6">
          {/* connecting line (desktop) */}
          <div className="hidden lg:block absolute top-8 left-[12%] right-[12%] h-px">
            <motion.div
              initial={{ scaleX: 0 }}
              whileInView={{ scaleX: 1 }}
              viewport={{ once: true, margin: "-80px" }}
              transition={{ duration: 1, ease: "easeInOut" }}
              style={{ transformOrigin: "left" }}
              className="h-full bg-gradient-to-r from-indigo-300 via-violet-300 to-fuchsia-300"
            />
          </div>

          {STEPS.map((step, i) => {
            const Icon = step.icon;
            return (
              <motion.div
                key={step.title}
                initial={{ opacity: 0, y: 24 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: "-60px" }}
                transition={{ duration: 0.5, delay: i * 0.15 }}
                className="relative text-center flex flex-col items-center"
              >
                <div className="relative mb-6">
                  <div className="w-16 h-16 rounded-2xl bg-white border border-slate-200 shadow-md flex items-center justify-center">
                    <Icon className="w-7 h-7 text-indigo-600" strokeWidth={1.8} />
                  </div>
                  <span className="absolute -top-2 -right-2 w-6 h-6 rounded-full bg-gradient-to-br from-indigo-600 to-violet-600 text-white text-xs font-bold flex items-center justify-center shadow-md">
                    {i + 1}
                  </span>
                </div>
                <h3 className="text-base font-bold text-slate-900 mb-2">
                  {step.title}
                </h3>
                <p className="text-sm text-slate-600 leading-relaxed max-w-[15rem]">
                  {step.description}
                </p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
};

export default HowItWorks;