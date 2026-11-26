const express = require("express");
const router = express.Router();

const {
  getProducts,
  getProductAnalytics,
} = require("../controllers/productController");

router.get("/", getProducts);
router.get("/analytics", getProductAnalytics);

module.exports = router;
