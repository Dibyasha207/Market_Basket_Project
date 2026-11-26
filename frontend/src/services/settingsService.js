import api from "./api";

export const getSettings = async () => {
  const { data } = await api.get("/settings");
  return data;
};

export const updateSettings = async (updates) => {
  const { data } = await api.put("/settings", updates);
  return data;
};

export const triggerDatabaseBackup = async () => {
  const { data } = await api.post("/settings/backup");
  return data;
};

const settingsService = {
  getSettings,
  updateSettings,
  triggerDatabaseBackup,
};

export default settingsService;
