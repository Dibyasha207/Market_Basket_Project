const productService = require("../services/productService");

const getProducts = async (req, res) => {
  try {
    const products = await productService.getProducts();
    res.status(200).json({
      success: true,
      count: products.length,
      data: products,
    });
  } catch (error) {
    console.error("getProducts error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getProductAnalytics = async (req, res) => {
  try {
    const analytics = await productService.getProductAnalytics();
    res.status(200).json({
      success: true,
      data: analytics,
    });
  } catch (error) {
    console.error("getProductAnalytics error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

module.exports = {
  getProducts,
  getProductAnalytics,
};
