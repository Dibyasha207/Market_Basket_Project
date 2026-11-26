const { Router } = require("express");
const { login, getProfile, logout } = require("../controllers/authController");
const { authMiddleware } = require("../middlewares/authMiddleware");

const router = Router();

// Public
router.post("/login", login);

// Protected
router.get("/me", authMiddleware, getProfile);
router.post("/logout", authMiddleware, logout);

module.exports = router;