const { Pool } = require("pg");
require("dotenv").config();

const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  max: 10,
  idleTimeoutMillis: 30000,
});

pool.connect()
  .then(() => console.log("✅ PostgreSQL Connected"))
  .catch((err) => console.error("❌ Database Connection Error:", err));

pool.on("error", (err) => {
  console.error("❌ Unexpected PostgreSQL Pool Error:", err);
});

module.exports = pool;