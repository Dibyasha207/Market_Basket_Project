import { useState, useEffect, useCallback } from "react";
import settingsService from "../services/settingsService";

export const useSettings = () => {
  const [settings, setSettings] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchSettings = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const res = await settingsService.getSettings();
      setSettings(res.data);
    } catch (err) {
      console.error("Failed to load settings:", err);
      setError(err?.response?.data?.message || "Failed to load platform settings");
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchSettings();
  }, [fetchSettings]);

  const saveSettings = async (updates) => {
    const res = await settingsService.updateSettings(updates);
    setSettings(res.data);
    return res;
  };

  const backupDb = async () => {
    return await settingsService.triggerDatabaseBackup();
  };

  return {
    settings,
    isLoading,
    error,
    refetch: fetchSettings,
    saveSettings,
    backupDb,
  };
};

export default useSettings;
