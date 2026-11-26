const express = require("express");
const router = express.Router();
const {
  getReports,
  generateReport,
  downloadReport,
} = require("../controllers/reportController");

router.get("/", getReports);
router.post("/generate", generateReport);
router.get("/:id/download", downloadReport);

module.exports = router;
