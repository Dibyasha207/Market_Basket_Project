// import React from "react";
import { motion } from "framer-motion";
import {
  SiReact,
  SiNodedotjs,
  SiExpress,
  SiPython,
  SiPostgresql,
  SiPandas,
  SiScikitlearn,
  SiSqlalchemy,
  SiDocker,
//   SiAmazon,
  SiGithub,
} from "react-icons/si";
import { FaAmazon } from "react-icons/fa";
import { Webhook } from "lucide-react";

const TECH_STACK = [
  { name: "React", Icon: SiReact, color: "#61DAFB" },
  { name: "Node.js", Icon: SiNodedotjs, color: "#339933" },
  { name: "Express.js", Icon: SiExpress, color: "#000000" },
  { name: "Python", Icon: SiPython, color: "#3776AB" },
  { name: "PostgreSQL", Icon: SiPostgresql, color: "#4169E1" },
  { name: "Pandas", Icon: SiPandas, color: "#150458" },
  { name: "Scikit-learn", Icon: SiScikitlearn, color: "#F7931E" },
  { name: "SQLAlchemy", Icon: SiSqlalchemy, color: "#D71F00" },
  { name: "REST API", Icon: Webhook, color: "#6366F1" },
  { name: "Docker", Icon: SiDocker, color: "#2496ED" },
//   { name: "AWS", Icon: SiAmazon, color: "#FF9900" },
{ name: "AWS", Icon: FaAmazon, color: "#FF9900" },
  { name: "GitHub", Icon: SiGithub, color: "#181717" },
];

const Technology = () => {
  return (
    <section id="technology" className="relative py-24 lg:py-32 bg-white">
      <div className="max-w-7xl mx-auto px-6 lg:px-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-80px" }}
          transition={{ duration: 0.5 }}
          className="text-center max-w-2xl mx-auto mb-16"
        >
          <span className="inline-block text-xs font-bold tracking-[0.15em] text-indigo-600 uppercase mb-3">
            Technology Stack
          </span>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">
            Built with Modern Technologies
          </h2>
        </motion.div>

        <div className="grid grid-cols-3 sm:grid-cols-4 lg:grid-cols-6 gap-4 lg:gap-5">
          {TECH_STACK.map(({ name, Icon, color }, i) => (
            <motion.div
              key={name}
              initial={{ opacity: 0, scale: 0.9 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true, margin: "-60px" }}
              transition={{ duration: 0.4, delay: i * 0.05 }}
              className="group flex flex-col items-center justify-center gap-3 p-6 rounded-2xl bg-white border border-slate-200/80 shadow-sm hover:shadow-xl hover:shadow-indigo-500/10 hover:-translate-y-1.5 hover:border-indigo-200 transition-all duration-300"
            >
              <Icon
                className="w-8 h-8 transition-transform duration-300 group-hover:scale-110"
                style={{ color }}
              />
              <span className="text-xs font-semibold text-slate-600 text-center">
                {name}
              </span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Technology;