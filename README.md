# AI-Powered Retail Intelligence & Market Basket Analysis Dashboard

[![Version](https://img.shields.io/badge/Version-2.4.0--production-blue.svg)](https://github.com)
[![React](https://img.shields.io/badge/React-19-61dafb.svg)](https://reactjs.org/)
[![TailwindCSS](https://img.shields.io/badge/TailwindCSS-v4-38bdf8.svg)](https://tailwindcss.com/)
[![Node.js](https://img.shields.io/badge/Node.js-20.x-green.svg)](https://nodejs.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791.svg)](https://www.postgresql.org/)
[![Prophet](https://img.shields.io/badge/Prophet-v1.0-orange.svg)](https://facebook.github.io/prophet/)

An enterprise-grade full-stack retail intelligence platform combining big data transaction mining, customer RFM segmentation, Prophet time-series sales forecasting, and a Retrieval-Augmented Generation (RAG) AI assistant grounded in live PostgreSQL data.

---

## Key Features

1. **Executive Overview Dashboard**: High-level sales KPIs, interactive revenue area charts, category donuts, orders vs customers, and real-time alert logs.
2. **Market Basket Analysis (MBA)**: Discover actionable cross-selling affinities using Apriori association mining, Support vs Confidence scatter analysis, and an interactive 2D Force-Directed network graph.
3. **Product Recommendations**: Instant product search with associated cross-sell items, support/confidence/lift pills, and curated bundle pairings.
4. **Customer Segmentation**: RFM (Recency, Frequency, Monetary) analytics clustering 4,338 customer accounts into Champions, Loyal, Regular, and At-Risk tiers.
5. **Sales Forecasting**: Machine learning demand forecasting with Prophet v1.0, 95% confidence intervals, and category growth breakdowns.
6. **Product Analytics**: Real-time sales rankings, category performance over time, and proactive low-stock inventory alerts.
7. **RAG-Powered AI Assistant**: Contextual retail AI assistant answering queries directly from PostgreSQL records, association rules, and ML pipelines.
8. **Reports & Analytics Center**: Filter, preview, generate, and export customized PDF, Excel, and CSV reports.
9. **Admin Settings**: Multi-tab control center for system preferences, theme (Light/Dark), API keys, security policies, and database backup snapshots.

---

## Admin Credentials

- **Email**: `dibyashasahoo682@gmail.com`
- **Password**: `Admin@123`

---

## Quick Start (Local Development)

### 1. PostgreSQL Database
Ensure PostgreSQL is running locally on port 5432:
- Database Name: `retail_intelligence`
- Username: `postgres`
- Password: `your_password`

### 2. Backend API
```bash
cd backend
npm install
npm run dev   # Runs on http://localhost:5000
```

### 3. Frontend Application
```bash
cd frontend
npm install
npm run dev   # Runs on http://localhost:5173
```

### 4. Run Analytics & ML Pipeline (Optional)
```bash
python analytics/run_pipeline.py
```

### 5. Run API Test Suite
```bash
cd backend
node test_all_apis.js
```

---

## Docker Compose Deployment

To run the entire system in isolated containers:

```bash
docker-compose up -d --build
```

- **Frontend Application**: `http://localhost:3000`
- **Backend API**: `http://localhost:5000/api`
- **PostgreSQL Database**: `localhost:5432`

---

## Documentation

- Full 30-point engineering completion audit: [PROJECT_COMPLETION_REPORT.md](docs/PROJECT_COMPLETION_REPORT.md)
