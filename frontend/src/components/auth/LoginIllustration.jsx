// import React from "react";
import { motion } from "framer-motion";
import {
  ShieldCheck,
  Lock,
  Fingerprint,
  BrainCircuit,
  Database,
  ScanLine,
} from "lucide-react";

const floatingBadges = [
  { icon: Fingerprint, label: "Biometric Ready", className: "top-6 left-4", delay: 0 },
  { icon: Lock, label: "AES-256 Encrypted", className: "top-1/3 -left-2", delay: 0.6 },
  { icon: Database, label: "PostgreSQL Secured", className: "bottom-20 left-2", delay: 1.2 },
  { icon: ScanLine, label: "JWT Verified", className: "bottom-2 right-4", delay: 1.8 },
];

const LoginIllustration = () => {
  return (
    <div className="relative hidden lg:flex flex-col justify-center h-full px-14 xl:px-20 overflow-hidden bg-gradient-to-br from-indigo-950 via-violet-950 to-slate-950">
      {/* Ambient glowing particles */}
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute top-10 right-10 w-80 h-80 rounded-full bg-violet-600/20 blur-3xl" />
        <div className="absolute bottom-10 left-0 w-96 h-96 rounded-full bg-indigo-600/20 blur-3xl" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[28rem] h-[28rem] rounded-full bg-fuchsia-600/10 blur-3xl" />
      </div>

      <div className="relative z-10">
        <div className="flex items-center gap-2.5 mb-14">
          <span className="flex items-center justify-center w-10 h-10 rounded-xl bg-gradient-to-br from-indigo-500 via-violet-500 to-purple-500 shadow-lg shadow-indigo-500/40">
            <ShieldCheck className="w-5 h-5 text-white" strokeWidth={2.4} />
          </span>
          <span className="text-lg font-bold text-white tracking-tight">
            AI Retail Intelligence
          </span>
        </div>

        {/* Central AI security core */}
        <div className="relative h-72 mb-14">
          <div className="absolute inset-0 flex items-center justify-center">
            <motion.div
              animate={{ y: [0, -14, 0] }}
              transition={{ duration: 5, repeat: Infinity, ease: "easeInOut" }}
              className="relative"
            >
              <div className="absolute inset-0 -m-8 rounded-full bg-gradient-to-br from-indigo-500/40 to-violet-500/30 blur-3xl" />
              <div className="relative w-40 h-40 rounded-3xl bg-white/5 backdrop-blur-xl border border-white/10 shadow-2xl shadow-indigo-500/30 flex items-center justify-center">
                <motion.div
                  animate={{ rotate: 360 }}
                  transition={{ duration: 14, repeat: Infinity, ease: "linear" }}
                  className="absolute inset-0 rounded-3xl border border-dashed border-indigo-400/30"
                />
                <BrainCircuit
                  className="w-16 h-16 text-indigo-300"
                  strokeWidth={1.3}
                />
                <span className="absolute -top-3 -right-3 w-9 h-9 rounded-2xl bg-gradient-to-br from-emerald-400 to-teal-500 shadow-lg flex items-center justify-center">
                  <Lock className="w-4 h-4 text-white" strokeWidth={2.2} />
                </span>
              </div>
            </motion.div>
          </div>

          {floatingBadges.map((badge, i) => {
            const Icon = badge.icon;
            return (
              <motion.div
                key={badge.label}
                className={`absolute ${badge.className}`}
                animate={{ y: [0, -10, 0] }}
                transition={{
                  duration: 4,
                  repeat: Infinity,
                  ease: "easeInOut",
                  delay: badge.delay,
                }}
              >
                <div className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-white/10 backdrop-blur-xl border border-white/10 shadow-lg">
                  <Icon className="w-3.5 h-3.5 text-indigo-300" strokeWidth={2} />
                  <span className="text-[11px] font-semibold text-slate-200 whitespace-nowrap">
                    {badge.label}
                  </span>
                </div>
              </motion.div>
            );
          })}
        </div>

        <h2 className="text-3xl xl:text-4xl font-extrabold text-white leading-tight tracking-tight max-w-md">
          Secure AI Retail Intelligence Platform
        </h2>
        <p className="mt-4 text-slate-400 leading-relaxed max-w-sm">
          Protected administrator access using enterprise-grade authentication
          and encrypted data security.
        </p>
      </div>
    </div>
  );
};

export default LoginIllustration;