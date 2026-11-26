import pandas as pd
from mlxtend.frequent_patterns import fpgrowth

# ==============================================
#        FREQUENT ITEMSET MINING - FP GROWTH
# ==============================================

INPUT_FILE = "../dataset/market_basket_transactions.csv"
OUTPUT_FILE = "../dataset/frequent_itemsets.csv"

print("\n==============================================")
print("       FREQUENT ITEMSET MINING")
print("==============================================\n")

# ------------------------------------------------
# 1. Load cleaned transaction data
# ------------------------------------------------

df = pd.read_csv(INPUT_FILE)

print("Transaction rows:", len(df))
print("Unique invoices:", df["InvoiceNo"].nunique())
print("Unique products:", df["StockCode"].nunique())

# ------------------------------------------------
# 2. Create Invoice × Product basket
# ------------------------------------------------
#
# Rows    = invoices
# Columns = products
# Value   = 1 if product was purchased
#           0 otherwise
# ------------------------------------------------

basket = (
    df.groupby(["InvoiceNo", "StockCode"])["Quantity"]
    .sum()
    .unstack(fill_value=0)
)

# Convert quantities into 0/1
basket = (basket > 0).astype(int)

print("\nBasket shape:", basket.shape)

# ------------------------------------------------
# 3. Remove extremely rare products
# ------------------------------------------------
#
# A product purchased in only 1 transaction
# cannot create useful frequent patterns.
#
# We keep products appearing in at least
# 10 transactions.
# ------------------------------------------------

min_product_transactions = 10

product_frequency = basket.sum(axis=0)

basket = basket[
    product_frequency[
        product_frequency >= min_product_transactions
    ].index
]

print(
    "Products after frequency filtering:",
    basket.shape[1]
)

# ------------------------------------------------
# 4. Run FP-Growth
# ------------------------------------------------
#
# min_support = 0.01 means:
#
# Product/itemset must appear in at least
# 1% of all transactions.
#
# With ~18,469 transactions:
#
# 1% ≈ 185 transactions
# ------------------------------------------------

MIN_SUPPORT = 0.01

print("\nRunning FP-Growth...")
print("Minimum support:", MIN_SUPPORT)

frequent_itemsets = fpgrowth(
    basket,
    min_support=MIN_SUPPORT,
    use_colnames=True
)

# ------------------------------------------------
# 5. Add itemset size
# ------------------------------------------------

frequent_itemsets["itemset_size"] = (
    frequent_itemsets["itemsets"].apply(len)
)

# ------------------------------------------------
# 6. Sort by support
# ------------------------------------------------

frequent_itemsets = frequent_itemsets.sort_values(
    by=["itemset_size", "support"],
    ascending=[True, False]
).reset_index(drop=True)

# ------------------------------------------------
# 7. Convert itemsets to readable text
# ------------------------------------------------

frequent_itemsets["itemsets"] = frequent_itemsets[
    "itemsets"
].apply(
    lambda x: ", ".join(sorted(map(str, x)))
)

# ------------------------------------------------
# 8. Save result
# ------------------------------------------------

frequent_itemsets.to_csv(
    OUTPUT_FILE,
    index=False
)

# ------------------------------------------------
# 9. Display result
# ------------------------------------------------

print("\n==============================================")
print("       FP-GROWTH RESULT")
print("==============================================")

print(
    "\nTotal frequent itemsets:",
    len(frequent_itemsets)
)

print("\nItemsets by size:")

print(
    frequent_itemsets["itemset_size"]
    .value_counts()
    .sort_index()
    .to_string()
)

print("\nTop frequent itemsets:")

print(
    frequent_itemsets.head(30).to_string(index=False)
)

print("\n==============================================")
print("Frequent itemset mining completed!")
print("==============================================")

print("\nSaved file:")
print(OUTPUT_FILE)