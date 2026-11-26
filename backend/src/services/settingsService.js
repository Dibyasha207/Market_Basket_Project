const settingsRepository = require("../repositories/settingsRepository");

const getPlatformSettings = async () => {
  const [settings, logs] = await Promise.all([
    settingsRepository.getSettings(),
    settingsRepository.getActivityLogs(),
  ]);

  return {
    ...settings,
    activityLogs: logs,
  };
};

const updatePlatformSettings = async (updates, adminId = 1) => {
  const promises = [];
  if (updates.companyName !== undefined) {
    promises.push(settingsRepository.updateSetting("company_name", updates.companyName, adminId));
  }
  if (updates.theme !== undefined) {
    promises.push(settingsRepository.updateSetting("theme", updates.theme, adminId));
  }
  if (updates.currency !== undefined) {
    promises.push(settingsRepository.updateSetting("currency", updates.currency, adminId));
  }
  if (updates.language !== undefined) {
    promises.push(settingsRepository.updateSetting("language", updates.language, adminId));
  }
  if (updates.timezone !== undefined) {
    promises.push(settingsRepository.updateSetting("timezone", updates.timezone, adminId));
  }
  if (updates.openaiApiKey !== undefined && updates.openaiApiKey.trim() !== "") {
    promises.push(settingsRepository.updateSetting("openai_api_key", updates.openaiApiKey, adminId));
  }
  if (updates.geminiApiKey !== undefined && updates.geminiApiKey.trim() !== "") {
    promises.push(settingsRepository.updateSetting("gemini_api_key", updates.geminiApiKey, adminId));
  }

  await Promise.all(promises);
  return await getPlatformSettings();
};

module.exports = {
  getPlatformSettings,
  updatePlatformSettings,
};
