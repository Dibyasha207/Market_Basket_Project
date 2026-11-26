const pool = require("../config/db");

/**
 * Fetches a single admin by email.
 * Uses parameterized query to prevent SQL injection.
 * @param {string} email
 * @returns {Promise<object|null>} admin row or null
 */
const findAdminByEmail = async (email) => {
  const query = `
    SELECT id, name, email, password, created_at, updated_at
    FROM admins
    WHERE email = $1
    LIMIT 1
  `;
  const { rows } = await pool.query(query, [email.trim().toLowerCase()]);
  return rows[0] || null;
};

/**
 * Fetches a single admin by id (used by auth middleware to re-verify identity).
 * @param {number} id
 * @returns {Promise<object|null>} admin row or null
 */
const findAdminById = async (id) => {
  const query = `
    SELECT id, name, email, created_at, updated_at
    FROM admins
    WHERE id = $1
    LIMIT 1
  `;
  const { rows } = await pool.query(query, [id]);
  return rows[0] || null;
};

module.exports = {
  findAdminByEmail,
  findAdminById,
};