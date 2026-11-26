const bcrypt = require("bcrypt");

const SALT_ROUNDS = 12;

/**
 * Hashes a plaintext password.
 * @param {string} plainPassword
 * @returns {Promise<string>} hashed password
 */
const hashPassword = async (plainPassword) => {
  return bcrypt.hash(plainPassword, SALT_ROUNDS);
};

/**
 * Compares a plaintext password against a bcrypt hash.
 * @param {string} plainPassword
 * @param {string} hashedPassword
 * @returns {Promise<boolean>} true if match
 */
const comparePassword = async (plainPassword, hashedPassword) => {
  return bcrypt.compare(plainPassword, hashedPassword);
};

module.exports = {
  hashPassword,
  comparePassword,
};