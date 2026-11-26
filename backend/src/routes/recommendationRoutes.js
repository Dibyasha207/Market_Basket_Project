const express = require("express");

const router = express.Router();

const recommendationController = require(
  "../controllers/recommendationController"
);

router.get(
  "/",
  recommendationController.getRecommendations
);

router.get(
  "/product",
  recommendationController.getRecommendations
);

router.get(
  "/top-associated",
  recommendationController.getRecommendations
);

router.get(
  "/overview",
  recommendationController.getRecommendations
);

module.exports = router;