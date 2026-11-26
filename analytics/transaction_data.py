import pandas as pd

# ==============================================
#       MARKET BASKET TRANSACTION PREPARATION
# ==============================================

INPUT_FILE = "../dataset/cleaned_retail.csv"
OUTPUT_FILE = "../dataset/market_basket_transactions.csv"

print("\n==============================================")
print("       MARKET BASKET TRANSACTION PREPARATION")
print("==============================================\n")

# Load required columns
df = pd.read_csv(
    INPUT_FILE,
    usecols=["InvoiceNo", "StockCode", "Description", "Quantity"]
)

print("Original rows:", len(df))

# ----------------------------------------------
# 1. Clean InvoiceNo
# ----------------------------------------------

df["InvoiceNo"] = df["InvoiceNo"].astype(str).str.strip()

# Remove cancelled transactions
df = df[~df["InvoiceNo"].str.upper().str.startswith("C")].copy()

# ----------------------------------------------
# 2. Clean StockCode
# ----------------------------------------------

df["StockCode"] = df["StockCode"].astype(str).str.strip()

# Remove non-product/service codes
excluded_codes = [
    "POST",
    "DOT",
    "BANK CHARGES",
    "MANUAL"
]

df = df[
    ~df["StockCode"].str.upper().isin(excluded_codes)
].copy()

# ----------------------------------------------
# 3. Clean Quantity
# ----------------------------------------------

df["Quantity"] = pd.to_numeric(
    df["Quantity"],
    errors="coerce"
)

# Keep only positive quantities
df = df[df["Quantity"] > 0].copy()

# ----------------------------------------------
# 4. Clean Description
# ----------------------------------------------

df["Description"] = (
    df["Description"]
    .fillna("")
    .astype(str)
    .str.upper()
    .str.strip()
)

# Remove empty descriptions
df = df[df["Description"] != ""].copy()

# ----------------------------------------------
# 5. Remove duplicate product inside invoice
# ----------------------------------------------

df = df.drop_duplicates(
    subset=["InvoiceNo", "StockCode"]
).copy()

# ----------------------------------------------
# 6. Final sorting
# ----------------------------------------------

df = df.sort_values(
    by=["InvoiceNo", "StockCode"]
).reset_index(drop=True)

# ----------------------------------------------
# 7. Save result
# ----------------------------------------------

df.to_csv(
    OUTPUT_FILE,
    index=False
)

# ----------------------------------------------
# REPORT
# ----------------------------------------------

print("Clean transaction rows:", len(df))
print("Unique invoices:", df["InvoiceNo"].nunique())
print("Unique products:", df["StockCode"].nunique())

print("\nFirst 20 rows:")
print(
    df.head(20).to_string(index=False)
)

print("\n==============================================")
print("Transaction preparation completed!")
print("==============================================")
print(f"\nSaved file:")
print(OUTPUT_FILE)
print()