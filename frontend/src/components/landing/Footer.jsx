// import React from "react";
import { Link } from "react-router-dom";
import { ShieldCheck } from "lucide-react";
import { FaGithub, FaLinkedin, FaTwitter, FaYoutube } from "react-icons/fa";

const QUICK_LINKS = [
  { label: "Home", href: "#home" },
  { label: "Features", href: "#features" },
  { label: "How It Works", href: "#how-it-works" },
  { label: "Technology", href: "#technology" },
  { label: "Contact", href: "#contact" },
];

const TECH_LINKS = [
  "React",
  "Node.js",
  "Python",
  "PostgreSQL",
  "Machine Learning",
];

const SOCIALS = [
  { icon: FaGithub, href: "https://github.com", label: "GitHub" },
  { icon: FaLinkedin, href: "https://linkedin.com", label: "LinkedIn" },
  { icon: FaTwitter, href: "https://twitter.com", label: "Twitter" },
  { icon: FaYoutube, href: "https://youtube.com", label: "YouTube" },
];

const Footer = () => {
  const handleScroll = (e, href) => {
    e.preventDefault();
    const el = document.querySelector(href);
    if (el) el.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  return (
    <footer className="relative bg-slate-950 text-slate-300">
      <div className="max-w-7xl mx-auto px-6 lg:px-10 py-16">
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-10">
          {/* Brand */}
          <div className="lg:col-span-1">
            <Link to="/" className="flex items-center gap-2.5 mb-4">
              <span className="flex items-center justify-center w-9 h-9 rounded-lg bg-gradient-to-br from-indigo-600 via-violet-600 to-purple-600 shadow-md">
                <ShieldCheck className="w-4.5 h-4.5 text-white" strokeWidth={2.4} />
              </span>
              <span className="text-base font-bold text-white">
                AI Retail Intelligence
              </span>
            </Link>
            <p className="text-sm text-slate-400 leading-relaxed">
              AI-Powered Retail Intelligence Dashboard that transforms retail
              data into actionable business insights.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="text-sm font-bold text-white mb-5">Quick Links</h4>
            <ul className="space-y-3">
              {QUICK_LINKS.map((link) => (
                <li key={link.href}>
                  <a
                    href={link.href}
                    onClick={(e) => handleScroll(e, link.href)}
                    className="text-sm text-slate-400 hover:text-indigo-400 transition-colors duration-200"
                  >
                    {link.label}
                  </a>
                </li>
              ))}
            </ul>
          </div>

          {/* Technologies */}
          <div>
            <h4 className="text-sm font-bold text-white mb-5">Technologies</h4>
            <ul className="space-y-3">
              {TECH_LINKS.map((tech) => (
                <li key={tech} className="text-sm text-slate-400">
                  {tech}
                </li>
              ))}
            </ul>
          </div>

          {/* Contact */}
          <div>
            <h4 className="text-sm font-bold text-white mb-5">Contact Info</h4>
            <ul className="space-y-3 text-sm text-slate-400">
              <li>info@retailintelligence.ai</li>
              <li>+91 86 786 43210</li>
              <li>Bhubaneswar, Odisha, India</li>
            </ul>
          </div>
        </div>

        {/* Bottom bar */}
        <div className="mt-14 pt-8 border-t border-slate-800 flex flex-col sm:flex-row items-center justify-between gap-5">
          <p className="text-xs text-slate-500 text-center sm:text-left">
            Final Year Major Project — AI-Powered Retail Intelligence &amp;
            Market Basket Analysis Dashboard
          </p>
          <div className="flex items-center gap-3">
            {SOCIALS.map(({ icon: Icon, href, label }) => (
              <a
                key={label}
                href={href}
                target="_blank"
                rel="noopener noreferrer"
                aria-label={label}
                className="w-9 h-9 rounded-lg bg-slate-800/80 hover:bg-gradient-to-br hover:from-indigo-600 hover:to-violet-600 flex items-center justify-center transition-all duration-200 hover:-translate-y-0.5"
              >
                <Icon className="w-4 h-4 text-slate-300" />
              </a>
            ))}
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;