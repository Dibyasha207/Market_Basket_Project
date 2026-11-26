const express = require("express");

const router = express.Router();

const customerController = require(
  "../controllers/customerController"
);

router.get(
  "/segments",
  customerController.getCustomerSegments
);

router.get(
  "/rfm-distribution",
  customerController.getCustomerSegments
);

router.get(
  "/metrics",
  customerController.getCustomerOverview
);

router.get(
  "/overview",
  customerController.getCustomerOverview
);

router.get(
  "/top",
  customerController.getTopCustomers
);

module.exports = router;