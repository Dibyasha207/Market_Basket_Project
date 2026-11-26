import  { createContext, useState, useEffect, useCallback } from "react";
import { loginRequest, logoutRequest } from "../services/authService";

export const AuthContext = createContext(null);

const TOKEN_KEY = "admin_token";
const PROFILE_KEY = "admin_profile";

export const AuthProvider = ({ children }) => {
  const [admin, setAdmin] = useState(null);
  const [token, setToken] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  // Rehydrate auth state from localStorage on first load
  useEffect(() => {
    try {
      const storedToken = localStorage.getItem(TOKEN_KEY);
      const storedProfile = localStorage.getItem(PROFILE_KEY);

      if (storedToken && storedProfile) {
        setToken(storedToken);
        setAdmin(JSON.parse(storedProfile));
      }
    } catch (error) {
      console.error("Failed to rehydrate auth session:", error);
    } finally {
      setIsLoading(false);
    }
  }, []);

  const login = useCallback(async ({ email, password, rememberMe }) => {
    const data = await loginRequest({ email, password });

    setToken(data.token);
    setAdmin(data.admin);

    // Persist regardless of rememberMe for session continuity;
    // rememberMe can be used later to switch to sessionStorage if desired.
    localStorage.setItem(TOKEN_KEY, data.token);
    localStorage.setItem(PROFILE_KEY, JSON.stringify(data.admin));

    return data;
  }, []);

  const logout = useCallback(async () => {
    try {
      await logoutRequest();
    } catch (error) {
      console.error("Logout request failed:", error);
    } finally {
      setToken(null);
      setAdmin(null);
      localStorage.removeItem(TOKEN_KEY);
      localStorage.removeItem(PROFILE_KEY);
    }
  }, []);

  const value = {
    admin,
    token,
    isAuthenticated: Boolean(token),
    isLoading,
    login,
    logout,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};