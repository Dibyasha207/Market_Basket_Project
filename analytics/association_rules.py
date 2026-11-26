import pandas as pd
from mlxtend.frequent_patterns import association_rules


# ============================================================
# ASSOCIATION RULE MINING
# ============================================================

print("\n==============================================")
print("       ASSOCIATION RULE MINING")
print("==============================================\n")


# ------------------------------------------------------------
# 1. Load frequent itemsets
# ------------------------------------------------------------

INPUT_FILE = "../dataset/frequent_itemsets.csv"
OUTPUT_FILE = "../dataset/association_rules.csv"

frequent_itemsets = pd.read_csv(INPUT_FILE)


print("Frequent itemsets loaded:", len(frequent_itemsets))
print("Columns:")
print(frequent_itemsets.columns.tolist())


# ------------------------------------------------------------
# 2. Convert itemsets back to frozenset
# ------------------------------------------------------------

def parse_itemset(value):
    """
    Convert CSV string representation of a frozenset
    back into a Python frozenset.
    """

    value = str(value).strip()

    # Example:
    # "frozenset({'85123A', '22423'})"

    if value.startswith("frozenset("):
        value = value[len("frozenset("):-1]

    value = value.strip("{}")

    if not value:
        return frozenset()

    items = []

    for item in value.split(","):
        item = item.strip()
        item = item.strip("'")
        item = item.strip('"')

        if item:
            items.append(item)

    return frozenset(items)


frequent_itemsets["itemsets"] = (
    frequent_itemsets["itemsets"]
    .apply(parse_itemset)
)


# ------------------------------------------------------------
# 3. Ensure support is numeric
# ------------------------------------------------------------

frequent_itemsets["support"] = pd.to_numeric(
    frequent_itemsets["support"],
    errors="coerce"
)

frequent_itemsets = frequent_itemsets.dropna(
    subset=["support"]
).copy()


print("\nParsed frequent itemsets:")
print(frequent_itemsets.head(10).to_string(index=False))


# ------------------------------------------------------------
# 4. Generate association rules
# ------------------------------------------------------------

print("\nGenerating association rules...")


rules = association_rules(
    frequent_itemsets,
    metric="confidence",
    min_threshold=0.20
)


# ------------------------------------------------------------
# 5. Handle mlxtend version differences
# ------------------------------------------------------------

# Some mlxtend versions do not return
# antecedent_support / consequent_support.
#
# We calculate them ourselves from the frequent itemsets.

support_lookup = {
    frozenset(itemset): support
    for itemset, support in zip(
        frequent_itemsets["itemsets"],
        frequent_itemsets["support"]
    )
}


rules["antecedent_support"] = rules["antecedents"].apply(
    lambda x: support_lookup.get(frozenset(x), 0)
)


rules["consequent_support"] = rules["consequents"].apply(
    lambda x: support_lookup.get(frozenset(x), 0)
)


# ------------------------------------------------------------
# 6. Add readable product lists
# ------------------------------------------------------------

rules["antecedents"] = rules["antecedents"].apply(
    lambda x: ", ".join(sorted(map(str, x)))
)

rules["consequents"] = rules["consequents"].apply(
    lambda x: ", ".join(sorted(map(str, x)))
)


# ------------------------------------------------------------
# 7. Add rule sizes
# ------------------------------------------------------------

rules["antecedent_size"] = rules["antecedents"].apply(
    lambda x: len(x.split(", "))
    if x
    else 0
)

rules["consequent_size"] = rules["consequents"].apply(
    lambda x: len(x.split(", "))
    if x
    else 0
)


# ------------------------------------------------------------
# 8. Keep useful columns
# ------------------------------------------------------------

wanted_columns = [
    "antecedents",
    "consequents",
    "antecedent_support",
    "consequent_support",
    "support",
    "confidence",
    "lift",
    "leverage",
    "conviction",
    "antecedent_size",
    "consequent_size"
]


# Only keep columns that actually exist
available_columns = [
    col for col in wanted_columns
    if col in rules.columns
]


rules = rules[available_columns]


# ------------------------------------------------------------
# 9. Remove weak / invalid rules
# ------------------------------------------------------------

rules = rules[
    (rules["confidence"] >= 0.20) &
    (rules["lift"] > 1)
].copy()


# ------------------------------------------------------------
# 10. Sort by lift
# ------------------------------------------------------------

rules = rules.sort_values(
    by=["lift", "confidence", "support"],
    ascending=False
)


# ------------------------------------------------------------
# 11. Round numerical values
# ------------------------------------------------------------

numeric_columns = [
    "antecedent_support",
    "consequent_support",
    "support",
    "confidence",
    "lift",
    "leverage",
    "conviction"
]


for col in numeric_columns:
    if col in rules.columns:
        rules[col] = rules[col].round(4)


# ------------------------------------------------------------
# 12. Display result
# ------------------------------------------------------------

print("\n==============================================")
print("       ASSOCIATION RULE RESULT")
print("==============================================\n")

print("Total association rules:", len(rules))

print("\nTop association rules:")

if len(rules) > 0:

    display_columns = [
        "antecedents",
        "consequents",
        "support",
        "confidence",
        "lift"
    ]

    print(
        rules[display_columns]
        .head(30)
        .to_string(index=False)
    )

else:

    print("No rules found with current thresholds.")


# ------------------------------------------------------------
# 13. Save results
# ------------------------------------------------------------

rules.to_csv(
    OUTPUT_FILE,
    index=False
)


print("\n==============================================")
print("Association rule mining completed!")
print("==============================================")

print("\nSaved file:")
print(OUTPUT_FILE)