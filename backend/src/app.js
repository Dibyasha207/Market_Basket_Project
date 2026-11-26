const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./routes/authRoutes");
const recommendationRoutes = require("./routes/recommendationRoutes");
const customerRoutes = require("./routes/customerRoutes");
const forecastRoutes = require("./routes/forecastRoutes");
const dashboardRoutes = require("./routes/dashboardRoutes");
const mbaRoutes = require("./routes/mbaRoutes");
const productRoutes = require("./routes/productRoutes");
const aiRoutes = require("./routes/aiRoutes");
const reportRoutes = require("./routes/reportRoutes");
const settingsRoutes = require("./routes/settingsRoutes");

const app = express();

app.use(cors());
app.use(express.json());

// Health Check
app.get("/health", (req, res) => {
  res.status(200).json({
    success: true,
    message: "AI Retail Intelligence API Running 🚀",
    timestamp: new Date().toISOString(),
  });
});

// Business APIs
app.use("/api/auth", authRoutes);
app.use("/api/dashboard", dashboardRoutes);
app.use("/api/customers", customerRoutes);
app.use("/api/recommendations", recommendationRoutes);
app.use("/api/forecast", forecastRoutes);
app.use("/api/forecasts", forecastRoutes);
app.use("/api/products", productRoutes);
app.use("/api/ai", aiRoutes);
app.use("/api/assistant", aiRoutes);
app.use("/api/reports", reportRoutes);
app.use("/api/settings", settingsRoutes);
app.use("/api/mba", mbaRoutes);

module.exports = app;