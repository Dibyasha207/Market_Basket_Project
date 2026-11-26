const { findAdminByEmail, findAdminById } = require("../repositories/authRepository");
const { comparePassword } = require("../utils/password");
const { generateToken } = require("../utils/jwt");

/**
 * Custom error carrying an HTTP status code, so the controller
 * can respond appropriately without inspecting error messages.
 */
class AuthError extends Error {
  constructor(message, statusCode = 401) {
    super(message);
    this.name = "AuthError";
    this.statusCode = statusCode;
  }
}

/**
 * Authenticates an administrator by email + password.
 * @param {string} email
 * @param {string} password
 * @returns {Promise<{ token: string, admin: object }>}
 */
const loginAdmin = async (email, password) => {
  const admin = await findAdminByEmail(email);

  if (!admin) {
    // Same generic message as wrong password — avoids leaking which field was wrong
    throw new AuthError("Invalid email or password", 401);
  }

  const isPasswordValid = await comparePassword(password, admin.password);

  if (!isPasswordValid) {
    throw new AuthError("Invalid email or password", 401);
  }

  const token = generateToken({
    id: admin.id,
    email: admin.email,
    name: admin.name,
  });

  const safeAdmin = {
    id: admin.id,
    name: admin.name,
    email: admin.email,
    created_at: admin.created_at,
  };

  return { token, admin: safeAdmin };
};

/**
 * Retrieves the currently authenticated admin's public profile.
 * Used by the /api/auth/me endpoint.
 * @param {number} adminId
 * @returns {Promise<object>}
 */
const getAuthenticatedAdmin = async (adminId) => {
  const admin = await findAdminById(adminId);

  if (!admin) {
    throw new AuthError("Administrator not found", 404);
  }

  return admin;
};

module.exports = {
  AuthError,
  loginAdmin,
  getAuthenticatedAdmin,
};