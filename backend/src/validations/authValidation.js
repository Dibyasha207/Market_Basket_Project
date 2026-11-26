/**
 * Basic RFC-compliant-enough email pattern for server-side validation.
 */
const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

/**
 * Validates the login request body.
 * @param {{ email: string, password: string }} body
 * @returns {{ isValid: boolean, errors: Record<string, string> }}
 */
const validateLoginInput = (body) => {
  const errors = {};
  const { email, password } = body || {};

  if (!email || typeof email !== "string" || !email.trim()) {
    errors.email = "Email is required";
  } else if (!EMAIL_REGEX.test(email.trim())) {
    errors.email = "Enter a valid email address";
  }

  if (!password || typeof password !== "string" || !password.trim()) {
    errors.password = "Password is required";
  } else if (password.length < 6) {
    errors.password = "Password must be at least 6 characters";
  }

  return {
    isValid: Object.keys(errors).length === 0,
    errors,
  };
};

module.exports = {
  validateLoginInput,
};