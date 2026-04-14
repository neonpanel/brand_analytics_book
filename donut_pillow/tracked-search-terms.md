# Donut Pillow — Tracked Search Terms

> Weekly tracking list for SQP monitoring. 40 terms covering all intent clusters.
> Baseline: March 2026 | ASIN: B0B61478T9 | Market: US

---

## PRIMARY — Must Track Weekly (15 terms)
> Core high-volume terms that drive 80%+ of organic revenue.

| # | Search Term | Wkly Vol | Baseline BIS% | Baseline BCS% | Watch For |
|---|-------------|----------|---------------|---------------|-----------|
| 1 | seat cushion | 44,056 | 0.54 | 0.17 | BIS growth — massive headroom |
| 2 | donut pillow | 11,558 | 6.22 | 10.45 | Defend #1 position |
| 3 | donut pillow for tailbone pain | 10,821 | 6.30 | 13.56 | Defend #1 position |
| 4 | hemorrhoid pillow | 6,101 | 6.07 | 13.20 | Defend #1 position |
| 5 | tailbone pain relief cushion | 4,540 | 2.48 | 1.54 | FIX — conversion gap |
| 6 | butt pillow | 3,719 | 3.84 | 2.65 | FIX — conversion gap |
| 7 | coccyx cushion for tailbone pain | 2,642 | 5.04 | 3.20 | BCS underweight vs BIS |
| 8 | butt cushion | 1,985 | 1.87 | 1.60 | Low share — growth opp |
| 9 | donut cushion | 1,924 | 5.46 | 11.91 | Protect strong CTR |
| 10 | donut pillow for hemorrhoids | 1,519 | 5.93 | 16.22 | Top converter — protect |
| 11 | bed sore cushions for butt | 1,510 | 4.19 | 5.17 | Medical niche anchor |
| 12 | sitting pillow | 1,361 | 2.66 | 2.06 | Generic — low share |
| 13 | cushion for tailbone pain relief | 1,190 | 4.54 | 2.18 | B_creative — needs fix |
| 14 | doughnut pillow for tailbone pain | 1,177 | 5.91 | 12.26 | Spelling variant — protect |
| 15 | hemorrhoid pillows for sitting | 976 | 5.75 | 13.58 | Top converter — protect |

---

## SECONDARY — Biweekly Check (15 terms)
> Mid-volume terms across key intent segments.

| # | Search Term | Wkly Vol | Baseline BIS% | Baseline BCS% | Cluster |
|---|-------------|----------|---------------|---------------|---------|
| 16 | donut seat cushion | 845 | 5.38 | 11.62 | Core Donut |
| 17 | donut pillow postpartum | 821 | 6.08 | 6.58 | Postpartum |
| 18 | tail bone relief cushion | 792 | 3.78 | 1.32 | Tailbone (B_creative) |
| 19 | hemorrhoid cushion | 790 | 4.35 | 7.64 | Hemorrhoid |
| 20 | sacrum pillow | 769 | 5.00 | 3.21 | Pain / Medical |
| 21 | bed sore cushion | 712 | 3.98 | 4.55 | Bed Sore |
| 22 | tailbone pain relief | 630 | 3.49 | 2.03 | Tailbone (B_creative) |
| 23 | donut pillow for bed sores | 630 | 4.88 | 14.71 | Bed Sore |
| 24 | doughnut pillow | 578 | 5.39 | 14.88 | Spelling Variant |
| 25 | coccyx pillow | 566 | 4.92 | 3.49 | Pain / Medical |
| 26 | bedsore pressure relief pillow | 511 | 3.03 | 6.64 | Bed Sore |
| 27 | sitting donut cushion | 469 | 5.42 | 13.62 | Core Donut |
| 28 | pressure ulcer cushion | 413 | 4.31 | 5.00 | Medical |
| 29 | postpartum pillow | 376 | 4.70 | 6.90 | Postpartum |
| 30 | butt cushions for pressure relief | 353 | 4.01 | 7.03 | Pressure Relief |

---

## NICHE — Monthly Check (10 terms)
> Low-volume but high-conversion niche terms. Track for share stability.

| # | Search Term | Wkly Vol | Baseline BIS% | Baseline BCS% | Cluster |
|---|-------------|----------|---------------|---------------|---------|
| 31 | prostate cushion seat for men | 174 | 4.91 | 27.27 | Prostate |
| 32 | prostate pillow cushion for men | 107 | 6.04 | 26.32 | Prostate |
| 33 | pelvic floor pillow | 104 | 5.85 | 31.03 | Pelvic |
| 34 | gel donut pillow for tailbone pain | 80 | 7.33 | 24.49 | Cooling/Gel |
| 35 | donut pillow for tailbone pain cooling | 77 | 6.91 | 14.29 | Cooling/Gel |
| 36 | hemorrhoid cushion women | 100 | 5.36 | 8.70 | Women-Specific |
| 37 | pillow for hemorrhoids for women | 89 | 5.74 | 16.36 | Women-Specific |
| 38 | donut for hemorrhoids women | 113 | 5.56 | 13.33 | Women-Specific |
| 39 | donut cushion postpartum | 95 | 6.86 | 8.70 | Postpartum |
| 40 | donut seat cushion pressure relief | 14 | 6.80 | 50.00 | Pressure Relief |

---

## Alert Thresholds

| Metric | Green | Yellow | Red |
|--------|-------|--------|-----|
| BIS% | ≥ baseline | -1pp from baseline | -2pp+ from baseline |
| BCS% | ≥ baseline | -2pp from baseline | -5pp+ from baseline |
| Volume | ±15% | -15% to -30% | -30%+ (seasonality or lost relevance) |
| Purchase Rate | ≥ baseline | -1pp | -2pp+ (listing or inventory issue) |

---

## How to Pull This Data

```
NeonPanel tool: brand_analytics_analyze_search_query_performance
Params:
  company_id: 106
  product_family: "Donut Pillow"
  marketplace: "US"
  periods_back: 1       ← 1 for latest week, 4 for month
```

Compare BIS%, BCS%, and Purchase Rate against the baselines above. Flag any term that crosses a Yellow or Red threshold.
