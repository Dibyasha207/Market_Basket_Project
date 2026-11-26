const express = require("express");
const router = express.Router();
const {
  getSettings,
  updateSettings,
  backupDatabase,
} = require("../controllers/settingsController");

router.get("/", getSettings);
router.put("/", updateSettings);
router.post("/backup", backupDatabase);

module.exports = router;
