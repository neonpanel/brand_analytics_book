# Brand Analytics Guide

## Business Problems Solvable with Brand Analytics

### A. Visibility & Discovery

**"Why aren't shoppers finding my products?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Low impression share on high-volume keywords | SQP | `kpi_impression_share`, `searchquerydata_searchqueryvolume` |
| Not appearing in catalog search results | Catalog | `impressiondata_impressioncount`, `strength_signal` |
| Declining share on previously strong keywords | Momentum | `wow_delta`, `avg_share_l4w` vs `avg_share_l12w` |

### B. Click-Through & Listing Quality

**"Shoppers see me but don't click — what's wrong with my listing?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Low click share despite decent impressions | SQP | `kpi_impression_share` vs `kpi_click_share`, `weakness_signal` |
| Market CTR benchmark vs your CTR | Funnel | `market_impression_to_click_rate` vs `brand_impression_to_click_rate` |
| Main image / title / price underperforming vs competitors | Competitive | `top_3_products` (compare click shares) |

### C. Conversion & Product Page Optimization

**"Shoppers click but don't buy — why?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| High clicks, low cart adds | Funnel | `brand_click_to_cart_rate` vs `market_click_to_cart_rate` |
| High cart adds, low purchases | Funnel | `brand_cart_to_purchase_rate` vs `market_cart_to_purchase_rate` |
| Conversion rate below category average | Catalog | `kpi_purchase_rate`, `weakness_signal` |
| Fast-delivery impact on conversion | Catalog | `cvr_same_day`, `cvr_one_day`, `cvr_two_day`, `opportunity_signal` |

### D. Competitive Intelligence

**"Who's taking my market share and where?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Identifying who ranks #1-3 on your keywords | Competitive | `top_3_products`, `my_position` |
| Finding weak leaders you can displace | Competitive + Momentum | `weak_leader_analysis`, `displacement_opportunity_score` |
| Tracking competitor position changes week-over-week | Competitive | `position_change`, `click_share_trend` |

### E. Keyword Strategy & SEO

**"Which keywords should I invest in or abandon?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Rising search terms to capture early | Momentum | `momentum_signal: "accelerating"` |
| Collapsing terms to stop spending on | Momentum | `momentum_signal: "collapsing"` |
| High-volume terms where you have zero presence | Momentum | `search_volume` + `my_click_share: 0` |
| Keywords where you convert but lack impressions | SQP | high `kpi_purchase_rate` + low `kpi_impression_share` |

### F. Revenue Growth & Bundling

**"How do I increase average order value?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Products frequently bought together | Cross-sell | `primary_asin`, `co_purchased_asin`, `avg_combination_pct` |
| Consistent cross-sell patterns (not one-offs) | Cross-sell | `consistency_score`, `weeks_appearing` |
| Bundle candidates from your own catalog | Cross-sell | `co_purchased_is_own: true` |

### G. Customer Retention & Lifetime Value

**"Are customers coming back?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| Products with high repeat purchase rates (Subscribe & Save candidates) | Repeat | `avg_repeat_customers_pct`, `avg_repeat_revenue_pct` |
| Retention trending up or down | Repeat | `repeat_customers_pct_wow`, `repeat_revenue_pct_wow` |
| One-time-buy products vs consumables | Repeat | `avg_repeat_customers_pct` (near 0 = one-time) |

### H. Portfolio Health & Prioritization

**"Which ASINs need attention and which are fine?"**

| Problem | Tool | Key Fields |
|---------|------|-----------|
| ASINs with weak click or conversion rates | Catalog | `strength_signal`, `weakness_signal` (color-coded RYG) |
| Revenue concentration risk (Pareto analysis) | Catalog + Repeat | `pareto_abc_class`, `revenue_abcd_class`, `revenue_share` |
| Trend signals across all KPIs | Catalog | `kpi_click_rate_trend_signal`, `kpi_purchase_rate_trend_signal` |

---

## Tool Reference

### 1. Search Query Performance (SQP)

**Tool:** `brand_analytics_analyze_search_query_performance`

**Purpose:** Analyze how your products perform for specific customer search queries.

**Key Fields:**
- `searchquerydata_searchquery` — the search term
- `searchquerydata_searchqueryvolume` — search volume
- `kpi_impression_share` — your share of impressions
- `kpi_click_share` — your share of clicks
- `kpi_cart_add_rate` — cart add rate
- `kpi_purchase_rate` — purchase/conversion rate
- `kpi_ctr_advantage` — CTR advantage over market
- `strength_signal` / `weakness_signal` / `opportunity_signal` — RYG diagnostics
- `kpi_*_wow` / `kpi_*_wolast4` / `kpi_*_wolast12` — trend metrics

**Filters:** `company_id` (array), `marketplace` (array)

**Date filtering:** `aggregation.time.periods_back`

### 2. Search Catalog Performance

**Tool:** `brand_analytics_analyze_search_catalog_performance`

**Purpose:** ASIN-centric view of catalog performance in search results.

**Key Fields:**
- `asin` / `parent_asin` — product identifiers
- `impressiondata_impressioncount` — total impressions
- `clickdata_clickcount` — total clicks
- `purchasedata_purchasecount` — total purchases
- `kpi_click_rate` / `kpi_purchase_rate` — conversion rates
- `kpi_sales_per_click` / `kpi_sales_per_impression` — revenue efficiency
- `cvr_same_day` / `cvr_one_day` / `cvr_two_day` — delivery speed conversion
- `strength_signal` / `weakness_signal` / `opportunity_signal` / `threshold_signal` — RYG diagnostics
- `kpi_click_rate_trend_signal` / `kpi_purchase_rate_trend_signal` — trend signals

**Filters:** `company_id` (array), `marketplace` (array)

**Date filtering:** `aggregation.time.periods_back`

### 3. Keyword Funnel Metrics

**Tool:** `brand_analytics_get_keyword_funnel_metrics`

**Purpose:** Deep funnel analysis: Impressions → Clicks → Cart Adds → Purchases.

**Key Fields:**
- `keyword` — search term
- `search_frequency_rank` / `search_query_volume` — demand signals
- `brand_impression_share` / `brand_click_share` / `brand_cart_add_share` / `brand_purchase_share` — your funnel shares
- `market_impression_to_click_rate` — market CTR benchmark
- `brand_impression_to_click_rate` — your CTR
- `market_click_to_cart_rate` / `brand_click_to_cart_rate` — cart add conversion
- `market_cart_to_purchase_rate` / `brand_cart_to_purchase_rate` — purchase conversion
- `brand_*_wow` — week-over-week changes

**Filters:** `company_id` (number), `marketplace` (array)

**Date filtering:** `aggregation.time.start_date` / `aggregation.time.end_date`

### 4. Search Term Momentum

**Tool:** `brand_analytics_get_search_term_momentum`

**Purpose:** Track velocity and trajectory of search terms over time.

**Key Fields:**
- `search_term` — the keyword
- `search_volume` — total search volume
- `my_click_share` / `prev_week_share` — current vs previous share
- `wow_delta` — week-over-week change
- `avg_share_l4w` / `avg_share_l12w` — moving averages
- `momentum_signal` — `"accelerating"`, `"stable"`, `"collapsing"`, `"new"`
- `is_weak_leader` — weak leader flag
- `displacement_opportunity_score` — opportunity to displace leader
- `rank_1_*` / `rank_2_*` / `rank_3_*` — top 3 competitor details

**Filters:** `company_id` (number), `marketplace` (array), `search_terms` (array), `asins` (array)

### 5. Competitive Landscape

**Tool:** `brand_analytics_get_competitive_landscape`

**Purpose:** Top 3 clicked products per search term with competitive positioning.

**Key Fields:**
- `search_term` / `search_frequency_rank` — the keyword and its rank
- `period_start` / `period_end` — reporting period
- `top_3_products` — JSON array with position, asin, title, click_share, conversion_share, position_change
- `my_position` — your rank (null if not in top 3)
- `weak_leader_analysis` — JSON with `is_weak_leader`, `leader_conversion_share`, `displacement_opportunity_score`, `recommended_action`
- `share_gaps` — JSON with `click_share_to_leader`, `conversion_share_to_leader`

**Filters:** `company_id` (number), `marketplace` (array), `my_asins` (array)

### 6. Cross-Sell Opportunities

**Tool:** `brand_analytics_get_cross_sell_opportunities`

**Purpose:** Market basket analysis — what customers buy together.

**Key Fields:**
- `primary_asin` — your product
- `co_purchased_asin` — the co-purchased product
- `primary_product_family` / `co_purchased_product_family` — product type
- `avg_combination_pct` — co-purchase likelihood (1.0 = 100%)
- `best_rank` — best co-purchase rank achieved
- `consistency_score` — how consistent the pattern is across weeks
- `weeks_appearing` / `total_weeks` — frequency of co-purchase
- `co_purchased_is_own` — whether co-purchased ASIN is yours

**Filters:** `company_id` (number), `marketplace` (array)

### 7. Repeat Purchase Analysis

**Tool:** `brand_analytics_analyze_repeat_purchases`

**Purpose:** Customer retention and repeat purchase behavior.

**Key Fields:**
- `asin` / `product_family` — product identifiers
- `total_orders` / `total_unique_customers` — volume metrics
- `avg_repeat_customers_pct` — repeat customer rate
- `avg_repeat_revenue_pct` — repeat revenue share
- `total_repeat_revenue` — absolute repeat revenue
- `repeat_customers_pct_wow` — WoW change in repeat rate
- `repeat_revenue_pct_wow` — WoW change in repeat revenue share
- `orders_wow` — WoW change in total orders
- `latest_week_repeat_customers_pct` — most recent week's repeat rate
- `pareto_abc_class` / `revenue_abcd_class` / `revenue_share` — portfolio classification

**Filters:** `company_id` (number), `marketplace` (array)

---

## Query Structure Reference

All tools use the same base structure:

```json
{
  "query": {
    "filters": {
      "company_id": 106,
      "marketplace": ["US"]
    },
    "select_fields": ["field1", "field2"],
    "limit": 10
  }
}
```

### Date filtering (where supported)

```json
{
  "query": {
    "aggregation": {
      "time": {
        "start_date": "2026-02-01",
        "end_date": "2026-03-15"
      }
    }
  }
}
```

Or by period count:

```json
{
  "query": {
    "aggregation": {
      "time": {
        "periods_back": 4
      }
    }
  }
}
```

### Notes

- Omitting `select_fields` returns all columns (use `limit: 3+` for reliable results)
- Including an invalid field name triggers `_unrecognized_fields` and `_available_fields` in the response
- SQP and Catalog use `company_id` as an **array**: `[106]`
- Funnel, Momentum, Competitive, Cross-sell, and Repeat use `company_id` as a **number**: `106`
- Momentum filters: `search_terms` (array), `asins` (array)
- Competitive filters: `my_asins` (array)
