# Brand Analytics Weekly Prompts

A collection of ready-to-use prompts for weekly Brand Analytics analysis. Each prompt maps to a problem category from the Brand Analytics Guide.

---

## A. Visibility & Discovery

### A1. Impression Share Audit
> Pull my SQP data for company 5 Stars United (106), US marketplace. Show the top 20 search queries by `searchquerydata_searchqueryvolume` and include `searchquerydata_searchquery`, `searchquerydata_searchqueryvolume`, `kpi_impression_share`, `kpi_impression_share_wow`, `kpi_impression_share_wolast4`, and `kpi_impression_share_wolast12`. Flag any keywords where my impression share is below 5% but search volume is above 1,000. These are visibility gaps I need to close.

### A2. Catalog Visibility Health Check
> Pull catalog performance for company 106, US marketplace. Show all ASINs with their `asin`, `impressiondata_impressioncount`, `kpi_click_rate`, `strength_signal`, `weakness_signal`, and `kpi_click_rate_trend_signal`. Sort by impressions descending. Highlight any ASINs where `strength_signal` contains "red" — these are products that shoppers can't find or aren't clicking on.

### A3. Declining Keyword Share Alert
> Pull search term momentum for company 106, US marketplace. Show terms where `momentum_signal` is "collapsing" or where `wow_delta` is negative. Include `search_term`, `search_volume`, `my_click_share`, `wow_delta`, `avg_share_l4w`, `avg_share_l12w`, and `momentum_signal`. These are keywords where we're losing ground and need immediate attention.

### A4. SQP Keyword WoW & 4W Trend Alert (All Metrics)
> Pull SQP data for company 106, US marketplace, top 30 results by `searchquerydata_searchqueryscore`. Include `searchquerydata_searchquery`, `searchquerydata_searchqueryvolume`, `kpi_impression_share`, `kpi_impression_share_wow`, `kpi_impression_share_wolast4`, `kpi_click_share`, `kpi_click_share_wow`, `kpi_click_share_wolast4`, `kpi_purchase_rate`, `kpi_purchase_rate_wow`, `kpi_purchase_rate_wolast4`, `kpi_cart_add_rate`, `kpi_cart_add_rate_wow`, `kpi_cart_add_rate_wolast4`.
>
> For each keyword, classify trends:
> - **🔴 Deteriorating:** Any metric where BOTH WoW and 4W trend are negative — this is a sustained decline needing immediate action.
> - **🟡 Slipping:** Any metric where WoW is negative but 4W is still positive — early warning, monitor closely.
> - **🟢 Improving:** Any metric where BOTH WoW and 4W trend are positive — working well, double down.
> - **🚀 Breakout:** WoW is strongly positive (> +0.5) — something changed this week, investigate what caused it.
>
> Produce two tables: (1) Top 5 keywords with the worst combined trend scores (candidates for urgent intervention), and (2) Top 5 keywords with the best combined trend scores (candidates to increase investment). Pay special attention to keywords where impression share is growing but click share is declining — this means more shoppers see us but fewer click, indicating a listing quality problem.

### A5. ASIN Catalog WoW & 4W Trend Alert
> Pull catalog performance for company 106, US marketplace, all ASINs with clicks above 10. Include `asin`, `title`, `impressiondata_impressioncount`, `clickdata_clickcount`, `purchasedata_purchasecount`, `kpi_click_rate`, `kpi_click_rate_wow`, `kpi_click_rate_wolast4`, `kpi_click_rate_trend_signal`, `kpi_purchase_rate`, `kpi_purchase_rate_wow`, `kpi_purchase_rate_wolast4`, `kpi_purchase_rate_trend_signal`, `strength_signal`, `weakness_signal`.
>
> For each ASIN, produce a trend scorecard:
> - **CTR trend:** Compare `kpi_click_rate_wow` (this week vs last) and `kpi_click_rate_wolast4` (this week vs 4-week average). Flag red if both negative.
> - **Purchase rate trend:** Compare `kpi_purchase_rate_wow` and `kpi_purchase_rate_wolast4`. Flag red if both negative.
> - **Divergence alert:** Flag ASINs where CTR is improving but purchase rate is declining (listing attracts clicks but product page fails to convert — may indicate review problems, stock issues, or price competitiveness) and vice versa.
>
> Produce three tables:
> 1. **🔴 Declining ASINs** — both CTR and purchase rate trending down. These need immediate listing audit.
> 2. **🟢 Improving ASINs** — both metrics trending up. Increase ad spend on these.
> 3. **⚠️ Diverging ASINs** — one metric up, one down. Diagnose the root cause.

---

## B. Click-Through & Listing Quality

### B1. Click-Through Rate Benchmark
> Pull keyword funnel metrics for company 106, US marketplace. Show top 20 keywords by `total_impressions`. Include `keyword`, `total_impressions`, `market_impression_to_click_rate`, `brand_impression_to_click_rate`, `brand_impression_share`, and `brand_click_share`. Calculate where my CTR is below the market CTR — those listings need main image, title, or pricing improvements.

### B2. Impressions-to-Clicks Gap Analysis
> Pull SQP data for company 106, US marketplace, top 30 results. Include `searchquerydata_searchquery`, `searchquerydata_searchqueryvolume`, `kpi_impression_share`, `kpi_impression_share_wow`, `kpi_impression_share_wolast4`, `kpi_click_share`, `kpi_click_share_wow`, `kpi_click_share_wolast4`, `kpi_ctr_advantage`, `weakness_signal`. Find all keywords where `kpi_impression_share` is above 5% but `kpi_click_share` is below 3%. Also flag keywords where impression share WoW is positive but click share WoW is negative — visibility is growing but clickability is shrinking, meaning the listing is becoming less attractive to shoppers even as it appears more often.

### B3. Competitor Click Share Comparison
> Pull competitive landscape for company 106, US marketplace, top 15 results. Include `search_term`, `search_frequency_rank`, `top_3_products`, `my_position`, and `share_gaps`. For each term, compare the click shares of the top 3 competitors against mine. Identify terms where competitors have 2x+ my click share — what are they doing differently in main image, title, and price?

---

## C. Conversion & Product Page Optimization

### C1. Full Funnel Drop-Off Analysis
> Pull keyword funnel metrics for company 106, US marketplace, top 20 keywords by `total_impressions`. Show the complete funnel: `keyword`, `brand_impression_to_click_rate`, `brand_click_to_cart_rate`, `brand_cart_to_purchase_rate`, and compare each against market rates (`market_impression_to_click_rate`, `market_click_to_cart_rate`, `market_cart_to_purchase_rate`). For each keyword, identify the weakest funnel stage — that's where optimization effort should focus.

### C2. Conversion Problem ASINs
> Pull catalog performance for company 106, US marketplace. Include `asin`, `parent_asin`, `title`, `clickdata_clickcount`, `purchasedata_purchasecount`, `kpi_purchase_rate`, `kpi_purchase_rate_wow`, `kpi_purchase_rate_wolast4`, `kpi_purchase_rate_trend_signal`, `kpi_click_rate`, `kpi_click_rate_wow`, `kpi_click_rate_wolast4`, `weakness_signal`, and `opportunity_signal`. Show ASINs where `kpi_purchase_rate` is below 5% and clicks are above 50. Also flag ASINs where `kpi_purchase_rate_wow` and `kpi_purchase_rate_wolast4` are both negative — these are products whose conversion is actively deteriorating and need priority investigation. Compare against CTR trends: if CTR is stable/growing but purchase rate is falling, the problem is on the product page (reviews, pricing, stock), not the listing creative.

### C3. Delivery Speed Conversion Impact
> Pull catalog performance for company 106, US marketplace. Include `asin`, `title`, `kpi_click_rate`, `kpi_purchase_rate`, `cvr_same_day`, `cvr_one_day`, `cvr_two_day`, `cvr_one_vs_two_ratio`, `opportunity_signal`. Show ASINs where `cvr_one_day` is significantly higher than `cvr_two_day`. These are products where faster delivery directly drives more sales — prioritize FBA or faster shipping options.

---

## D. Competitive Intelligence

### D1. Top Keyword Competitor Map
> Pull competitive landscape for company 106, US marketplace, top 20 results. Show `search_term`, `search_frequency_rank`, `top_3_products`, `my_position`, and `weak_leader_analysis`. For each keyword, tell me: (1) Who holds positions 1-3, (2) What are their click and conversion shares, (3) Am I in the top 3, and (4) Is the leader weak (low conversion share)?

### D2. Displacement Opportunities
> Pull competitive landscape for company 106, US marketplace, limit 50. Include `search_term`, `search_frequency_rank`, `weak_leader_analysis`, `my_position`, and `share_gaps`. Filter for terms where `weak_leader_analysis` shows `is_weak_leader: true` and `displacement_opportunity_score` is above 10. Rank by displacement score descending. These are the highest-ROI keywords to target with ads and listing optimization.

### D3. Competitor Movement Tracker
> Pull competitive landscape for company 106, US marketplace, limit 30. Include `search_term`, `period_start`, `period_end`, `top_3_products`. Focus on the `position_change` and `click_share_trend` fields within `top_3_products`. Flag any keywords where a new competitor has entered the top 3 this week or where an existing competitor's click share jumped by more than 2 percentage points.

---

## E. Keyword Strategy & SEO

### E1. Rising Keywords to Capture
> Pull search term momentum for company 106, US marketplace, limit 30. Include `search_term`, `search_volume`, `my_click_share`, `wow_delta`, `momentum_signal`, `displacement_opportunity_score`, and `is_weak_leader`. Filter for `momentum_signal` = "accelerating" or terms with positive `wow_delta` for 3+ consecutive weeks. These are growing opportunities — recommend which ones to add to PPC campaigns and backend keywords.

### E2. Keywords to Cut from Ad Spend
> Pull search term momentum for company 106, US marketplace, limit 50. Include `search_term`, `search_volume`, `my_click_share`, `wow_delta`, `avg_share_l4w`, `avg_share_l12w`, `momentum_signal`. Identify terms where (a) `momentum_signal` is "collapsing", or (b) `my_click_share` is 0 and `search_volume` is below 500, or (c) 12-week average is declining. These keywords are wasting ad spend.

### E3. Hidden Gem Keywords
> Pull SQP data for company 106, US marketplace, limit 50. Include `searchquerydata_searchquery`, `searchquerydata_searchqueryvolume`, `kpi_impression_share`, `kpi_click_share`, `kpi_purchase_rate`, `kpi_cart_add_rate`. Find keywords where `kpi_purchase_rate` is above 10% but `kpi_impression_share` is below 3%. These are keywords where we convert well but have low visibility — increasing ad spend or SEO here will have high ROI.

### E4. Keyword Portfolio Summary
> Pull search term momentum for company 106, US marketplace, limit 100. Include `search_term`, `momentum_signal`, `search_volume`, `my_click_share`. Group the results by `momentum_signal` and summarize: how many keywords are accelerating, stable, collapsing, or new? What percentage of total search volume does each group represent? This gives me an overall health score of my keyword portfolio.

---

## F. Revenue Growth & Bundling

### F1. Top Cross-Sell Pairs
> Pull cross-sell opportunities for company 106, US marketplace, limit 30. Include `primary_asin`, `primary_product_family`, `co_purchased_asin`, `co_purchased_product_family`, `co_purchased_brand`, `avg_combination_pct`, `best_rank`, `consistency_score`, `weeks_appearing`, `total_weeks`, `co_purchased_is_own`. Sort by `consistency_score` descending, then by `avg_combination_pct` descending. Show only pairs with `consistency_score` above 0.5. These are reliable co-purchase patterns worth acting on.

### F2. Virtual Bundle Candidates
> Pull cross-sell opportunities for company 106, US marketplace, limit 50. Include `primary_asin`, `primary_product_family`, `co_purchased_asin`, `co_purchased_product_family`, `co_purchased_is_own`, `avg_combination_pct`, `consistency_score`. Filter for pairs where `co_purchased_is_own` is true — these are products from our own catalog that customers already buy together. Recommend the top 5 pairs as virtual bundle candidates with the expected uplift based on `avg_combination_pct`.

### F3. Competitor Products Bought with Ours
> Pull cross-sell opportunities for company 106, US marketplace, limit 30. Include `primary_asin`, `primary_product_family`, `co_purchased_asin`, `co_purchased_product_family`, `co_purchased_brand`, `avg_combination_pct`, `consistency_score`. Filter for `co_purchased_is_own` = false and `consistency_score` above 0.3. These are competitor products frequently bought alongside ours — consider developing competing products or targeting these ASINs with Sponsored Display ads.

---

## G. Customer Retention & Lifetime Value

### G1. Repeat Purchase Leaders
> Pull repeat purchase data for company 106, US marketplace, limit 30. Include `asin`, `product_family`, `total_orders`, `total_unique_customers`, `avg_repeat_customers_pct`, `avg_repeat_revenue_pct`, `total_repeat_revenue`, `repeat_customers_pct_wow`, `orders_wow`, `pareto_abc_class`. Sort by `avg_repeat_customers_pct` descending. Show the top products with the highest repeat rates — these are the best candidates for Subscribe & Save enrollment or loyalty-focused ad campaigns.

### G2. Retention Trend Alert
> Pull repeat purchase data for company 106, US marketplace, limit 20. Include `asin`, `product_family`, `avg_repeat_customers_pct`, `latest_week_repeat_customers_pct`, `repeat_customers_pct_wow`, `repeat_revenue_pct_wow`, `orders_wow`. Flag any ASINs where `repeat_customers_pct_wow` is negative for the current week — these products are losing repeat customers. Compare `latest_week_repeat_customers_pct` vs `avg_repeat_customers_pct` to see if it's a one-time dip or a trend.

### G3. One-Time vs Repeat Product Classification
> Pull repeat purchase data for company 106, US marketplace, limit all. Include `asin`, `product_family`, `total_orders`, `avg_repeat_customers_pct`, `avg_repeat_revenue_pct`, `revenue_share`, `revenue_abcd_class`. Classify each product: if `avg_repeat_customers_pct` is below 1%, it's a one-time purchase product. If above 5%, it's a strong consumable/repeat product. Between 1-5% is moderate repeat potential. Summarize how much of our revenue comes from each category.

---

## H. Portfolio Health & Prioritization

### H1. Weekly Portfolio Health Dashboard
> Pull catalog performance for company 106, US marketplace, all ASINs. Include `asin`, `parent_asin`, `title`, `impressiondata_impressioncount`, `clickdata_clickcount`, `purchasedata_purchasecount`, `kpi_click_rate`, `kpi_click_rate_wow`, `kpi_click_rate_wolast4`, `kpi_click_rate_trend_signal`, `kpi_purchase_rate`, `kpi_purchase_rate_wow`, `kpi_purchase_rate_wolast4`, `kpi_purchase_rate_trend_signal`, `strength_signal`, `weakness_signal`, `opportunity_signal`. Create a summary: (1) How many ASINs have red weakness signals? (2) How many have green strength signals? (3) Which ASINs improved this week (trend = green AND positive WoW)? (4) Which worsened (trend = red AND negative WoW)? (5) Which ASINs have conflicting signals — trend signal says green but WoW number is actually negative, or vice versa?

### H2. Revenue Concentration Risk
> Pull repeat purchase data for company 106, US marketplace. Include `asin`, `product_family`, `revenue_share`, `pareto_abc_class`, `revenue_abcd_class`, `total_orders`, `orders_wow`. Calculate: what % of revenue comes from the top 3 ASINs? What % from Pareto class A? If more than 50% comes from class A products, identify class B and C products with positive `orders_wow` that could diversify revenue. Flag any class A product with negative `orders_wow` as a risk.

### H3. ASIN Action Priority Matrix
> Run all three analyses for company 106, US marketplace:
> 1. Catalog performance: get `asin`, `kpi_click_rate`, `kpi_purchase_rate`, `strength_signal`, `weakness_signal`, `opportunity_signal`
> 2. Repeat purchases: get `asin`, `avg_repeat_customers_pct`, `orders_wow`, `revenue_share`
> 3. SQP: get `asin`, `kpi_impression_share`, `kpi_click_share`, `kpi_purchase_rate`
>
> Cross-reference by ASIN and create a priority matrix:
> - **Fix Now**: Red weakness + high revenue share + negative orders_wow
> - **Grow**: Green opportunity + low impression share + positive repeat rate
> - **Maintain**: Green strength + stable trends
> - **Deprioritize**: Low revenue share + red signals + no repeat customers

---

## Comprehensive Weekly Review

### WEEKLY-1. Full Weekly Brand Analytics Review
> Run a comprehensive weekly review for company 5 Stars United (106), US marketplace. Execute in this order:
>
> **Step 1 — Portfolio Health:** Pull catalog performance for all ASINs. Summarize red/yellow/green signal distribution across strength, weakness, and opportunity signals.
>
> **Step 2 — Keyword Momentum:** Pull momentum data. Count how many keywords are accelerating vs collapsing vs stable. Flag the top 5 accelerating terms and top 5 collapsing terms.
>
> **Step 3 — Funnel Analysis:** Pull funnel metrics for the top 10 keywords by search volume. Identify which funnel stage (impression→click, click→cart, cart→purchase) is the biggest bottleneck across the portfolio.
>
> **Step 4 — Competitive Threats:** Pull competitive landscape. Flag any keywords where a new competitor entered the top 3 or where `displacement_opportunity_score` is above 20.
>
> **Step 5 — Retention Check:** Pull repeat purchase data. Flag any products where `repeat_customers_pct_wow` is declining for 2+ weeks.
>
> **Step 6 — Cross-Sell Review:** Pull cross-sell data. Highlight any new high-consistency co-purchase pairs that appeared this week.
>
> Conclude with a prioritized action list: what to fix, what to invest in, and what to stop spending on.
