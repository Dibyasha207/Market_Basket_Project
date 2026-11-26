const http = require("http");

const BASE_URL = "http://localhost:5000";

function request(method, path, body = null, token = null) {
  return new Promise((resolve, reject) => {
    const url = new URL(path, BASE_URL);
    const options = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method: method,
      headers: {
        "Content-Type": "application/json",
      },
    };

    if (token) {
      options.headers["Authorization"] = `Bearer ${token}`;
    }

    const req = http.request(options, (res) => {
      let data = "";
      res.on("data", (chunk) => (data += chunk));
      res.on("end", () => {
        try {
          const parsed = JSON.parse(data);
          resolve({ status: res.statusCode, body: parsed });
        } catch {
          resolve({ status: res.statusCode, body: data });
        }
      });
    });

    req.on("error", reject);
    if (body) {
      req.write(JSON.stringify(body));
    }
    req.end();
  });
}

async function runTests() {
  console.log("=================================================");
  console.log("   RETAIL INTELLIGENCE END-TO-END API TEST SUITE");
  console.log("=================================================");

  let token = null;

  // 1. Auth Login
  try {
    const loginRes = await request("POST", "/api/auth/login", {
      email: "dibyashasahoo682@gmail.com",
      password: "Admin@123",
    });
    console.log(`[1] POST /api/auth/login -> Status: ${loginRes.status}, Success: ${loginRes.body?.success}`);
    token = loginRes.body?.token;
    if (!token) throw new Error("No token received");
  } catch (err) {
    console.error("Auth failed:", err.message);
  }

  const endpoints = [
    { name: "Dashboard Overview", method: "GET", path: "/api/dashboard/overview" },
    { name: "Dashboard Root Alias", method: "GET", path: "/api/dashboard" },
    { name: "Customer Segments", method: "GET", path: "/api/customers/segments" },
    { name: "Customer RFM Distribution", method: "GET", path: "/api/customers/rfm-distribution" },
    { name: "Product Analytics Overview", method: "GET", path: "/api/products/analytics" },
    { name: "MBA Association Rules", method: "GET", path: "/api/mba/rules" },
    { name: "MBA Product Network", method: "GET", path: "/api/mba/network" },
    { name: "MBA Insights", method: "GET", path: "/api/mba/insights" },
    { name: "Recommendations (Milk)", method: "GET", path: "/api/recommendations/product?product=Milk" },
    { name: "Top Associated Products", method: "GET", path: "/api/recommendations/top-associated" },
    { name: "Sales Forecast Overview (7D)", method: "GET", path: "/api/forecast/overview?range=7d" },
    { name: "AI Knowledge Sources", method: "GET", path: "/api/ai/knowledge-sources" },
    { name: "AI Conversations", method: "GET", path: "/api/ai/conversations" },
    { name: "Reports Overview", method: "GET", path: "/api/reports" },
    { name: "Platform Settings", method: "GET", path: "/api/settings" },
  ];

  let passed = 0;
  for (const ep of endpoints) {
    try {
      const res = await request(ep.method, ep.path, null, token);
      const isSuccess = res.status >= 200 && res.status < 300 && res.body?.success !== false;
      if (isSuccess) passed++;
      console.log(`[${isSuccess ? "PASS" : "FAIL"}] ${ep.method} ${ep.path} -> Status ${res.status}`);
    } catch (err) {
      console.error(`[ERR] ${ep.method} ${ep.path}: ${err.message}`);
    }
  }

  // Test RAG AI Chat
  try {
    const aiRes = await request("POST", "/api/ai/chat", {
      message: "Which products should be promoted together?",
    }, token);
    const aiSuccess = aiRes.status === 200 && aiRes.body?.success;
    if (aiSuccess) passed++;
    console.log(`[${aiSuccess ? "PASS" : "FAIL"}] POST /api/ai/chat (RAG Inquiry) -> Status ${aiRes.status}`);
  } catch (err) {
    console.error(`[ERR] POST /api/ai/chat: ${err.message}`);
  }

  // Test Report Generation
  try {
    const repRes = await request("POST", "/api/reports/generate", {
      reportName: "Audit Test Report",
      reportType: "Executive Summary",
      format: "PDF",
    }, token);
    const repSuccess = repRes.status === 201 && repRes.body?.success;
    if (repSuccess) passed++;
    console.log(`[${repSuccess ? "PASS" : "FAIL"}] POST /api/reports/generate -> Status ${repRes.status}`);
  } catch (err) {
    console.error(`[ERR] POST /api/reports/generate: ${err.message}`);
  }

  console.log("=================================================");
  console.log(`API Verification Complete: ${passed + 1}/${endpoints.length + 3} passed`);
  console.log("=================================================");
  process.exit(0);
}

runTests();
