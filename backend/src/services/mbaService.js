const mbaRepository = require("../repositories/mbaRepository");

/**
 * ============================================================
 * MARKET BASKET ANALYSIS SERVICE
 * ============================================================
 * Pair-based Association Rule Mining (V1)
 *
 * This service:
 * - Reads transaction data from repository
 * - Mines 1-item and 2-item itemsets
 * - Generates A -> B and B -> A rules
 * - Calculates support, confidence, lift, conviction
 * - Generates dashboard KPIs
 * - Generates combinations, charts, network, rules and bundles
 *
 * IMPORTANT:
 * Response field names are aligned with the frontend mbaAdapter.js
 * ============================================================
 */


/* ============================================================
   RECOMMENDATION STRENGTH
   ============================================================ */

const getRecommendationStrength = (lift) => {
  if (lift >= 3) return "Very Strong";
  if (lift >= 2) return "Strong";
  if (lift >= 1.5) return "Medium";
  return "Weak";
};


/* ============================================================
   COUNT ITEMSETS
   ============================================================ */

const countItemsets = (transactions) => {
  const counts = new Map();

  transactions.forEach((items) => {
    // Remove duplicates inside one transaction
    const uniqueItems = [...new Set(items)];

    /* ---------------------------
       1-itemsets
    --------------------------- */

    uniqueItems.forEach((item) => {
      const key = `${item}`;

      counts.set(
        key,
        (counts.get(key) || 0) + 1
      );
    });


    /* ---------------------------
       2-itemsets
    --------------------------- */

    for (let i = 0; i < uniqueItems.length; i++) {
      for (let j = i + 1; j < uniqueItems.length; j++) {

        const key = [
          uniqueItems[i],
          uniqueItems[j]
        ]
          .sort((a, b) => Number(a) - Number(b))
          .join(",");

        counts.set(
          key,
          (counts.get(key) || 0) + 1
        );
      }
    }
  });

  return counts;
};


/* ============================================================
   GENERATE ASSOCIATION RULES
   ============================================================ */

const generateRules = (
  itemCounts,
  totalTransactions,
  minSupport,
  minConfidence
) => {

  const rules = [];

  const minSupportCount = Math.ceil(
    totalTransactions * minSupport
  );


  itemCounts.forEach((count, key) => {

    const items = key
      .split(",")
      .map(Number);

    // V1 = only 2-item rules
    if (items.length !== 2) return;

    // Apply minimum support
    if (count < minSupportCount) return;


    const [a, b] = items;

    const aCount =
      itemCounts.get(`${a}`) || 0;

    const bCount =
      itemCounts.get(`${b}`) || 0;


    const support =
      count / totalTransactions;


    /* ========================================================
       A -> B
       ======================================================== */

    const confidenceAB =
      aCount > 0
        ? count / aCount
        : 0;


    if (confidenceAB >= minConfidence) {

      const pB =
        bCount / totalTransactions;

      const lift =
        pB > 0
          ? confidenceAB / pB
          : 0;


      const conviction =
        confidenceAB < 1 && pB < 1
          ? (1 - pB) / (1 - confidenceAB)
          : confidenceAB === 1
            ? Infinity
            : 0;


      rules.push({
        antecedent: [a],
        consequent: [b],
        support,
        confidence: confidenceAB,
        lift,
        conviction
      });
    }


    /* ========================================================
       B -> A
       ======================================================== */

    const confidenceBA =
      bCount > 0
        ? count / bCount
        : 0;


    if (confidenceBA >= minConfidence) {

      const pA =
        aCount / totalTransactions;

      const lift =
        pA > 0
          ? confidenceBA / pA
          : 0;


      const conviction =
        confidenceBA < 1 && pA < 1
          ? (1 - pA) / (1 - confidenceBA)
          : confidenceBA === 1
            ? Infinity
            : 0;


      rules.push({
        antecedent: [b],
        consequent: [a],
        support,
        confidence: confidenceBA,
        lift,
        conviction
      });
    }
  });


  return rules;
};


/* ============================================================
   CORE MINING FUNCTION
   ============================================================ */

const runMining = async (
  filters = {},
  options = {}
) => {

  const {
    minSupport = 0.01,
    minConfidence = 0.10
  } = options;


  if (
    minSupport < 0 ||
    minSupport > 1
  ) {
    throw new Error(
      "Invalid mining parameters: minSupport must be between 0 and 1"
    );
  }


  if (
    minConfidence < 0 ||
    minConfidence > 1
  ) {
    throw new Error(
      "Invalid mining parameters: minConfidence must be between 0 and 1"
    );
  }


  const [
    transactionsData,
    products,
    categories
  ] = await Promise.all([

    mbaRepository.getTransactionsWithFilters(filters),

    mbaRepository.getAllProducts(),

    mbaRepository.getAllCategories()
  ]);


  if (
    !transactionsData ||
    transactionsData.length === 0
  ) {
    throw new Error(
      "No transactions found for given filters"
    );
  }


  /* ==========================================================
     CLEAN TRANSACTIONS
     ========================================================== */

  const transactions = transactionsData
    .map((transaction) => {

      const items =
        Array.isArray(transaction.items)
          ? transaction.items
          : [];

      return [
        ...new Set(
          items.filter(
            (id) =>
              id !== null &&
              id !== undefined
          )
        )
      ];
    })
    .filter(
      (items) => items.length > 0
    );


  if (transactions.length === 0) {
    throw new Error(
      "No valid transactions after filtering"
    );
  }


  const totalTransactions =
    transactions.length;


  /* ==========================================================
     PRODUCT MAP
     ========================================================== */

  const productMap = new Map();

  products.forEach((product) => {

    productMap.set(
      Number(product.productId),
      {
        name: product.productName,
        categoryId: product.categoryId
      }
    );
  });


  /* ==========================================================
     CATEGORY MAP
     ========================================================== */

  const categoryMap = new Map();

  categories.forEach((category) => {

    categoryMap.set(
      Number(category.categoryId),
      category.categoryName
    );
  });


  /* ==========================================================
     COUNT ITEMSETS
     ========================================================== */

  const itemCounts =
    countItemsets(transactions);


  /* ==========================================================
     GENERATE RULES
     ========================================================== */

  const rules =
    generateRules(
      itemCounts,
      totalTransactions,
      minSupport,
      minConfidence
    );


  /* ==========================================================
     FREQUENT ITEMSETS
     ========================================================== */

  const minSupportCount =
    Math.ceil(
      totalTransactions * minSupport
    );


  const frequentItemsets =
    Array.from(itemCounts.entries())

      .filter(
        ([, count]) =>
          count >= minSupportCount
      )

      .map(
        ([key, count]) => ({

          itemset:
            key
              .split(",")
              .map(Number),

          support:
            count / totalTransactions
        })
      );


  return {

    rules,

    frequentItemsets,

    totalTransactions,

    productMap,

    categoryMap,

    itemCounts,

    transactions,

    minSupport,

    minConfidence
  };
};


/* ============================================================
   SERVICE
   ============================================================ */

const mbaService = {


  /* ==========================================================
     KPI
     ========================================================== */

  getKPIs: async (
    filters = {},
    options = {}
  ) => {

    const {
      rules,
      frequentItemsets
    } = await runMining(
      filters,
      options
    );


    const avgLift =
      rules.length > 0

        ? rules.reduce(
            (sum, rule) =>
              sum + rule.lift,
            0
          ) / rules.length

        : 0;


    const avgConfidence =
      rules.length > 0

        ? rules.reduce(
            (sum, rule) =>
              sum + rule.confidence,
            0
          ) / rules.length

        : 0;


    /* ========================================================
       Strong cross-sell opportunities
       Definition:
       lift >= 2
       ======================================================== */

    const strongCrossSell =
      rules.filter(
        (rule) =>
          rule.lift >= 2
      ).length;


    return {

      // Frontend adapter expects snake_case
      total_rules: rules.length,

      avg_lift:
        Number(
          avgLift.toFixed(3)
        ),

      avg_confidence:
        Number(
          (
            avgConfidence * 100
          ).toFixed(2)
        ),

      frequent_itemsets:
        frequentItemsets.length,

      strong_cross_sell:
        strongCrossSell,


      /* ======================================================
         Changes / trends
         Historical 7-day comparison requires historical
         aggregation. Until that is implemented, these remain 0.
         ====================================================== */

      total_rules_change: 0,

      avg_lift_change: 0,

      avg_confidence_change: 0,

      frequent_itemsets_change: 0,

      strong_cross_sell_change: 0,


      trends: {

        rules: [],

        lift: [],

        confidence: [],

        itemsets: [],

        crossSell: []
      }
    };
  },


  /* ==========================================================
     TOP PRODUCT COMBINATIONS
     ========================================================== */

  getTopCombinations: async (
    filters = {},
    options = {},
    limit = 10
  ) => {

    const {
      itemCounts,
      totalTransactions,
      productMap,
      minSupport
    } = await runMining(
      filters,
      options
    );


    const minSupportCount =
      Math.ceil(
        totalTransactions *
        minSupport
      );


    const combinations = [];


    itemCounts.forEach(
      (count, key) => {

        const items =
          key
            .split(",")
            .map(Number);


        if (
          items.length !== 2 ||
          count < minSupportCount
        ) {
          return;
        }


        const productNames =
          items.map(
            (id) =>
              productMap.get(id)?.name ||
              `Product ${id}`
          );


        combinations.push({

          products: productNames,

          support:
            Number(
              (
                count /
                totalTransactions
              ).toFixed(4)
            )
        });
      }
    );


    return combinations

      .sort(
        (a, b) =>
          b.support - a.support
      )

      .slice(0, limit)

      .map(
        (item, index) => ({

          rank: index + 1,

          products:
            item.products,

          support:
            item.support
        })
      );
  },


  /* ==========================================================
     SUPPORT VS CONFIDENCE
     ========================================================== */

  getSupportConfidenceData: async (
    filters = {},
    options = {}
  ) => {

    const {
      rules,
      productMap
    } = await runMining(
      filters,
      options
    );


    return rules.map(
      (rule) => ({

        antecedent:
          rule.antecedent.map(
            (id) =>
              productMap.get(id)?.name ||
              `Product ${id}`
          ).join(", "),

        consequent:
          rule.consequent.map(
            (id) =>
              productMap.get(id)?.name ||
              `Product ${id}`
          ).join(", "),

        support:
          Number(
            rule.support.toFixed(4)
          ),

        confidence:
          Number(
            rule.confidence.toFixed(4)
          ),

        lift:
          Number(
            rule.lift.toFixed(3)
          )
      })
    );
  },


  /* ==========================================================
     LIFT DISTRIBUTION
     ========================================================== */

  getLiftDistribution: async (
    filters = {},
    options = {}
  ) => {

    const { rules } =
      await runMining(
        filters,
        options
      );


    const buckets = {

      "0-1": 0,

      "1-2": 0,

      "2-3": 0,

      "3-5": 0,

      "5+": 0
    };


    rules.forEach(
      (rule) => {

        if (rule.lift < 1) {

          buckets["0-1"]++;

        } else if (rule.lift < 2) {

          buckets["1-2"]++;

        } else if (rule.lift < 3) {

          buckets["2-3"]++;

        } else if (rule.lift < 5) {

          buckets["3-5"]++;

        } else {

          buckets["5+"]++;
        }
      }
    );


    return Object.entries(
      buckets
    ).map(
      ([range, count]) => ({

        range,

        count
      })
    );
  },


  /* ==========================================================
     PRODUCT RELATIONSHIP NETWORK
     ========================================================== */

  getProductNetwork: async (
    filters = {},
    options = {}
  ) => {

    const {
      rules,
      productMap,
      categoryMap
    } = await runMining(
      filters,
      options
    );


    const topRules =
      [...rules]
        .sort(
          (a, b) =>
            b.lift - a.lift
        )
        .slice(0, 100);


    const nodeIds =
      new Set();


    const nodes = [];

    const edges = [];


    topRules.forEach(
      (rule) => {

        const allIds = [
          ...rule.antecedent,
          ...rule.consequent
        ];


        allIds.forEach(
          (id) => {

            if (
              nodeIds.has(id)
            ) {
              return;
            }


            nodeIds.add(id);


            const product =
              productMap.get(id);


            nodes.push({

              id,

              name:
                product?.name ||
                `Product ${id}`,

              category:
                categoryMap.get(
                  Number(
                    product?.categoryId
                  )
                ) || "Uncategorized"
            });
          }
        );


        edges.push({

          source:
            rule.antecedent[0],

          target:
            rule.consequent[0],

          lift:
            Number(
              rule.lift.toFixed(3)
            ),

          confidence:
            Number(
              rule.confidence.toFixed(4)
            )
        });
      }
    );


    return {

      nodes,

      edges
    };
  },


  /* ==========================================================
     ASSOCIATION RULES
     ========================================================== */

  getRules: async (
    filters = {},
    options = {}
  ) => {

    const {

      minSupport = 0.01,

      minConfidence = 0.10,

      liftMin = 0,

      liftMax = Infinity,

      search = "",

      page = 1,

      limit = 20

    } = options;


    const {
      rules,
      productMap
    } = await runMining(
      filters,
      {
        minSupport,
        minConfidence
      }
    );


    let mappedRules =
      rules.map(
        (rule, index) => {

          const antecedentNames =
            rule.antecedent.map(
              (id) =>
                productMap.get(id)?.name ||
                `Product ${id}`
            );


          const consequentNames =
            rule.consequent.map(
              (id) =>
                productMap.get(id)?.name ||
                `Product ${id}`
            );


          return {

            id: index + 1,

            antecedent:
              antecedentNames.join(", "),

            consequent:
              consequentNames.join(", "),

            support:
              Number(
                rule.support.toFixed(4)
              ),

            confidence:
              Number(
                rule.confidence.toFixed(4)
              ),

            lift:
              Number(
                rule.lift.toFixed(3)
              ),

            conviction:
              Number.isFinite(
                rule.conviction
              )
                ? Number(
                    rule.conviction.toFixed(3)
                  )
                : null,

            strength:
              getRecommendationStrength(
                rule.lift
              )
          };
        }
      );


    /* ========================================================
       LIFT FILTER
       ======================================================== */

    mappedRules =
      mappedRules.filter(
        (rule) =>
          rule.lift >= liftMin &&
          rule.lift <= liftMax
      );


    /* ========================================================
       SEARCH
       ======================================================== */

    if (search) {

      const q =
        search
          .toLowerCase()
          .trim();


      mappedRules =
        mappedRules.filter(
          (rule) =>

            rule.antecedent
              .toLowerCase()
              .includes(q)

            ||

            rule.consequent
              .toLowerCase()
              .includes(q)
        );
    }


    /* ========================================================
       PAGINATION
       ======================================================== */

    const total =
      mappedRules.length;


    const totalPages =
      Math.max(
        1,
        Math.ceil(
          total / limit
        )
      );


    const safePage =
      Math.min(
        Math.max(
          Number(page) || 1,
          1
        ),
        totalPages
      );


    const start =
      (safePage - 1) * limit;


    const paginated =
      mappedRules.slice(
        start,
        start + limit
      );


    /*
     * IMPORTANT:
     * Frontend mbaAdapter expects:
     *
     * response.data
     * response.pagination
     *
     * So controller's:
     *
     * { success:true, data: result }
     *
     * becomes:
     *
     * result.data
     */

    return {

      data: paginated,

      pagination: {

        page: safePage,

        limit,

        total,

        totalPages
      }
    };
  },


  /* ==========================================================
     RECOMMENDED PRODUCT BUNDLES
     ========================================================== */

  getBundles: async (
    filters = {},
    options = {}
  ) => {

    const {
      rules,
      productMap
    } = await runMining(
      filters,
      options
    );


    const topRules =
      rules

        .filter(
          (rule) =>
            rule.lift > 1
        )

        .sort(
          (a, b) =>
            b.lift - a.lift
        )

        .slice(0, 10);


    return topRules.map(
      (rule, index) => {

        const products = [
          ...rule.antecedent,
          ...rule.consequent
        ].map(
          (id) =>
            productMap.get(id)?.name ||
            `Product ${id}`
        );


        const strength =
          getRecommendationStrength(
            rule.lift
          );


        return {

          id: index + 1,

          name:
            products.join(" + "),

          products,

          lift:
            Number(
              rule.lift.toFixed(3)
            ),

          confidence:
            Number(
              rule.confidence.toFixed(4)
            ),

          expected_revenue_increase:
            null,

          tag:
            strength
        };
      }
    );
  },


  /* ==========================================================
     BUSINESS INSIGHTS
     ========================================================== */

  getInsights: async (
    filters = {},
    options = {}
  ) => {

    const {
      rules,
      productMap
    } = await runMining(
      filters,
      options
    );


    if (!rules.length) {
      return [];
    }


    /* ========================================================
       Top lift rule
       ======================================================== */

    const topLiftRule =
      [...rules].sort(
        (a, b) =>
          b.lift - a.lift
      )[0];


    /* ========================================================
       Top confidence rule
       ======================================================== */

    const topConfidenceRule =
      [...rules].sort(
        (a, b) =>
          b.confidence -
          a.confidence
      )[0];


    /* ========================================================
       Strong rule count
       ======================================================== */

    const strongRules =
      rules.filter(
        (rule) =>
          rule.lift >= 2
      );


    const getProductName =
      (id) =>
        productMap.get(id)?.name ||
        `Product ${id}`;


    const topLiftProducts =
      [
        ...topLiftRule.antecedent,
        ...topLiftRule.consequent
      ].map(getProductName);


    const topConfidenceProducts =
      [
        ...topConfidenceRule.antecedent,
        ...topConfidenceRule.consequent
      ].map(getProductName);


    const insights = [];


    /* ========================================================
       INSIGHT 1 - Highest Lift
       ======================================================== */

    insights.push({

      id: 1,

      title:
        "Strongest Product Association",

      description:
        `${topLiftProducts.join(
          " + "
        )} shows the highest association strength with a lift of ${topLiftRule.lift.toFixed(
          2
        )}. This combination can be considered for cross-selling or bundle recommendations.`,

      category:
        "Cross-Sell",

      impact:
        topLiftRule.lift >= 3
          ? "High"
          : "Medium",

      created_at:
        new Date().toISOString()
    });


    /* ========================================================
       INSIGHT 2 - Highest Confidence
       ======================================================== */

    insights.push({

      id: 2,

      title:
        "High Confidence Recommendation",

      description:
        `Customers purchasing ${topConfidenceProducts[0]} show a ${(topConfidenceRule.confidence * 100).toFixed(
          1
        )}% confidence of purchasing the associated product. This can support targeted recommendations.`,

      category:
        "Recommendation",

      impact:
        topConfidenceRule.confidence >= 0.75
          ? "High"
          : "Medium",

      created_at:
        new Date().toISOString()
    });


    /* ========================================================
       INSIGHT 3 - Strong Rule Opportunities
       ======================================================== */

    insights.push({

      id: 3,

      title:
        "Cross-Sell Opportunities",

      description:
        `${strongRules.length} association rules have a lift of 2 or higher, indicating potentially strong product relationships.`,

      category:
        "Cross-Sell",

      impact:
        strongRules.length > 0
          ? "High"
          : "Low",

      created_at:
        new Date().toISOString()
    });


    return insights;
  },


  /* ==========================================================
     FILTER METADATA
     ========================================================== */

  getFilters: async () => {

    const [
      countries,
      categories,
      dateRange
    ] = await Promise.all([

      mbaRepository.getAllCountries(),

      mbaRepository.getAllCategories(),

      mbaRepository.getDateRange()
    ]);


    return {

      countries:
        countries.map(
          (country) =>
            country.country
        ),

      categories:
        categories.map(
          (category) =>
            category.categoryName
        ),

      dateRange: {

        min:
          dateRange?.minDate || null,

        max:
          dateRange?.maxDate || null
      }
    };
  }
};


module.exports = mbaService;