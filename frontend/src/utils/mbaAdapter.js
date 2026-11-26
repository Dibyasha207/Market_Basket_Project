export const adaptKPIs = (response) => {
  const d = response?.data ?? {};

  return {
    totalRules: {
      value: Number(
        d.total_rules ??
        d.totalAssociationRules ??
        0
      ),
      changePercentage: Number(
        d.total_rules_change ??
        d.totalAssociationRulesChange ??
        0
      ),
      trend: Array.isArray(d.trends?.rules)
        ? d.trends.rules
        : [],
    },

    avgLift: {
      value: Number(
        d.avg_lift ??
        d.avgLift ??
        0
      ),
      changePercentage: Number(
        d.avg_lift_change ??
        d.avgLiftChange ??
        0
      ),
      trend: Array.isArray(d.trends?.lift)
        ? d.trends.lift
        : [],
    },

    avgConfidence: {
      value: Number(
        d.avg_confidence ??
        d.avgConfidence ??
        0
      ),
      changePercentage: Number(
        d.avg_confidence_change ??
        d.avgConfidenceChange ??
        0
      ),
      trend: Array.isArray(d.trends?.confidence)
        ? d.trends.confidence
        : [],
    },

    frequentItemsets: {
      value: Number(
        d.frequent_itemsets ??
        d.frequentItemsets ??
        0
      ),
      changePercentage: Number(
        d.frequent_itemsets_change ??
        d.frequentItemsetsChange ??
        0
      ),
      trend: Array.isArray(d.trends?.itemsets)
        ? d.trends.itemsets
        : [],
    },

    strongCrossSell: {
      value: Number(
        d.strong_cross_sell ??
        d.crossSellOpportunities ??
        d.strongCrossSell ??
        0
      ),
      changePercentage: Number(
        d.strong_cross_sell_change ??
        d.crossSellOpportunitiesChange ??
        d.strongCrossSellChange ??
        0
      ),
      trend: Array.isArray(d.trends?.crossSell)
        ? d.trends.crossSell
        : [],
    },
  };
};


/* =========================================================
   TOP COMBINATIONS ADAPTER
   ========================================================= */

export const adaptTopCombinations = (response) => {
  const rows = response?.data ?? [];

  if (!Array.isArray(rows)) {
    return [];
  }

  return rows.map((row, index) => {
    // Supports both:
    // products: ["A", "B"]
    // combination: ["A", "B"]

    const products = Array.isArray(row.products)
      ? row.products
      : Array.isArray(row.combination)
        ? row.combination
        : [];

    return {
      rank: Number(row.rank ?? index + 1),

      label:
        row.label ??
        products.join(" + "),

      products,

      support: Number(row.support ?? 0),
    };
  });
};


/* =========================================================
   SUPPORT VS CONFIDENCE ADAPTER
   ========================================================= */

export const adaptSupportConfidence = (response) => {
  const rows = response?.data ?? [];

  if (!Array.isArray(rows)) {
    return [];
  }

  return rows.map((row) => {
    const antecedents = Array.isArray(row.antecedents)
      ? row.antecedents
      : row.antecedent
        ? [row.antecedent]
        : [];

    const consequents = Array.isArray(row.consequents)
      ? row.consequents
      : row.consequent
        ? [row.consequent]
        : [];

    return {
      antecedent:
        row.antecedent ??
        antecedents.join(", "),

      consequent:
        row.consequent ??
        consequents.join(", "),

      antecedents,

      consequents,

      support: Number(row.support ?? 0),

      confidence: Number(row.confidence ?? 0),

      lift: Number(row.lift ?? 0),
    };
  });
};


/* =========================================================
   LIFT DISTRIBUTION ADAPTER
   ========================================================= */

export const adaptLiftDistribution = (response) => {
  const rows = response?.data ?? [];

  if (!Array.isArray(rows)) {
    return [];
  }

  return rows.map((row) => ({
    range: row.range ?? "",

    count: Number(row.count ?? 0),
  }));
};


/* =========================================================
   PRODUCT NETWORK ADAPTER
   ========================================================= */

export const adaptProductNetwork = (response) => {
  const d = response?.data ?? {};

  const nodes = Array.isArray(d.nodes)
    ? d.nodes
    : [];

  const edges = Array.isArray(d.edges)
    ? d.edges
    : [];

  return {
    nodes: nodes.map((node) => ({
      id: node.id,

      name:
        node.name ??
        `Product ${node.id}`,

      // IMPORTANT:
      // Backend currently sends:
      // category: "Dairy"
      category:
        node.category ??
        node.categoryName ??
        "",

      // Keep categoryId too if backend sends it.
      categoryId:
        node.categoryId ?? null,
    })),

    edges: edges.map((edge) => ({
      source: edge.source,

      target: edge.target,

      lift: Number(edge.lift ?? 0),

      confidence: Number(
        edge.confidence ?? 0
      ),
    })),
  };
};


/* =========================================================
   ASSOCIATION RULES ADAPTER
   ========================================================= */

export const adaptRules = (response) => {
  /**
   * Your current actual backend response is:
   *
   * {
   *   success: true,
   *   data: {
   *     data: [...],
   *     pagination: {...}
   *   }
   * }
   *
   * But we also support:
   *
   * data: {
   *   rules: [...],
   *   pagination: {...}
   * }
   */

  const d = response?.data ?? {};

  const rows = Array.isArray(d.data)
    ? d.data
    : Array.isArray(d.rules)
      ? d.rules
      : [];

  const pagination = d.pagination ?? {};

  const total = Number(
    pagination.total ?? rows.length
  );

  const limit = Number(
    pagination.limit ?? 5
  );

  const page = Number(
    pagination.page ?? 1
  );

  return {
    rules: rows.map((row, index) => {
      const antecedents = Array.isArray(row.antecedents)
        ? row.antecedents
        : row.antecedent
          ? [row.antecedent]
          : [];

      const consequents = Array.isArray(row.consequents)
        ? row.consequents
        : row.consequent
          ? [row.consequent]
          : [];

      return {
        id:
          row.id ??
          row.rule_id ??
          index + 1,

        antecedent:
          row.antecedent ??
          antecedents.join(", "),

        consequent:
          row.consequent ??
          consequents.join(", "),

        antecedents,

        consequents,

        support: Number(
          row.support ?? 0
        ),

        confidence: Number(
          row.confidence ?? 0
        ),

        lift: Number(
          row.lift ?? 0
        ),

        conviction:
          row.conviction === null ||
          row.conviction === undefined
            ? null
            : Number(row.conviction),

        strength:
          row.strength ??
          row.recommendationStrength ??
          "Unknown",
      };
    }),

    pagination: {
      page,

      limit,

      total,

      totalPages: Math.max(
        1,
        Number(
          pagination.totalPages ??
          Math.ceil(total / limit)
        )
      ),
    },
  };
};


/* =========================================================
   RECOMMENDED BUNDLES ADAPTER
   ========================================================= */

export const adaptBundles = (response) => {
  const rows = response?.data ?? [];

  if (!Array.isArray(rows)) {
    return [];
  }

  return rows.map((row, index) => {
    const lift =
      row.lift ??
      row.liftScore ??
      null;

    const confidence =
      row.confidence ??
      null;

    const expectedRevenue =
      row.expected_revenue_increase ??
      row.expectedRevenueIncrease ??
      null;

    return {
      id:
        row.id ??
        index + 1,

      name:
        row.name ??
        row.bundle_name ??
        "Recommended Product Bundle",

      products: Array.isArray(row.products)
        ? row.products
        : [],

      lift:
        lift === "PENDING CONFIRMATION"
          ? null
          : lift === null
            ? null
            : Number(lift),

      confidence:
        confidence === "PENDING CONFIRMATION"
          ? null
          : confidence === null
            ? null
            : Number(confidence),

      tag:
        row.tag ??
        row.recommendationStrength ??
        "Unknown",

      expectedRevenueIncrease:
        expectedRevenue === "PENDING CONFIRMATION"
          ? null
          : expectedRevenue,
    };
  });
};


/* =========================================================
   INSIGHTS ADAPTER
   ========================================================= */

export const adaptInsights = (response) => {
  /**
   * Your actual backend response:
   *
   * {
   *   success: true,
   *   data: [
   *      {
   *        id,
   *        title,
   *        description,
   *        category,
   *        impact,
   *        created_at
   *      }
   *   ]
   * }
   */

  const rows = response?.data ?? [];

  if (!Array.isArray(rows)) {
    return [];
  }

  return rows.map((row, index) => ({
    id:
      row.id ??
      index + 1,

    title:
      row.title ??
      "MBA Insight",

    description:
      row.description ??
      "",

    category:
      row.category ??
      "General",

    impact:
      row.impact ??
      "Medium",

    createdAt:
      row.created_at ??
      row.createdAt ??
      null,
  }));
};


/* =========================================================
   FILTER METADATA ADAPTER
   ========================================================= */

export const adaptFilterMeta = (response) => {
  const d = response?.data ?? {};

  return {
    countries: Array.isArray(d.countries)
      ? d.countries
      : [],

    categories: Array.isArray(d.categories)
      ? d.categories
      : [],

    dateRange:
      d.dateRange ??
      null,
  };
};