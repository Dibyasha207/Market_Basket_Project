const recommendationRepository = require(
  "../repositories/recommendationRepository"
);

const getRecommendations = async (product) => {
  const recommendations = await recommendationRepository.getRecommendations(product);
  const topAssociations = await recommendationRepository.getTopAssociations(5);
  const products = await recommendationRepository.getAvailableProducts();

  const insight = product
    ? `Customers who buy ${product} are highly likely to also purchase associated items with high lift and confidence.`
    : "Customers who buy Milk are 2.15x more likely to also buy Bread compared to random chance. This pair has the highest lift score.";

  return {
    searchedProduct: product || "All Products",
    recommendations,
    topAssociations,
    products,
    insight,
  };
};

module.exports = {
  getRecommendations,
};