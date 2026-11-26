require("dotenv").config();

const pool = require("../config/db");
const { hashPassword } = require("../utils/password");

const createAdmin = async () => {
  try {
    const admin = {
      name: "Administrator",
      email: "dibyashasahoo682@gmail.com",
      password: "Admin@123",
    };

    // Check if admin already exists
    const existingAdmin = await pool.query(
      "SELECT id FROM admins WHERE email = $1",
      [admin.email]
    );

    if (existingAdmin.rows.length > 0) {
      console.log("⚠️ Admin already exists.");
      process.exit(0);
    }

    // Hash password
    const hashedPassword = await hashPassword(admin.password);

    // Insert admin
    const result = await pool.query(
      `
      INSERT INTO admins (name, email, password)
      VALUES ($1, $2, $3)
      RETURNING id, name, email, created_at
      `,
      [admin.name, admin.email, hashedPassword]
    );

    console.log("\n✅ Administrator created successfully!\n");

    console.table(result.rows);

    console.log("\nLogin Credentials");
    console.log("--------------------------");
    console.log(`Email    : ${admin.email}`);
    console.log(`Password : ${admin.password}`);
    console.log("--------------------------\n");

    process.exit(0);
  } catch (error) {
    console.error("❌ Failed to create administrator");
    console.error(error);
    process.exit(1);
  }
};

createAdmin();