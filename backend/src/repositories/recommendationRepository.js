const pool = require("../config/db");

const cleanFrozenset = (val) => {
  if (!val) return "";
  let clean = String(val).trim();
  if (clean.startsWith("frozenset(")) {
    clean = clean.slice(10, -1);
  }
  clean = clean.replace(/^[{\[\('\"]+|[}\]\)'\"]+$/g, "");
  clean = clean.replace(/'/g, "").replace(/"/g, "").trim();
  return clean;
};

const getRecommendations = async (product = "") => {
  let query = `
    SELECT
      rule_id,
      antecedents,
      consequents,
      support,
      confidence,
      lift,
      conviction
    FROM association_rules
  `;
  const params = [];

  if (product && product.trim() !== "") {
    query += ` WHERE antecedents ILIKE $1 OR consequents ILIKE $1`;
    params.push(`%${product.trim()}%`);
  }

  query += ` ORDER BY lift DESC, confidence DESC LIMIT 20`;

  const result = await pool.query(query, params);

  // If search didn't match the frozenset format, try full rules
  let rows = result.rows;
  if (rows.length === 0 && product) {
    const allRules = await pool.query(`SELECT rule_id, antecedents, consequents, support, confidence, lift, conviction FROM association_rules ORDER BY lift DESC LIMIT 50`);
    const q = product.toLowerCase();
    rows = allRules.rows.filter(r => {
      const a = cleanFrozenset(r.antecedents).toLowerCase();
      const c = cleanFrozenset(r.consequents).toLowerCase();
      return a.includes(q) || c.includes(q);
    });
  }

  return rows.map((row) => {
    const cleanAnt = cleanFrozenset(row.antecedents);
    const cleanCon = cleanFrozenset(row.consequents);
    const lift = Number(row.lift) || 1.0;
    const confidence = Number(row.confidence) || 0;
    const support = Number(row.support) || 0;

    let strength = "Medium";
    if (lift >= 3.0) strength = "Very Strong";
    else if (lift >= 2.0) strength = "Strong";

    return {
      id: row.rule_id,
      antecedent: cleanAnt,
      consequent: cleanCon,
      productName: cleanCon,
      category: cleanCon.toLowerCase().includes("milk") || cleanCon.toLowerCase().includes("butter") || cleanCon.toLowerCase().includes("cheese") ? "Dairy"
        : cleanCon.toLowerCase().includes("bread") || cleanCon.toLowerCase().includes("cake") ? "Bakery"
        : cleanCon.toLowerCase().includes("tea") || cleanCon.toLowerCase().includes("coffee") ? "Beverages"
        : cleanCon.toLowerCase().includes("lunch") || cleanCon.toLowerCase().includes("box") ? "Accessories"
        : "General",
      support: Number((support * 100).toFixed(2)),
      confidence: Number((confidence * 100).toFixed(2)),
      lift: Number(lift.toFixed(2)),
      strength,
    };
  });
};

const getTopAssociations = async (limit = 5) => {
  const query = `
    SELECT
      rule_id,
      antecedents,
      consequents,
      lift,
      confidence
    FROM association_rules
    ORDER BY lift DESC
    LIMIT $1;
  `;
  const result = await pool.query(query, [limit]);
  return result.rows.map((row, idx) => ({
    rank: idx + 1,
    productA: cleanFrozenset(row.antecedents),
    productB: cleanFrozenset(row.consequents),
    lift: Number(Number(row.lift).toFixed(2)),
    confidence: Number((Number(row.confidence) * 100).toFixed(1)),
  }));
};

const getAvailableProducts = async () => {
  const query = `SELECT product_id, product_name, category_id, unit_price FROM products ORDER BY product_name ASC`;
  const result = await pool.query(query);
  return result.rows;
};

module.exports = {
  getRecommendations,
  getTopAssociations,
  getAvailableProducts,
};