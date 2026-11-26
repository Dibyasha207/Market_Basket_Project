const customerService = require(
  "../services/customerService"
);

const getCustomerSegments = async (req, res) => {
  try {
    const customers =
      await customerService.getCustomerSegments();

    res.status(200).json({
      success: true,
      count: customers.segments?.length || 0,
      data: customers,
    });
  } catch (error) {
    console.error("getCustomerSegments error:", error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getCustomerOverview = async (req, res) => {
  try {
    const overview = await customerService.getCustomerOverview();
    res.status(200).json({
      success: true,
      data: overview,
    });
  } catch (error) {
    console.error("getCustomerOverview error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getTopCustomers = async (req, res) => {
  try {
    const limit = parseInt(req.query.limit, 10) || 5;
    const top = await customerService.getTopCustomers(limit);
    res.status(200).json({
      success: true,
      count: top.length,
      data: top,
    });
  } catch (error) {
    console.error("getTopCustomers error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

module.exports = {
  getCustomerSegments,
  getCustomerOverview,
  getTopCustomers,
};