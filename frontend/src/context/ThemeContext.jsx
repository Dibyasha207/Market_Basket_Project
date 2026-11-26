import { createContext, useState, useEffect, useCallback } from "react";

export const ThemeContext = createContext(null);

const THEME_KEY = "theme";

const getInitialTheme = () => {
  if (typeof window === "undefined") return "light";

  const stored = localStorage.getItem(THEME_KEY);
  // Only trust an explicit saved preference — never fall back to OS/browser
  // system preference, so the dashboard always starts in light mode by default.
  return stored === "dark" ? "dark" : "light";
};

export const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState(getInitialTheme);

  useEffect(() => {
    const root = document.documentElement;
    root.classList.toggle("dark", theme === "dark");
    localStorage.setItem(THEME_KEY, theme);
  }, [theme]);

  const toggleTheme = useCallback(() => {
    setTheme((prev) => (prev === "dark" ? "light" : "dark"));
  }, []);

  const value = {
    theme,
    isDark: theme === "dark",
    toggleTheme,
    setTheme,
  };

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
};