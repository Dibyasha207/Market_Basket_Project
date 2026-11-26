const customerRepository = require(
  "../repositories/customerRepository"
);

const getCustomerSegments = async () => {
  return await customerRepository.getCustomerSegments();
};

const getCustomerOverview = async () => {
  return await customerRepository.getCustomerOverview();
};

const getTopCustomers = async (limit) => {
  return await customerRepository.getTopCustomers(limit);
};

module.exports = {
  getCustomerSegments,
  getCustomerOverview,
  getTopCustomers,
};