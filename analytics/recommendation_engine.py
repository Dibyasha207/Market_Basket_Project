import pandas as pd
from pathlib import Path

# ============================================================
# MARKET BASKET RECOMMENDATION ENGINE
# ============================================================

print("\n==============================================")
print("       MARKET BASKET RECOMMENDATION ENGINE")
print("==============================================\n")

# ------------------------------------------------------------
# File paths
# ------------------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent
DATASET_DIR = BASE_DIR.parent / "dataset"

RULES_FILE = DATASET_DIR / "readable_association_rules.csv"
OUTPUT_FILE = DATASET_DIR / "recommendations.csv"

# ------------------------------------------------------------
# Check file
# ------------------------------------------------------------

if not RULES_FILE.exists():
    raise FileNotFoundError(
        f"File not found:\n{RULES_FILE}\n\n"
        "Run product_mapping.py first."
    )

# ------------------------------------------------------------
# Load association rules
# ------------------------------------------------------------

rules = pd.read_csv(RULES_FILE)

print("Association rules loaded:", len(rules))

# ------------------------------------------------------------
# Check required columns
# ------------------------------------------------------------

required_columns = [
    "antecedent_codes",
    "antecedent_products",
    "consequent_codes",
    "consequent_products",
    "support",
    "confidence",
    "lift"
]

missing_columns = [
    column for column in required_columns
    if column not in rules.columns
]

if missing_columns:
    raise ValueError(
        f"Missing columns in readable_association_rules.csv: "
        f"{missing_columns}"
    )

# ------------------------------------------------------------
# Clean text columns
# ------------------------------------------------------------

text_columns = [
    "antecedent_codes",
    "antecedent_products",
    "consequent_codes",
    "consequent_products"
]

for column in text_columns:
    rules[column] = (
        rules[column]
        .fillna("")
        .astype(str)
        .str.strip()
    )

# ------------------------------------------------------------
# Numeric columns
# ------------------------------------------------------------

for column in ["support", "confidence", "lift"]:
    rules[column] = pd.to_numeric(
        rules[column],
        errors="coerce"
    )

rules = rules.dropna(
    subset=["support", "confidence", "lift"]
).copy()

# ------------------------------------------------------------
# Recommendation function
# ------------------------------------------------------------

def recommend_products(
    product_name,
    top_n=10,
    min_confidence=0.30,
    min_lift=1.0
):
    """
    Generate product recommendations using association rules.

    Parameters
    ----------
    product_name : str
        Product already purchased/selected by customer.

    top_n : int
        Number of recommendations to return.

    min_confidence : float
        Minimum confidence threshold.

    min_lift : float
        Minimum lift threshold.

    Returns
    -------
    DataFrame
        Recommended products with confidence, lift and support.
    """

    product_name = str(product_name).strip().upper()

    # --------------------------------------------------------
    # Find rules where selected product is in antecedent
    # --------------------------------------------------------

    matching_rules = rules[
        rules["antecedent_products"]
        .str.upper()
        .str.contains(
            product_name,
            regex=False,
            na=False
        )
    ].copy()

    # --------------------------------------------------------
    # Apply thresholds
    # --------------------------------------------------------

    matching_rules = matching_rules[
        (matching_rules["confidence"] >= min_confidence)
        &
        (matching_rules["lift"] >= min_lift)
    ].copy()

    if matching_rules.empty:
        return pd.DataFrame(
            columns=[
                "recommended_product",
                "support",
                "confidence",
                "lift"
            ]
        )

    # --------------------------------------------------------
    # Sort strongest recommendations first
    # --------------------------------------------------------

    matching_rules = matching_rules.sort_values(
        by=["lift", "confidence", "support"],
        ascending=False
    )

    # --------------------------------------------------------
    # Extract recommendations
    # --------------------------------------------------------

    recommendations = []

    for _, row in matching_rules.iterrows():

        consequent_products = str(
            row["consequent_products"]
        )

        products = [
            product.strip()
            for product in consequent_products.split("|")
            if product.strip()
        ]

        for product in products:

            # Do not recommend the same product
            if product.upper() == product_name:
                continue

            recommendations.append(
                {
                    "recommended_product": product,
                    "support": row["support"],
                    "confidence": row["confidence"],
                    "lift": row["lift"]
                }
            )

    # --------------------------------------------------------
    # Convert to DataFrame
    # --------------------------------------------------------

    recommendation_df = pd.DataFrame(
        recommendations
    )

    if recommendation_df.empty:
        return recommendation_df

    # --------------------------------------------------------
    # Remove duplicate recommendations
    # --------------------------------------------------------

    recommendation_df = (
        recommendation_df
        .sort_values(
            by=["lift", "confidence", "support"],
            ascending=False
        )
        .drop_duplicates(
            subset=["recommended_product"]
        )
        .head(top_n)
        .reset_index(drop=True)
    )

    return recommendation_df


# ============================================================
# TEST RECOMMENDATION ENGINE
# ============================================================

print("\n==============================================")
print("       TEST RECOMMENDATION")
print("==============================================")

test_product = "REGENCY TEA PLATE PINK"

print("\nSelected product:")
print(test_product)

recommendations = recommend_products(
    product_name=test_product,
    top_n=10,
    min_confidence=0.30,
    min_lift=1.0
)

# ------------------------------------------------------------
# Display recommendations
# ------------------------------------------------------------

if recommendations.empty:

    print("\nNo recommendations found.")

else:

    print("\nRecommended products:\n")

    print(
        recommendations.to_string(
            index=False
        )
    )

# ------------------------------------------------------------
# Save recommendations
# ------------------------------------------------------------

if not recommendations.empty:

    recommendations.insert(
        0,
        "input_product",
        test_product
    )

    recommendations.to_csv(
        OUTPUT_FILE,
        index=False
    )

    print("\n==============================================")
    print("Recommendation engine completed!")
    print("==============================================")

    print("\nSaved file:")
    print(OUTPUT_FILE)

else:

    print("\nNo recommendation file created.")