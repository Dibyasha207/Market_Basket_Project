// import React from "react";
import Navbar from "../components/landing/Navbar";
import Hero from "../components/landing/Hero";
import Stats from "../components/landing/Stats";
import Features from "../components/landing/Features";
import HowItWorks from "../components/landing/HowItWorks";
import Technology from "../components/landing/Technology";
import Contact from "../components/landing/Contact";
import Footer from "../components/landing/Footer";

const LandingPage = () => {
  return (
    <div className="min-h-screen bg-white antialiased selection:bg-indigo-100 selection:text-indigo-900">
      <Navbar />
      <main>
        <Hero />
        <section className="py-12 bg-slate-50/60 border-y border-slate-100">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <Stats />
          </div>
        </section>
        <Features />
        <HowItWorks />
        <Technology />
        <Contact />
      </main>
      <Footer />
    </div>
  );
};

export default LandingPage;