# RYG System Rebuild — Before/After Comparison

**Date:** 2026-03-19
**Company:** 5 Stars United LLC (ID: 106), Marketplace: US
**Tools tested:** Search Catalog Performance (ASIN-level) + Search Query Performance (keyword-level)

---

## Executive Summary

The RYG rebuild **fixed the core problem**: the universal `low_click_rate` red flag that was applied to every ASIN regardless of actual performance is gone. The `weakness_signal` now correctly returns `no_major_weakness` (green) for ASINs that don't have a genuine weakness.

However, there is one **regression**: the `fast_delivery_uplift` opportunity signal that previously appeared on ~60% of cushion/pillow ASINs has disappeared — all ASINs now show `no_clear_opportunity` (red).

On the SQP side, the rebuild introduced better signal codes (`market_leader` replaces `strong_listing_and_intent`) and more targeted weakness detection (`pdp_friction` only fires on genuinely zero-conversion keywords).

---

## 1. CATALOG PERFORMANCE — ASIN-Level Signals

### Weakness Signal — THE MAIN FIX

| | OLD (pre-rebuild) | NEW (post-rebuild) |
|---|---|---|
| **Code** | `low_click_rate` | `no_major_weakness` |
| **Color** | 🔴 RED on **ALL** ASINs | 🟢 GREEN on **ALL** ASINs |
| **Description** | Flagged every ASIN as having low CTR | "No critical weakness detected" |
| **Verdict** | ✅ **FIXED** — This was the #1 complaint. ASINs with 1.4–3.9% CTR (3–8x industry benchmark) are no longer wrongly flagged. |

### Strength Signal — Minor Change

| | OLD | NEW |
|---|---|---|
| **Code** | `weak_click_or_conversion` | `weak_click_or_conversion` OR `insufficient_data` |
| **Color** | 🔴 RED on most ASINs | 🔴 RED on ASINs with clicks; ⚪ NULL on zero-click ASINs |
| **Verdict** | ⚠️ **PARTIALLY IMPROVED** — Now distinguishes between "underperforming" and "not enough data." However, ASINs with 1.5–2.0% CTR and 5–14% purchase rate still get `weak_click_or_conversion` RED. |

**Strength signal concern — examples that seem mis-flagged:**

| ASIN | Impressions | CTR | Purchase Rate | Strength Signal | Reasonable? |
|---|---|---|---|---|---|
| B07HDVHDC2 | 157,631 | 1.97% | 9.39% | `weak_click_or_conversion` 🔴 | ❓ CTR is 4x industry benchmark |
| B07X4HM21Y | 33,312 | 1.86% | 5.18% | `weak_click_or_conversion` 🔴 | ❓ CTR is 3.7x industry benchmark |
| B0D92412Z1 | 25,261 | 0.65% | 10.91% | `weak_click_or_conversion` 🔴 | ✅ CTR is at industry level but strong purchase rate |
| B092JPQD5N | 23,132 | 0.80% | 9.73% | `weak_click_or_conversion` 🔴 | ⚠️ Mixed — CTR borderline, purchase rate good |
| B0FP2NHCVH | 2,498 | 0.88% | 9.09% | `weak_click_or_conversion` 🔴 | ⚠️ Same pattern |

**Note:** The strength signal threshold still appears strict. An ASIN with 2% CTR (4x above industry) and 9% purchase rate being called "weak" seems aggressive. This is the same issue as the old `low_click_rate` but now in the strength dimension rather than weakness.

### Opportunity Signal — REGRESSION

| | OLD | NEW |
|---|---|---|
| **Code** | `fast_delivery_uplift` | `no_clear_opportunity` |
| **Color** | 🟢 GREEN on ~60% of ASINs | 🔴 RED on **ALL** ASINs |
| **Description** | Flagged cushions/pillows where same-day delivery boosts CVR by 1.5–2x | "No clear opportunity detected" |
| **Verdict** | ❌ **REGRESSION** — The delivery speed uplift data still shows 1.5–2.1x CVR boost for cushion ASINs. This signal was actionable and should be restored. |

### Threshold Signal — NEW

| | OLD | NEW |
|---|---|---|
| **Code** | Not reported | `no_ceiling` |
| **Color** | — | 🟢 GREEN on all |
| **Description** | — | "No ceiling detected" |
| **Verdict** | ℹ️ New dimension. All green = no ASIN is hitting a performance ceiling. Makes sense for a growing portfolio. |

### Trend Signals — WORKING

All 30 ASINs show `yellow` (stable) across click_rate, cart_add_rate, and purchase_rate trend signals. This is consistent with the WoW data in the full report (mostly small +/- movements).

---

## 2. SQP — Keyword-Level Signals

### Strength Signal — IMPROVED

| | OLD | NEW |
|---|---|---|
| **Codes** | `strong_listing_and_intent` | `market_leader` (green) or `weak_click_or_conversion` (red) |
| **Behavior** | Single code for good keywords | **Two-tier**: green for strong CTR+conversion, red for zero-conversion keywords |
| **Verdict** | ✅ **IMPROVED** — `market_leader` is more descriptive and only awarded to genuinely strong keyword positions. |

**Examples of `market_leader` GREEN keywords:**
- "donut pillow for tailbone pain" — all 4 signals green
- "chair cushions" — strength green, but click_trend RED (appropriate differentiation)
- "cushion lab" (competitor branded) — strength green despite being competitor's keyword (we have dominant share)
- "between leg pillow" — market_leader green

**Examples of `weak_click_or_conversion` RED keywords:**
- "highest rated pillows for side sleepers for hip relief" — 0% purchase rate → correctly flagged
- "half moon pillow cover" — 0% purchase rate → correctly flagged
- "cushion for women after having a baby" — 0% purchase rate → correctly flagged

### Weakness Signal — IMPROVED

| | OLD | NEW |
|---|---|---|
| **Codes** | `visibility_loss` (red) on 3 keywords | `no_major_weakness` (green) on most; `pdp_friction` (red) only on 0% purchase keywords |
| **Behavior** | Flagged impression/click share declines | Now targets conversion failures specifically |
| **Verdict** | ✅ **IMPROVED** — `pdp_friction` correctly fires only when purchase rate is 0%, suggesting a product detail page issue. More actionable than the generic `visibility_loss`. |

**`pdp_friction` fired on these keywords (all have 0% purchase rate):**
- "highest rated pillows for side sleepers for hip relief"
- "half moon pillow cover"
- "cushion for women after having a baby"
- "5 star half moon bolster"
- "cover for half moon / cylinder pillow"
- "big toe spreader for the top of the big toe"

### Opportunity Signal — NEW GRANULARITY

| | OLD | NEW |
|---|---|---|
| **Codes** | Not detailed | `shipping_alpha` (green) or `no_clear_opportunity` (red) |
| **Description** | — | "1-Day delivery provides >30% CVR lift. Scale FBA." |
| **Verdict** | ✅ **NEW** — `shipping_alpha` is a well-defined, actionable signal with a clear threshold (>30% CVR lift from 1-day delivery). |

**Note:** `shipping_alpha` appears on SQP keywords but NOT on catalog ASINs. The old `fast_delivery_uplift` appeared on catalog ASINs. The signal may have moved from catalog to SQP scope, or the catalog threshold needs adjustment.

### Trend Signals — WORKING WITH DIFFERENTIATION

| Trend Signal | Colors Seen | Examples |
|---|---|---|
| impression_share_trend | green, yellow | green on "bunion spacer," "doughnut cushion," "foam wedges" |
| click_share_trend | yellow, red | red on "chair cushions," "coccyx pillow" |
| purchase_rate_trend | yellow, red | red on some zero-purchase keywords |
| ctr_advantage_trend | yellow, red | red on "chair cushions" (correctly — CTR is half of market avg for this keyword) |
| cart_add_rate_trend | yellow | mostly stable |

✅ Trends are correctly differentiating — keywords with declining share get red, stable get yellow, growing get green.

---

## 3. OVERALL REBUILD VERDICT

### ✅ What's Fixed
1. **`low_click_rate` universal red flag eliminated** — The #1 problem. No ASIN is wrongly flagged for low CTR anymore.
2. **Weakness signal now granular** — `no_major_weakness` (green) vs `pdp_friction` (red) differentiates real problems from healthy ASINs.
3. **`market_leader` strength code** — Better than old `strong_listing_and_intent`. Only awarded to genuinely dominant keyword positions.
4. **`shipping_alpha` opportunity** — Clear, threshold-based signal with actionable guidance.
5. **Trend signals working** — Red/yellow/green correctly tracks directional changes.

### ⚠️ What Needs Attention
1. **Strength signal threshold still strict on catalog** — ASINs with 1.5–2.0% CTR (3–4x industry benchmark) and 5–14% purchase rate get `weak_click_or_conversion` RED. Consider whether catalog strength should factor in industry CTR benchmarks, not just absolute thresholds.
2. **`fast_delivery_uplift` opportunity disappeared from catalog** — The old signal was actionable (cushion ASINs get 1.5–2x CVR boost from same-day delivery). It now only appears as `shipping_alpha` on SQP keywords. Consider restoring it to catalog scope.
3. **All opportunity signals are RED on catalog** — Every single ASIN shows `no_clear_opportunity`. If no ASIN has any opportunity, the signal loses utility.

### 🔴 Remaining Issue
The strength signal in catalog may have the same philosophical problem as the old weakness signal: the threshold appears calibrated to a benchmark that doesn't match real-world industry CTR norms (0.4–0.6%). An ASIN with 2% CTR shouldn't be called "weak click or conversion" — that's a top-performer by industry standards.

---

## 4. SIGNAL CODE REFERENCE

| Code | Color | Scope | Description |
|---|---|---|---|
| `market_leader` | 🟢 green | SQP strength | Top-tier click share and conversion; listing is highly relevant |
| `weak_click_or_conversion` | 🔴 red | Both | Underperforming click or conversion rate |
| `insufficient_data` | ⚪ null | Catalog strength | Not enough data to evaluate strength |
| `no_major_weakness` | 🟢 green | Both | No critical weakness detected |
| `pdp_friction` | 🔴 red | SQP weakness | Critical conversion leak; check reviews or UX |
| `shipping_alpha` | 🟢 green | SQP opportunity | 1-Day delivery provides >30% CVR lift. Scale FBA |
| `no_clear_opportunity` | 🔴 red | Both | No clear opportunity detected |
| `no_ceiling` | 🟢 green | Both | No ceiling detected |
