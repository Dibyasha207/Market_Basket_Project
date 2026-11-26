import pandas as pd


# ============================================================
# 1. LOAD DATASET
# ============================================================

df = pd.read_csv(
    "../dataset/cleaned_retail.csv",
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
    .str.upper()
    .str.strip()
)


# ============================================================
# 2. ONE PRODUCT PER SKU
# ============================================================

x = df.drop_duplicates(subset=["StockCode"]).copy()


# ============================================================
# 3. REMOVE NON-PRODUCT / SPECIAL CODES
# ============================================================

excluded_codes = {
    "POST",
    "DOT",
    "BANK CHARGES",
    "MANUAL",
    "AMAZONFEE",
    "SAMPLES",
    "ADJUST",
    "CRUK"
}

x = x[
    ~x["StockCode"].str.upper().isin(excluded_codes)
].copy()


# ============================================================
# 4. CATEGORY ASSIGNMENT
# ============================================================

assigned = pd.Series(
    "Others",
    index=x.index,
    dtype="object"
)

matched_count = pd.Series(
    0,
    index=x.index,
    dtype="int"
)


# ============================================================
# HELPER FUNCTION
# ============================================================

def apply_category(category, include_patterns, exclude_patterns=None):

    global assigned
    global matched_count

    if exclude_patterns is None:
        exclude_patterns = []

    include_pattern = "|".join(
        f"(?:{p})"
        for p in include_patterns
    )

    mask = x["Description"].str.contains(
        include_pattern,
        regex=True,
        na=False
    )

    if exclude_patterns:

        exclude_pattern = "|".join(
            f"(?:{p})"
            for p in exclude_patterns
        )

        exclude_mask = x["Description"].str.contains(
            exclude_pattern,
            regex=True,
            na=False
        )

        mask = mask & ~exclude_mask

    matched_count.loc[mask] += 1

    new_mask = mask & (assigned == "Others")

    assigned.loc[new_mask] = category


# ============================================================
# 5. BEVERAGES
# ============================================================
#
# Important:
# TEA TOWEL / TEA COSY / TEA MUG etc. should NOT become
# beverages.
# ============================================================

apply_category(
    "Beverages",

    include_patterns=[
        r"\bCOFFEE\b",
        r"\bTEA\b",
        r"\bJUICE\b",
        r"\bCOKE\b",
        r"\bCOLA\b",
        r"\bBEER\b",
        r"\bLEMONADE\b",
        r"\bSODA\b",
        r"\bMINERAL WATER\b",
        r"\bDRINK\b"
    ],

    exclude_patterns=[
        r"\bTEA TOWEL\b",
        r"\bTEA TOWELS\b",
        r"\bTEA COSY\b",
        r"\bTEA COZY\b",
        r"\bTEA MUG\b",
        r"\bTEA CUP\b",
        r"\bTEA SET\b",
        r"\bTEA TIME\b",
        r"\bCOFFEE MUG\b",
        r"\bCOFFEE CUP\b",
        r"\bCOFFEE SET\b",
        r"\bMUG\b",
        r"\bCUP\b",
        r"\bTOWEL\b",
        r"\bCOSY\b",
        r"\bCOZY\b",
        r"\bBOTTLE\b",
        r"\bSIGN\b"
    ]
)


# ============================================================
# 6. SNACKS
# ============================================================
#
# CHOCOLATE / SWEET etc. should only be classified as food
# when product description actually indicates food.
# ============================================================

apply_category(
    "Snacks",

    include_patterns=[
        r"\bCHIPS\b",
        r"\bBISCUIT\b",
        r"\bBISCUITS\b",
        r"\bCRISP\b",
        r"\bCRISPS\b",
        r"\bCHOCOLATE\b",
        r"\bCANDY\b",
        r"\bSWEET\b",
        r"\bTOFFEE\b",
        r"\bFUDGE\b",
        r"\bMARSHMALLOW\b"
    ],

    exclude_patterns=[
        r"\bCHOCOLATE.*SIGN\b",
        r"\bCHOCOLATE.*CANDLE\b",
        r"\bCHOCOLATE.*BOX.*RIBBON\b",
        r"\bCHOCOLATE.*RIBBON\b",
        r"\bCHOCOLATE.*CALCULATOR\b",
        r"\bCHOCOLATE.*MUG\b",
        r"\bCHOCOLATE.*TOWEL\b",
        r"\bCHOCOLATE.*FLANNEL\b",
        r"\bCHOCOLATE.*BAG\b",
        r"\bCHOCOLATE.*GIFT\b",
        r"\bCHOCOLATE.*DESIGN\b",
        r"\bCHOCOLATE.*SPOT\b",
        r"\bCHOCOLATE.*SPOTS\b",
        r"\bBISCUIT.*TIN\b",
        r"\bBISCUIT.*BOX\b",
        r"\bSWEET.*HOME\b",
        r"\bSWEET.*SIGN\b"
    ]
)


# ============================================================
# 7. DAIRY
# ============================================================

apply_category(
    "Dairy",

    include_patterns=[
        r"\bMILK\b",
        r"\bCHEESE\b",
        r"\bBUTTER\b",
        r"\bYOGHURT\b",
        r"\bYOGURT\b"
    ],

    exclude_patterns=[
        r"\bMILK.*JUG\b",
        r"\bMILK.*PAN\b",
        r"\bMILK.*BOTTLE\b",
        r"\bBUTTER.*DISH\b",
        r"\bBUTTER.*SIGN\b",
        r"\bCHEESE.*MAGNET\b",
        r"\bCHEESE.*SIGN\b",
        r"\bCHEESE.*DESIGN\b"
    ]
)


# ============================================================
# 8. BAKERY
# ============================================================

apply_category(
    "Bakery",

    include_patterns=[
        r"\bBREAD\b",
        r"\bMUFFIN\b",
        r"\bCROISSANT\b",
        r"\bBAGUETTE\b",
        r"\bBAKERY\b",
        r"\bCAKE\b",
        r"\bCAKES\b"
    ],

    exclude_patterns=[
        r"\bBREAD BIN\b",
        r"\bCAKE TIN\b",
        r"\bCAKE CASE\b",
        r"\bCAKE CASES\b",
        r"\bCAKE MONEY BANK\b",
        r"\bCAKE DECORATION\b",
        r"\bCAKE DESIGN\b",
        r"\bCAKE CANDLE\b",
        r"\bCAKE SIGN\b",
        r"\bCAKE TOWEL\b",
        r"\bCAKE CUSHION\b"
    ]
)


# ============================================================
# 9. PERSONAL CARE
# ============================================================

apply_category(
    "Personal Care",

    include_patterns=[
        r"\bSOAP\b",
        r"\bSHAMPOO\b",
        r"\bTOOTHPASTE\b",
        r"\bTOOTHBRUSH\b",
        r"\bLOTION\b",
        r"\bCOSMETIC\b",
        r"\bCOSMETICS\b",
        r"\bMAKEUP\b",
        r"\bPERFUME\b",
        r"\bLIP GLOSS\b",
        r"\bBATH SPONGE\b",
        r"\bBATH SALT\b",
        r"\bBODY LOTION\b",
        r"\bCREAM\b"
    ],

    exclude_patterns=[
        r"\bSOAP HOLDER\b",
        r"\bSOAP DISH\b",
        r"\bSOAP HOLDER\b",
        r"\bCREAM.*HANGER\b",
        r"\bCREAM.*FRAME\b",
        r"\bCREAM.*CUSHION\b",
        r"\bCREAM.*BOWL\b",
        r"\bCREAM.*JUG\b",
        r"\bICE CREAM\b"
    ]
)


# ============================================================
# 10. GROCERY
# ============================================================

apply_category(
    "Grocery",

    include_patterns=[
        r"\bRICE\b",
        r"\bFLOUR\b",
        r"\bSUGAR\b",
        r"\bPULSE\b",
        r"\bPULSES\b",
        r"\bCEREAL\b",
        r"\bPASTA\b",
        r"\bSPICE\b",
        r"\bSPICES\b",
        r"\bSAUCE\b",
        r"\bJAM\b",
        r"\bHONEY\b",
        r"\bCOOKING OIL\b"
    ],

    exclude_patterns=[
        r"\bJAM.*JAR\b",
        r"\bJAM.*CANDLE\b",
        r"\bJAM.*CLOCK\b",
        r"\bJAM.*MAGNET\b",
        r"\bJAM.*T-LIGHT\b",
        r"\bSUGAR.*BOWL\b",
        r"\bSUGAR.*JAR\b",
        r"\bSUGAR.*TIN\b",
        r"\bSPICE.*TIN\b",
        r"\bSPICE.*BOX\b"
    ]
)


# ============================================================
# 11. FRUITS & VEGETABLES
# ============================================================
#
# Very important:
# STRAWBERRY BAG / APPLE DESIGN / ORANGE CLOCK etc.
# should NOT become food.
# ============================================================

apply_category(
    "Fruits & Vegetables",

    include_patterns=[
        r"\bAPPLE\b",
        r"\bBANANA\b",
        r"\bORANGE\b",
        r"\bPEAR\b",
        r"\bPEARS\b",
        r"\bSTRAWBERRY\b",
        r"\bSTRAWBERRIES\b",
        r"\bFRUIT\b",
        r"\bFRUITS\b",
        r"\bVEGETABLE\b",
        r"\bVEGETABLES\b",
        r"\bCARROT\b",
        r"\bPOTATO\b",
        r"\bTOMATO\b"
    ],

    exclude_patterns=[
        r"\bAPPLE.*BAG\b",
        r"\bAPPLE.*DESIGN\b",
        r"\bAPPLE.*FRAME\b",
        r"\bAPPLE.*MUG\b",
        r"\bAPPLE.*BOX\b",
        r"\bAPPLE.*CLOCK\b",
        r"\bAPPLE.*CUSHION\b",
        r"\bAPPLE.*TOWEL\b",
        r"\bAPPLE.*SPONGE\b",
        r"\bORANGE.*CLOCK\b",
        r"\bORANGE.*DESIGN\b",
        r"\bORANGE.*SCENT\b",
        r"\bORANGE.*SQUEEZER\b",
        r"\bSTRAWBERRY.*BAG\b",
        r"\bSTRAWBERRY.*BOX\b",
        r"\bSTRAWBERRY.*MUG\b",
        r"\bSTRAWBERRY.*DESIGN\b",
        r"\bSTRAWBERRY.*MONEY\b",
        r"\bSTRAWBERRY.*TRINKET\b",
        r"\bSTRAWBERRY.*CERAMIC\b",
        r"\bSTRAWBERRY.*COASTER\b",
        r"\bFRUIT.*BAG\b",
        r"\bFRUIT.*BOX\b",
        r"\bFRUIT.*DESIGN\b",
        r"\bFRUIT.*MUG\b",
        r"\bFRUIT.*TOWEL\b",
        r"\bCARROT.*COASTER\b",
        r"\bCARROT.*DESIGN\b"
    ]
)


# ============================================================
# 12. FROZEN FOODS
# ============================================================
#
# ICE CREAM DESIGN / LIP GLOSS / PEN etc. are NOT food.
# ============================================================

apply_category(
    "Frozen Foods",

    include_patterns=[
        r"\bFROZEN\b",
        r"\bICE\s*CREAM\b",
        r"\bICECREAM\b"
    ],

    exclude_patterns=[
        r"\bICE CREAM.*DESIGN\b",
        r"\bICE CREAM.*PEN\b",
        r"\bICE CREAM.*LIP GLOSS\b",
        r"\bICE CREAM.*BAG\b",
        r"\bICE CREAM.*BUMBAG\b",
        r"\bICE CREAM.*PARASOL\b",
        r"\bICE CREAM.*CANDLE\b",
        r"\bICE CREAM.*TOY\b"
    ]
)


# ============================================================
# 13. HOUSEHOLD
# ============================================================
#
# Household is intentionally broad because the Online Retail
# dataset contains many home / gift / decorative products.
# ============================================================

apply_category(
    "Household",

    include_patterns=[
        r"\bLAMP\b",
        r"\bLIGHT\b",
        r"\bLIGHTS\b",
        r"\bT-LIGHT\b",
        r"\bCANDLE\b",
        r"\bCANDLES\b",
        r"\bLANTERN\b",
        r"\bDOORMAT\b",
        r"\bMUG\b",
        r"\bPLATE\b",
        r"\bPLATES\b",
        r"\bBOWL\b",
        r"\bBOWLS\b",
        r"\bTRAY\b",
        r"\bTRAYS\b",
        r"\bKITCHEN\b",
        r"\bBASKET\b",
        r"\bCLOCK\b",
        r"\bSIGN\b",
        r"\bFRAME\b",
        r"\bORNAMENT\b",
        r"\bJAR\b",
        r"\bSTORAGE\b",
        r"\bCUSHION\b",
        r"\bTOWEL\b",
        r"\bTOWELS\b",
        r"\bCUTLERY\b",
        r"\bCOAT RACK\b",
        r"\bCABINET\b",
        r"\bDRAWER\b",
        r"\bWASTEPAPER BIN\b",
        r"\bPAPER\b",
        r"\bGIFT\b",
        r"\bGARDEN\b",
        r"\bBAG\b",
        r"\bBOX\b",
        r"\bBOTTLE\b",
        r"\bBOTTLES\b",
        r"\bCOSY\b",
        r"\bCOZY\b",
        r"\bHAND WARMER\b",
        r"\bORNAMENT\b",
        r"\bDOOR SIGN\b",
        r"\bPARASOL\b",
        r"\bPHOTO\b",
        r"\bPICTURE\b",
        r"\bMONEY BOX\b",
        r"\bPIGGY BANK\b",
        r"\bJEWELLERY\b",
        r"\bJEWELRY\b",
        r"\bTOOL SET\b",
        r"\bSEWING BOX\b",
        r"\bLUNCH BOX\b",
        r"\bLUNCH BAG\b",
        r"\bSHOPPER BAG\b",
        r"\bJUMBO BAG\b",
        r"\bCHARLOTTE BAG\b",
        r"\bGIFT BAG\b"
    ],

    exclude_patterns=[
        r"\bBOTTLE.*BEVERAGE\b",
        r"\bBOTTLE.*JUICE\b",
        r"\bBOTTLE.*DRINK\b"
    ]
)


# ============================================================
# 14. ADDITIONAL HOUSEHOLD / GIFT PRODUCTS
# ============================================================
#
# These patterns specifically target many "Others" products
# visible in our previous preview.
# ============================================================

apply_category(
    "Household",

    include_patterns=[
        r"\bCOAT HANGER\b",
        r"\bHANGER\b",
        r"\bNESTING BOX\b",
        r"\bBUILDING BLOCK\b",
        r"\bBLOCK WORD\b",
        r"\bDOLL\b",
        r"\bJIGSAW\b",
        r"\bPUZZLE\b",
        r"\bPAINT SET\b",
        r"\bSTICKER\b",
        r"\bGIFT TAPE\b",
        r"\bPAPER CHAIN\b",
        r"\bPARASOL\b",
        r"\bSHOULDER BAG\b",
        r"\bSHOPPER\b",
        r"\bLUNCH BAG\b",
        r"\bLUNCH BOX\b",
        r"\bCUTLERY SET\b",
        r"\bTEASPOON\b",
        r"\bSPOON\b",
        r"\bCUP AND SAUCER\b",
        r"\bSAUCER\b",
        r"\bHOOK\b",
        r"\bPHOTO CLIP\b",
        r"\bEGG COSY\b",
        r"\bPIGGY BANK\b",
        r"\bMONEY BANK\b",
        r"\bMONEY BOX\b"
    ]
)


# ============================================================
# 15. CREATE FINAL RESULT
# ============================================================

result = pd.DataFrame({
    "StockCode": x["StockCode"],
    "Description": x["Description"],
    "Category": assigned
})


# ============================================================
# 16. SUMMARY
# ============================================================

print("\n==============================================")
print("       PRODUCT CATEGORY PREVIEW")
print("==============================================")

print(
    f"\nCandidate products: {len(result)}"
)


print("\nFINAL CATEGORY COUNTS:")

print(
    result["Category"]
    .value_counts()
    .to_string()
)


print(
    "\nMultiple category matches:",
    int((matched_count > 1).sum())
)


print(
    "Unmatched / Others:",
    int((assigned == "Others").sum())
)


# ============================================================
# 17. CATEGORY SAMPLES
# ============================================================

print("\n==============================================")
print("       SAMPLE PRODUCTS BY CATEGORY")
print("==============================================")


categories = [
    "Beverages",
    "Snacks",
    "Dairy",
    "Bakery",
    "Personal Care",
    "Grocery",
    "Fruits & Vegetables",
    "Frozen Foods",
    "Household",
    "Others"
]


for category in categories:

    print(f"\n--- {category} ---")

    sample = result[
        result["Category"] == category
    ][
        ["StockCode", "Description"]
    ].head(15)

    if len(sample) == 0:
        print("No products found.")
    else:
        print(
            sample.to_string(index=False)
        )


# ============================================================
# 18. MULTIPLE MATCH PRODUCTS
# ============================================================

multiple = result[
    matched_count > 1
][
    ["StockCode", "Description", "Category"]
]


print("\n==============================================")
print("       MULTIPLE MATCH PRODUCTS")
print("==============================================")


if len(multiple) == 0:
    print("No multiple-match products found.")
else:
    print(
        multiple.head(50)
        .to_string(index=False)
    )


# ============================================================
# 19. OTHERS SAMPLE
# ============================================================

others = result[
    result["Category"] == "Others"
][
    ["StockCode", "Description"]
]


print("\n==============================================")
print("       UNMATCHED / OTHERS SAMPLE")
print("==============================================")


if len(others) == 0:
    print("No Others products found.")
else:
    print(
        others.head(100)
        .to_string(index=False)
    )


# ============================================================
# 20. SAVE PREVIEW
# ============================================================

result.to_csv(
    "category_preview_result.csv",
    index=False
)


print("\n==============================================")
print("Preview saved as:")
print("category_preview_result.csv")
print("==============================================")