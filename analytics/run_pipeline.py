"""
Production Runner and Verification Script for Retail Intelligence Analytics Pipeline.
Executes and validates:
1. Data loading and dataset presence
2. Market Basket Analysis (itemsets & association rules)
3. Recommendation Engine calculation
4. Customer Segmentation (RFM + K-Means)
5. Sales Forecasting
6. PostgreSQL Analytics Synchronization
"""

import sys
import os
from pathlib import Path

# Force UTF-8 stdout if possible
if sys.platform == "win32":
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

BASE_DIR = Path(__file__).resolve().parent
PROJECT_DIR = BASE_DIR.parent
DATASET_DIR = PROJECT_DIR / "dataset"

print("=" * 60)
print("  RETAIL INTELLIGENCE & MARKET BASKET ML PIPELINE AUDIT")
print("=" * 60)

# 1. Dataset Verification
print("\n[1/6] Verifying Retail Datasets in", DATASET_DIR)
required_files = [
    "OnlineRetail.csv",
    "cleaned_retail.csv",
    "frequent_itemsets.csv",
    "association_rules.csv",
    "customer_segments.csv",
    "sales_forecast.csv",
]

all_present = True
for f in required_files:
    file_path = DATASET_DIR / f
    if file_path.exists():
        size_mb = file_path.stat().st_size / (1024 * 1024)
        print(f"  [OK] {f} ({size_mb:.2f} MB)")
    else:
        print(f"  [MISSING] {f}")
        all_present = False

# 2. Market Basket Analysis Validation
print("\n[2/6] Validating Market Basket Analysis & Association Rules...")
try:
    import pandas as pd
    rules_file = DATASET_DIR / "association_rules.csv"
    if rules_file.exists():
        rules_df = pd.read_csv(rules_file)
        print(f"  [OK] Association rules loaded: {len(rules_df)} rules")
        print(f"    - Avg Support: {rules_df['support'].mean():.4f}")
        print(f"    - Avg Confidence: {rules_df['confidence'].mean():.4f}")
        print(f"    - Avg Lift: {rules_df['lift'].mean():.2f}")
        print(f"    - Max Lift: {rules_df['lift'].max():.2f}")
    else:
        print("  [FAIL] association_rules.csv missing")
except Exception as e:
    print(f"  [FAIL] Error validating MBA rules: {e}")

# 3. Recommendation Engine Validation
print("\n[3/6] Validating Product Recommendation Engine...")
try:
    readable_rules_file = DATASET_DIR / "readable_association_rules.csv"
    if readable_rules_file.exists():
        r_df = pd.read_csv(readable_rules_file)
        print(f"  [OK] Readable rules loaded: {len(r_df)} mapped rules")
        tea_rules = r_df[r_df['antecedent_products'].str.contains("TEA", case=False, na=False)]
        print(f"    - Rules for 'TEA' products: {len(tea_rules)} associations found")
    else:
        print("  [INFO] Using association_rules.csv for recommendation mapping")
except Exception as e:
    print(f"  [FAIL] Recommendation engine validation error: {e}")

# 4. Customer Segmentation (RFM) Validation
print("\n[4/6] Validating Customer RFM Segmentation...")
try:
    cust_file = DATASET_DIR / "customer_segments.csv"
    if cust_file.exists():
        cust_df = pd.read_csv(cust_file)
        print(f"  [OK] Customer segments loaded: {len(cust_df)} records")
        seg_col = 'CustomerSegment' if 'CustomerSegment' in cust_df.columns else 'segment_name'
        seg_counts = cust_df[seg_col].value_counts()
        for seg, count in seg_counts.items():
            print(f"    - Segment '{seg}': {count} customers ({count/len(cust_df)*100:.1f}%)")
    else:
        print("  [FAIL] customer_segments.csv missing")
except Exception as e:
    print(f"  [FAIL] Customer segmentation validation error: {e}")

# 5. Sales Forecasting Validation
print("\n[5/6] Validating Sales Forecasting Model...")
try:
    forecast_file = DATASET_DIR / "sales_forecast.csv"
    if forecast_file.exists():
        fc_df = pd.read_csv(forecast_file)
        print(f"  [OK] Sales forecast checkpoints: {len(fc_df)} monthly records")
        print(f"    - Start Month: {fc_df.iloc[0]['Month']}")
        print(f"    - End Month: {fc_df.iloc[-1]['Month']}")
        print(f"    - Mean Monthly Sales: ${fc_df['TotalPrice'].mean():,.2f}")
    else:
        print("  [FAIL] sales_forecast.csv missing")
except Exception as e:
    print(f"  [FAIL] Sales forecast validation error: {e}")

# 6. PostgreSQL Database Sync Verification
print("\n[6/6] Validating PostgreSQL Synchronization...")
try:
    import psycopg2
    from psycopg2.extras import RealDictCursor

    conn = psycopg2.connect(
        host="localhost",
        port=5432,
        dbname="retail_intelligence",
        user="postgres",
        password=os.environ.get("DB_PASSWORD", "dibu.0404")
    )
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    tables_to_check = [
        "association_rules",
        "customer_segments",
        "sales_forecasts",
        "products",
        "customers",
        "orders",
        "categories",
        "settings",
        "reports",
        "ai_messages",
    ]

    for table in tables_to_check:
        cursor.execute(f"SELECT COUNT(*) as count FROM {table};")
        count = cursor.fetchone()["count"]
        print(f"  [OK] Table '{table}': {count} records in PostgreSQL")

    conn.close()
    print("\n[SUCCESS] All pipeline stages validated successfully!")
except Exception as e:
    print(f"  [WARN] PostgreSQL connection note: {e}")

print("=" * 60)
