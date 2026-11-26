import  { useState } from "react";
import { motion } from "framer-motion";
import { Mail, Phone, MapPin, Send, Loader2, CheckCircle2 } from "lucide-react";

const Contact = () => {
  const [form, setForm] = useState({ name: "", email: "", message: "" });
  const [status, setStatus] = useState("idle"); // idle | loading | success | error
  const [errors, setErrors] = useState({});

  const validate = () => {
    const errs = {};
    if (!form.name.trim()) errs.name = "Name is required";
    if (!form.email.trim()) {
      errs.email = "Email is required";
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
      errs.email = "Enter a valid email";
    }
    if (!form.message.trim()) errs.message = "Message is required";
    setErrors(errs);
    return Object.keys(errs).length === 0;
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
    if (errors[name]) setErrors((prev) => ({ ...prev, [name]: undefined }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validate()) return;

    setStatus("loading");
    try {
      // Replace with actual API endpoint when backend contact route is ready
      await new Promise((resolve) => setTimeout(resolve, 1200));
      setStatus("success");
      setForm({ name: "", email: "", message: "" });
      setTimeout(() => setStatus("idle"), 3000);
    } catch (err) {
      console.error("Contact form submission failed:", err);
      setStatus("error");
      setTimeout(() => setStatus("idle"), 3000);
    }
  };

  return (
    <section id="contact" className="relative py-24 lg:py-32 bg-slate-50">
      <div className="max-w-7xl mx-auto px-6 lg:px-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-80px" }}
          transition={{ duration: 0.5 }}
          className="text-center max-w-2xl mx-auto mb-16"
        >
          <span className="inline-block text-xs font-bold tracking-[0.15em] text-indigo-600 uppercase mb-3">
            Get In Touch
          </span>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">
            Let's Discuss Your Project
          </h2>
        </motion.div>

        <div className="grid lg:grid-cols-5 gap-8 items-start">
          {/* Form */}
          <motion.form
            initial={{ opacity: 0, y: 24 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-60px" }}
            transition={{ duration: 0.5 }}
            onSubmit={handleSubmit}
            noValidate
            className="lg:col-span-3 p-8 rounded-2xl bg-white/80 backdrop-blur-xl border border-slate-200/80 shadow-lg shadow-indigo-500/5"
          >
            <div className="grid sm:grid-cols-2 gap-5 mb-5">
              <div>
                <label
                  htmlFor="name"
                  className="block text-sm font-semibold text-slate-700 mb-2"
                >
                  Name
                </label>
                <input
                  id="name"
                  name="name"
                  type="text"
                  value={form.name}
                  onChange={handleChange}
                  placeholder="Your full name"
                  className={`w-full px-4 py-3 rounded-xl border bg-white text-sm text-slate-900 placeholder:text-slate-400 outline-none transition-all duration-200 focus:ring-4 ${
                    errors.name
                      ? "border-red-300 focus:ring-red-100"
                      : "border-slate-200 focus:border-indigo-400 focus:ring-indigo-100"
                  }`}
                />
                {errors.name && (
                  <p className="mt-1.5 text-xs text-red-500">{errors.name}</p>
                )}
              </div>

              <div>
                <label
                  htmlFor="email"
                  className="block text-sm font-semibold text-slate-700 mb-2"
                >
                  Email
                </label>
                <input
                  id="email"
                  name="email"
                  type="email"
                  value={form.email}
                  onChange={handleChange}
                  placeholder="you@company.com"
                  className={`w-full px-4 py-3 rounded-xl border bg-white text-sm text-slate-900 placeholder:text-slate-400 outline-none transition-all duration-200 focus:ring-4 ${
                    errors.email
                      ? "border-red-300 focus:ring-red-100"
                      : "border-slate-200 focus:border-indigo-400 focus:ring-indigo-100"
                  }`}
                />
                {errors.email && (
                  <p className="mt-1.5 text-xs text-red-500">{errors.email}</p>
                )}
              </div>
            </div>

            <div className="mb-6">
              <label
                htmlFor="message"
                className="block text-sm font-semibold text-slate-700 mb-2"
              >
                Message
              </label>
              <textarea
                id="message"
                name="message"
                rows={5}
                value={form.message}
                onChange={handleChange}
                placeholder="Tell us about your requirements..."
                className={`w-full px-4 py-3 rounded-xl border bg-white text-sm text-slate-900 placeholder:text-slate-400 outline-none resize-none transition-all duration-200 focus:ring-4 ${
                  errors.message
                    ? "border-red-300 focus:ring-red-100"
                    : "border-slate-200 focus:border-indigo-400 focus:ring-indigo-100"
                }`}
              />
              {errors.message && (
                <p className="mt-1.5 text-xs text-red-500">{errors.message}</p>
              )}
            </div>

            <button
              type="submit"
              disabled={status === "loading"}
              className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-8 py-3.5 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white font-semibold shadow-lg shadow-indigo-500/25 hover:shadow-xl hover:shadow-indigo-500/40 hover:-translate-y-0.5 active:translate-y-0 transition-all duration-200 disabled:opacity-70 disabled:cursor-not-allowed disabled:translate-y-0"
            >
              {status === "loading" ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin" />
                  Sending...
                </>
              ) : status === "success" ? (
                <>
                  <CheckCircle2 className="w-4 h-4" />
                  Message Sent
                </>
              ) : (
                <>
                  <Send className="w-4 h-4" />
                  Submit Message
                </>
              )}
            </button>
          </motion.form>

          {/* Info panel */}
          <motion.div
            initial={{ opacity: 0, y: 24 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-60px" }}
            transition={{ duration: 0.5, delay: 0.15 }}
            className="lg:col-span-2 p-8 rounded-2xl bg-gradient-to-br from-indigo-600 via-violet-600 to-purple-700 text-white shadow-xl shadow-indigo-500/20"
          >
            <h3 className="text-xl font-bold mb-2">
              Let's build the future of retail together.
            </h3>
            <p className="text-indigo-100 text-sm mb-8">
              Reach out for collaborations, feedback, or demo access.
            </p>

            <div className="space-y-5">
              <div className="flex items-center gap-3">
                <span className="w-10 h-10 rounded-xl bg-white/15 backdrop-blur-sm flex items-center justify-center shrink-0">
                  <Mail className="w-4.5 h-4.5" />
                </span>
                <span className="text-sm font-medium">
                  info@retailintelligence.ai
                </span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-10 h-10 rounded-xl bg-white/15 backdrop-blur-sm flex items-center justify-center shrink-0">
                  <Phone className="w-4.5 h-4.5" />
                </span>
                <span className="text-sm font-medium">+91 86 786 43210</span>
              </div>
              <div className="flex items-center gap-3">
                <span className="w-10 h-10 rounded-xl bg-white/15 backdrop-blur-sm flex items-center justify-center shrink-0">
                  <MapPin className="w-4.5 h-4.5" />
                </span>
                <span className="text-sm font-medium">
                  Bhubaneswar, Odisha, India
                </span>
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
};

export default Contact;