import { useContext } from "react";
import { ThemeContext } from "../context/ThemeContext";

/**
 * Hook to access the app-wide theme (light/dark) and the toggle function.
 * Must be used within a <ThemeProvider>.
 */
export const useTheme = () => {
  const context = useContext(ThemeContext);

  if (!context) {
    throw new Error("useTheme must be used within a ThemeProvider");
  }

  return context;
};