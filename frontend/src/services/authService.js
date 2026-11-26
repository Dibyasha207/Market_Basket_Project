import api from "./api";

/**
 * Logs an administrator in.
 * @param {{ email: string, password: string }} credentials
 * @returns {Promise<{ token: string, admin: object }>}
 */
export const loginRequest = async ({ email, password }) => {
  const { data } = await api.post("/auth/login", { email, password });
  return data;
};

/**
 * Fetches the currently authenticated admin's profile.
 * @returns {Promise<object>}
 */
export const fetchProfile = async () => {
  const { data } = await api.get("/auth/me");
  return data;
};

/**
 * Logs the admin out (server-side no-op for stateless JWT, kept for parity).
 */
export const logoutRequest = async () => {
  const { data } = await api.post("/auth/logout");
  return data;
};