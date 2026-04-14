# Donut Pillow — Product Intelligence Hub

> Reference folder for 5 Stars United Donut Pillow product family.
> Last updated: April 13, 2026

---

## Quick Reference IDs

| System | Key | Value |
|--------|-----|-------|
| NeonPanel | Company ID | `106` (5 Stars United LLC) |
| MarketplaceAdPros | Brand ID | `6c3c4087-9add-4f2d-93fe-db08975d35c2` |
| MarketplaceAdPros | Integration ID | `ed381821-7b49-47bf-8e28-fc0d71d5cf84` |
| Amazon US | Parent ASIN | `B0DQVLL98L` |
| Amazon US | Main Child ASIN | `B0B61478T9` |
| Amazon CA | Main Child ASIN | `B094NVQ2PF` |
| NeonPanel | Product Family | `"Donut Pillow"` |
| NeonPanel | SKU prefix | `DONUT-*` |

---

## Files in This Folder

| File | Contents |
|------|----------|
| `donut-pillow-organic-analysis-2026-04-13.md` | Weekly SCP performance, shipping speed CVR, NeonPanel signals, Donut vs Seat Cushion comparison, CA ad summary, recommendations |
| `asin-family.md` | All ASINs across US/CA/UK/EU/ME with variant details and key metrics |
| `search-terms-2026-04-13.md` | 78 search terms from SQP: volume, BIS, BCS, purchase rate, diagnostic scenario, priority tiers |
| `README.md` | This file — reference IDs, tool instructions, data notes |

---

## Instructions for AI Assistants

### MCP Servers Available
1. **NeonPanel** (`https://mcp.neonpanel.com/mcp`) — Brand Analytics, financials, inventory, supply chain
2. **MarketplaceAdPros** (`https://app.marketplaceadpros.com/mcp`) — Amazon Advertising campaign analysis

### Brand Analytics (NeonPanel)

**Available BA data markets:** US and UK only. **NO Canada Brand Analytics data exists.**

#### Search Catalog Performance (SCP)
```
Tool: brand_analytics_analyze_search_catalog_performance
Key params:
  company_id: 106
  asins: ["B0B61478T9", "B0CQWFZ26J", ...]   ← MUST use "asins" (array), NOT "asin"
  marketplace: "US"
  periods_back: 4    ← number of weekly periods
```
- Returns: weekly revenue, impressions, clicks, CVR, revenue class, shipping speed breakdown
- **Important:** Filter field is `asins` (plural, array type). Using `asin` (singular) will silently return no results.

#### Search Query Performance (SQP)
```
Tool: brand_analytics_analyze_search_query_performance
Key params:
  company_id: 106
  product_family: "Donut Pillow"   ← OR use asins array
  marketplace: "US"
  periods_back: 4
```
- Returns: search terms, volumes, impression/click/purchase shares, diagnostic scenarios

### Advertising (MarketplaceAdPros)

```
Tool: mcp_marketplacead_ask_report_analyst
Key params:
  brand_id: "6c3c4087-9add-4f2d-93fe-db08975d35c2"
  question: "your question here"
```
- Full campaign-level data, ACOS, spend, sales, impressions
- Supports US, CA, MX, BR markets
- Has complete daily data (unlike NeonPanel Marketing Stream which may have gaps)

### Inventory & Catalog (NeonPanel)

```
Tool: inventory_list_items
  company_id: 106
  search: "donut"     ← text search across titles

Tool: inventory_get_listing_details_by_asin
  company_id: 106
  asin: "B0B61478T9"
  marketplace: "US"
```

---

## Key Product Facts

- **Hero ASIN (US):** B0B61478T9 — this is the main child, NOT B07RGVPR8D (which is the small variant)
- **Revenue Class:** A (top tier)
- **Organic Revenue Share:** ~20% of total brand (largest single product)
- **Weekly Organic Sales:** $49K–$61K (March 2026)
- **Organic CTR:** ~2.27% | **CVR:** ~21%
- **Core search term:** "donut pillow for tailbone pain" (10.8K weekly vol, 6.3% BIS, 13.6% click share)
- **Canada market:** Donut dominates all top 5 ad campaign slots (9–16% ACOS)
- **US ACOS:** ~33% average across ad campaigns

## Data Availability Notes

- **NeonPanel Ads (Marketing Stream):** May have incomplete daily data. In March 2026 only 12 of 31 days had real data. Cross-check with MarketplaceAdPros for complete ad metrics.
- **Brand Analytics:** Weekly cadence. Data available for US and UK only.
- **SP Reports:** Must be triggered/generated first in Seller Central before they become available in NeonPanel.

---

## Recommended Analysis Workflow

1. **Weekly organic check:** SCP for latest week → compare revenue class, CVR, impression trends
2. **Search term health:** SQP → look for new Tier 2 Fix terms (C_conversion, B_creative scenarios)
3. **Ad performance:** MarketplaceAdPros ask_report_analyst → ACOS trends, spend efficiency
4. **Cross-reference:** Compare organic conversion (SCP) with ad conversion (MarketplaceAdPros) to find listing vs targeting issues
5. **Inventory:** Check stock levels before recommending ad spend increases
