import pandas as pd
from pathlib import Path

# ============================================================
# PRODUCT MAPPING
# Converts product codes in association rules into readable
# product descriptions using the cleaned retail dataset.
# ============================================================

print("\n==============================================")
print("       PRODUCT MAPPING")
print("==============================================\n")

# ------------------------------------------------------------
# File paths
# ------------------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent
DATASET_DIR = BASE_DIR.parent / "dataset"

CLEANED_FILE = DATASET_DIR / "cleaned_retail.csv"
RULES_FILE = DATASET_DIR / "association_rules.csv"
OUTPUT_FILE = DATASET_DIR / "readable_association_rules.csv"

# ------------------------------------------------------------
# Check required files
# ------------------------------------------------------------

if not CLEANED_FILE.exists():
    raise FileNotFoundError(f"Missing file: {CLEANED_FILE}")

if not RULES_FILE.exists():
    raise FileNotFoundError(f"Missing file: {RULES_FILE}")

# ------------------------------------------------------------
# Load product information
# ------------------------------------------------------------

df = pd.read_csv(
    CLEANED_FILE,
    usecols=["StockCode", "Description"]
)

df["StockCode"] = (
    df["StockCode"]
    .astype(str)
    .str.strip()
)

df["Description"] = (
    df["Description"]
    .fillna("")
    .astype(str)
    .str.strip()
)

# One description per StockCode
product_map = (
    df.drop_duplicates(subset=["StockCode"])
      .set_index("StockCode")["Description"]
      .to_dict()
)

print("Unique product mappings:", len(product_map))

# ------------------------------------------------------------
# Load association rules
# ------------------------------------------------------------

rules = pd.read_csv(RULES_FILE)

print("Association rules loaded:", len(rules))

required_columns = [
    "antecedents",
    "consequents",
    "support",
    "confidence",
    "lift"
]

missing = [col for col in required_columns if col not in rules.columns]

if missing:
    raise ValueError(
        f"Missing required columns in association_rules.csv: {missing}"
    )

# ------------------------------------------------------------
# Helper function
# ------------------------------------------------------------

def clean_item(item):
    """
    Convert an item representation into a clean StockCode.
    Handles values such as:
        85123A
        frozenset({'85123A'})
        {'85123A'}
    """
    item = str(item).strip()

    item = item.replace("frozenset({", "")
    item = item.replace("frozenset([", "")
    item = item.replace("{", "")
    item = item.replace("}", "")
    item = item.replace("[", "")
    item = item.replace("]", "")
    item = item.replace("'", "")
    item = item.replace('"', "")

    return item.strip()


def parse_items(value):
    """
    Convert an antecedent/consequent value into a list of
    StockCodes.
    """
    value = str(value).strip()

    value = value.replace("frozenset({", "")
    value = value.replace("frozenset([", "")
    value = value.replace("{", "")
    value = value.replace("}", "")
    value = value.replace("[", "")
    value = value.replace("]", "")
    value = value.replace("'", "")
    value = value.replace('"', "")

    if not value.strip():
        return []

    return [
        clean_item(x)
        for x in value.split(",")
        if clean_item(x)
    ]


def codes_to_names(value):
    """
    Convert a set/list of product codes into readable
    product descriptions.
    """
    codes = parse_items(value)

    names = []

    for code in codes:
        description = product_map.get(code)

        if description:
            names.append(description)
        else:
            names.append(f"Unknown Product ({code})")

    return " | ".join(names)


# ------------------------------------------------------------
# Create readable columns
# ------------------------------------------------------------

rules["antecedent_codes"] = rules["antecedents"].apply(
    lambda x: ", ".join(parse_items(x))
)

rules["consequent_codes"] = rules["consequents"].apply(
    lambda x: ", ".join(parse_items(x))
)

rules["antecedent_products"] = rules["antecedents"].apply(
    codes_to_names
)

rules["consequent_products"] = rules["consequents"].apply(
    codes_to_names
)

# ------------------------------------------------------------
# Round numerical values
# ------------------------------------------------------------

rules["support"] = rules["support"].round(4)
rules["confidence"] = rules["confidence"].round(4)
rules["lift"] = rules["lift"].round(4)

# ------------------------------------------------------------
# Keep useful columns
# ------------------------------------------------------------

readable_rules = rules[
    [
        "antecedent_codes",
        "antecedent_products",
        "consequent_codes",
        "consequent_products",
        "support",
        "confidence",
        "lift"
    ]
].copy()

# ------------------------------------------------------------
# Sort by strongest recommendations
# ------------------------------------------------------------

readable_rules = readable_rules.sort_values(
    by=["lift", "confidence"],
    ascending=False
)

# ------------------------------------------------------------
# Save result
# ------------------------------------------------------------

readable_rules.to_csv(
    OUTPUT_FILE,
    index=False
)

# ------------------------------------------------------------
# Display result
# ------------------------------------------------------------

print("\n==============================================")
print("       READABLE ASSOCIATION RULES")
print("==============================================\n")

print("Total readable rules:", len(readable_rules))

print("\nTop 20 rules:\n")

display_columns = [
    "antecedent_products",
    "consequent_products",
    "support",
    "confidence",
    "lift"
]

print(
    readable_rules[display_columns]
    .head(20)
    .to_string(index=False)
)

print("\n==============================================")
print("Product mapping completed!")
print("==============================================")

print("\nSaved file:")
print(OUTPUT_FILE)