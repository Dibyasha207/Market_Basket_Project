const jwt = require("jsonwebtoken");
require("dotenv").config();

const JWT_SECRET = process.env.JWT_SECRET;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || "1d";

if (!JWT_SECRET) {
  throw new Error("JWT_SECRET is not defined in environment variables");
}

/**
 * Signs a JWT for an authenticated admin.
 * @param {{ id: number, email: string, name: string }} payload
 * @returns {string} signed JWT token
 */
const generateToken = (payload) => {
  return jwt.sign(payload, JWT_SECRET, { expiresIn: JWT_EXPIRES_IN });
};

/**
 * Verifies and decodes a JWT token.
 * Throws if the token is invalid or expired.
 * @param {string} token
 * @returns {object} decoded payload
 */
const verifyToken = (token) => {
  return jwt.verify(token, JWT_SECRET);
};

module.exports = {
  generateToken,
  verifyToken,
};