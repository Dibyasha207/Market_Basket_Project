const productRepository = require("../repositories/productRepository");

const getProducts = async () => {
  return await productRepository.getProductList();
};

const getProductAnalytics = async () => {
  return await productRepository.getProductAnalytics();
};

module.exports = {
  getProducts,
  getProductAnalytics,
};
