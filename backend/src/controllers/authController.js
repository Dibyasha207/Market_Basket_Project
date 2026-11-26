const { validateLoginInput } = require("../validations/authValidation");
const { loginAdmin, getAuthenticatedAdmin, AuthError } = require("../services/authService");

/**
 * POST /api/auth/login
 * Authenticates an administrator and returns a JWT + profile.
 */
const login = async (req, res) => {
  try {
    const { isValid, errors } = validateLoginInput(req.body);

    if (!isValid) {
      return res.status(400).json({
        success: false,
        message: "Validation failed",
        errors,
      });
    }

    const { email, password } = req.body;
    const { token, admin } = await loginAdmin(email, password);

    return res.status(200).json({
      success: true,
      message: "Login successful",
      token,
      admin,
    });
  } catch (error) {
    if (error instanceof AuthError) {
      return res.status(error.statusCode).json({
        success: false,
        message: error.message,
      });
    }

    console.error("Login controller error:", error);
    return res.status(500).json({
      success: false,
      message: "Something went wrong. Please try again later.",
    });
  }
};

/**
 * GET /api/auth/me
 * Returns the currently authenticated admin's profile.
 * Protected by authMiddleware — req.admin is populated there.
 */
const getProfile = async (req, res) => {
  try {
    const admin = await getAuthenticatedAdmin(req.admin.id);

    return res.status(200).json({
      success: true,
      admin,
    });
  } catch (error) {
    if (error instanceof AuthError) {
      return res.status(error.statusCode).json({
        success: false,
        message: error.message,
      });
    }

    console.error("GetProfile controller error:", error);
    return res.status(500).json({
      success: false,
      message: "Something went wrong. Please try again later.",
    });
  }
};

/**
 * POST /api/auth/logout
 * Stateless JWT logout — client discards the token.
 * Endpoint exists for consistency / future token-blacklisting.
 */
const logout = async (_req, res) => {
  return res.status(200).json({
    success: true,
    message: "Logged out successfully",
  });
};

module.exports = {
  login,
  getProfile,
  logout,
};