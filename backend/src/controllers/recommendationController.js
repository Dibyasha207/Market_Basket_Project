const recommendationService = require(
  "../services/recommendationService"
);

const getRecommendations = async (req, res) => {
  try {
    const { product } = req.query;

    const result =
      await recommendationService.getRecommendations(product);

    res.status(200).json({
      success: true,
      count: result.recommendations?.length || 0,
      data: result,
    });
  } catch (error) {
    console.error("getRecommendations error:", error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

module.exports = {
  getRecommendations,
};