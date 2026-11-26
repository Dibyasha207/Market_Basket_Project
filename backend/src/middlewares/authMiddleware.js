const { verifyToken } = require("../utils/jwt");

/**
 * Protects routes by requiring a valid Bearer JWT.
 * Populates req.admin with the decoded token payload on success.
 */
const authMiddleware = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith("Bearer ")) {
    return res.status(401).json({
      success: false,
      message: "Unauthorized. No token provided.",
    });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded = verifyToken(token);
    req.admin = decoded;
    return next();
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      return res.status(401).json({
        success: false,
        message: "Session expired. Please log in again.",
      });
    }

    return res.status(403).json({
      success: false,
      message: "Forbidden. Invalid token.",
    });
  }
};

module.exports = {
  authMiddleware,
};