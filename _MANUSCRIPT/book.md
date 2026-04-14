# Amazon Business Growth Machine

## The Complete Blueprint

### How to Leverage Brand Analytics and AI to Systematically Outperform the Market

---

*For every Amazon seller who looked at their ACoS, thought they were winning, and never saw the competitor who was quietly eating their market share.*

---

## Preface

This book exists because of a gap.

Not a keyword gap — though we will talk about those extensively — but a knowledge gap. There are hundreds of resources on Amazon PPC. There are courses on listing optimisation, guides to product research, and entire communities built around finding the next product to launch. What almost nobody talks about is the data layer that sits *above* all of this: Brand Analytics.

Amazon Brand Analytics is arguably the most powerful competitive intelligence tool ever given to third-party sellers. It tells you, in plain numbers, how much of the market you own on every keyword that matters. Not approximately. Not through proxy metrics. Actual purchase share, click share, impression share — broken down by search term, by ASIN, by week.

And yet most brand-registered sellers barely glance at it.

This book will change that. We are going to build what I call the Growth Machine — a systematic, repeatable process that transforms Brand Analytics data into market-share gains. Not through gut feel or manual spreadsheet work, but through a structured methodology powered by AI tooling that can execute the analysis in minutes rather than days.

The Growth Machine is not a one-time audit. It is a living system: it ingests data weekly, generates hypotheses, takes actions, measures results, and learns. Over time, it develops an increasingly precise understanding of your specific market — which keywords respond to bid pressure, which competitors are vulnerable, where your funnel leaks, and how your true unit economics constrain or enable aggressive growth.

Whether you are a seven-figure seller looking to break into eight figures, or an established brand seeking to defend market position against new entrants, the principles in this book apply. The data is the same. The machine is the same. Only the inputs change.

Let us build it.

---

## Who This Book Is For

- **Brand-registered Amazon sellers** who have access to Brand Analytics but are not using it systematically.
- **Amazon advertising managers** who want to move beyond ACoS-driven optimisation to market-share-driven strategy.
- **E-commerce operators** who need to connect marketing decisions to unit economics and inventory constraints.
- **Technically curious sellers** who want to use AI tools (specifically, MCP-based agents in VSCode) to automate their analysis workflow.

You do not need to be a programmer. The AI agent handles the technical execution. You need to understand the concepts, set the strategy, and make the decisions.

---

## How to Read This Book

The book is structured in seven sections, each building on the last:

**Section I: The Data Engine** lays the conceptual foundation. What data exists, why it matters, and how it connects. If you are new to Brand Analytics, read every word. If you are already familiar with SQP and SCP, skim for the RYG framework and move on.

**Section II: Marketing & Advertising Enrichment** is the analytical core. Three chapters that teach you to find keyword gaps, measure advertising incrementality, and discover blue-ocean opportunities. This is where most of the actionable value lives.

**Section III: The Operations & Profitability Gearbox** grounds the marketing analysis in financial reality. No growth strategy survives contact with bad unit economics or a stockout. These two chapters ensure your machine runs on solid fuel.

**Section IV: The Weekly Governance Loop** turns the one-time analysis into a perpetual system. The ritual, the cadence, the feedback loop.

**Section V: The Persistent Brain** covers long-term memory — how the machine learns and improves across weeks and months.

**Section VI: The NeonaSphera Agent** provides the AI orchestration specification — the system prompt and decision chain that ties everything together.

**Section VII: Practical Workshop** is the hands-on chapter. You open your tools, connect to your data, and run the machine on your own product.

Each chapter can be read independently, but the power is in the system. I recommend reading straight through on the first pass, then returning to individual chapters as reference material.

---

# SECTION I: THE DATA ENGINE

---

## Chapter 1: Beyond ACoS

### Why Brand Analytics Is the New North Star for Amazon Sellers

For years, Amazon advertising was governed by a single metric: Advertising Cost of Sale. Sellers optimised bids, pruned keywords, and celebrated when ACoS dropped below their target threshold. Agencies built entire business models around it. "We got your ACoS from 25 % down to 18 %" was the headline of every case study.

The problem? ACoS tells you how efficiently you spent money. It tells you nothing about whether you are winning.

Consider this scenario. Your ACoS is a pristine 15 %, and your campaigns are "profitable." Your agency is sending you green dashboards and congratulatory emails. Meanwhile, a competitor — one you have never even looked at — has quietly captured 40 % of purchase share on the five highest-volume keywords in your category. They are building brand recognition at industrial scale. They are accumulating reviews that compound their conversion rate. They are compressing your organic rank, position by position, week by week. By the time your ACoS dashboard reflects the damage, the market has already shifted beneath your feet.

This is not a hypothetical. This is the default trajectory for any Amazon seller who manages their business by looking inward at their own ad console rather than outward at the market.

ACoS is a rearview mirror. It tells you what happened inside your campaigns. It says nothing about:

- How many people searched for your most important keyword last month.
- What percentage of those shoppers saw your product.
- What percentage clicked.
- What percentage bought from you versus from someone else.
- Whether your market share is growing, stagnant, or shrinking.

Brand Analytics answers every one of those questions.

#### What Brand Analytics Actually Is

Amazon Brand Analytics is a suite of reports available to brand-registered sellers through Seller Central. It draws on Amazon's first-party data — the searches, clicks, and purchases of hundreds of millions of shoppers — and exposes aggregated, anonymised views of market-level behaviour.

The three reports that matter most:

**Search Query Performance (SQP).** For any search term relevant to your product, SQP shows total market activity (searches, impressions, clicks, cart adds, purchases) alongside your brand's share of each. This is the core of the Growth Machine.

**Search Catalog Performance (SCP).** Starting from your ASIN rather than a keyword, SCP shows your full conversion funnel — impressions to clicks to carts to purchases — compared to the market. This is your diagnostic tool for understanding *where* your funnel breaks.

**Top Search Terms.** A ranking of the most popular search terms in your category by search volume. This is your discovery tool for finding keywords you did not know existed.

#### The Paradigm Shift

When you shift from "How cheaply can I get a click?" to "What share of the market's buying behaviour do I own?", your entire decision-making framework changes:

**Bid strategy becomes market-share strategy.** Instead of asking "What should I bid on this keyword?", you ask "What purchase share do I want on this keyword, and what bid level is required to achieve it?"

**Budget allocation becomes growth investment.** Instead of distributing budget evenly across campaigns, you concentrate it on high-volume keywords where your share is low and the leader is weak.

**Keyword targeting becomes competitive intelligence.** Instead of mining your own search terms report for long-tail variations, you identify the exact keywords where the market is buying and you are absent.

**"Profitability" gets redefined.** A keyword with 35 % ACoS that is growing your purchase share on a 50,000-search-per-month term may be more valuable than a keyword with 10 % ACoS on a 500-search term. Context changes everything.

#### The Core Thesis

An Amazon business is a machine. It has inputs (inventory, capital, content), processes (advertising, organic ranking, conversion), and outputs (revenue, profit, market share). Like any machine, it can be tuned, optimised, and scaled — but only if you have the right instruments.

ACoS was the speedometer. It told you how fast you were going. Useful, but not sufficient.

Brand Analytics is the GPS. It tells you where you are, where the market is, and which roads lead to growth.

This book is the engineering manual for building a machine that uses the GPS.

---

## Chapter 2: The Golden Trio

### Search Query Performance, Search Catalog Performance, and PPC Search Terms

The Growth Machine runs on three data feeds. Each one is powerful in isolation. Together, they create a three-dimensional map of your competitive position that no single report can provide.

Think of it this way:

- **SQP** is the market map. It shows you the terrain — where customers are searching, clicking, and buying across the entire category.
- **SCP** is the medical scan. It shows you the health of your own listing — where your funnel is strong and where it leaks.
- **PPC Search Terms** is the financial ledger. It shows you exactly what you are paying for and what return you are getting.

When you overlay all three, you see the full picture: the market opportunity, your competitive position, and the financial efficiency of your response. That overlay is where every meaningful decision in this book originates.

### 2.1 Search Query Performance (SQP)

SQP answers the most fundamental question in Amazon business: *For a given search term, what slice of the market does my brand own?*

When a shopper types "memory foam pillow" into the Amazon search bar, a cascade of events follows. Amazon shows results. The shopper scans the page. They click on one or more products. They add some to their cart. They buy one. SQP captures all of this — for every product on the page, aggregated by brand.

#### The Metrics

**Search Volume.** The total number of times this search term was entered in the period. This is the size of the market on this keyword. A keyword with 100,000 monthly searches is a highway. A keyword with 500 searches is a country lane. Both can be valuable, but they require different strategies.

**Total Impressions vs. Brand Impressions.** An impression occurs when a product appears in the search results for this term. Total impressions tell you how many product views the keyword generated across all sellers. Brand impressions tell you how many of those were *your* products. The ratio is your Impression Share — a measure of visibility.

**Total Clicks vs. Brand Clicks.** Of all the shoppers who clicked on a product from these search results, how many clicked on yours? Click share is a measure of attractiveness — your main image, title, price point, rating, and badge status all influence whether a shopper clicks your listing versus a competitor's.

**Total Cart Adds vs. Brand Cart Adds.** Cart share measures consideration. A customer who adds your product to their cart has moved past casual browsing and is actively evaluating. If your click share is high but your cart share is low, something on your product detail page is losing the comparison — price, reviews, delivery speed, or content quality.

**Total Purchases vs. Brand Purchases.** This is the moment of truth. Purchase share is the percentage of all orders on this keyword that belong to your brand. It is the single most important number in the Growth Machine, because it directly measures your ability to convert market demand into revenue.

**Purchase Share.** Your brand's purchases divided by total purchases on this keyword. This is the metric we will reference hundreds of times in this book. It is the clearest, most unambiguous measure of your competitive position.

#### The RYG Framework

To make Brand Analytics actionable, we need a classification system. Raw numbers are useful for analysis, but for decision-making, you need a quick visual signal that tells you: *Is this keyword healthy, threatened, or a live opportunity?*

The RYG (Red-Yellow-Green) framework provides exactly that:

🟢 **Green — Purchase Share ≥ 15 %.** You are a meaningful player on this keyword. You have earned visibility, trust, and conversion. The goal here is *defence* — maintain share, monitor competitors, and protect against erosion.

🟡 **Yellow — Purchase Share 5 % to 14 %.** The opportunity zone. You are visible enough that Amazon shows your product. Shoppers are clicking and some are buying. But you are not converting proportionally to your visibility. Something is leaking — and it is fixable. This is where the highest-leverage work happens.

🔴 **Red — Purchase Share below 5 %.** The market is buying on this keyword, and you are effectively invisible. Either you are not being shown (impression gap), not being clicked (listing quality), or not being bought (conversion gap). Red keywords split into two categories: strategic targets (high volume, worth investing to contest) and irrelevant terms (not aligned with your product, safe to ignore).

The thresholds are not sacred. For a category with one dominant player, a 10 % purchase share might be excellent. For a fragmented category with no player above 8 %, your 6 % might make you the leader. The framework provides a starting point; you calibrate it to your market.

### 2.2 Search Catalog Performance (SCP)

If SQP starts with a keyword and asks "Who wins?", SCP starts with *your product* and asks "Where does it win and lose?"

SCP shows the full conversion funnel for your ASIN:

**Impressions → Clicks → Cart Adds → Purchases.**

Each step is a potential leak. The power of SCP is not in the absolute numbers — it is in the *ratios between stages*, because each ratio diagnoses a specific type of problem:

**High Impressions, Low Clicks.** Your product is being shown, but shoppers are scrolling past it. The diagnosis is almost always a listing quality issue above the fold: main image, title, price, or rating. This is the one area where you compete before the customer ever visits your page. If your click-through rate is significantly below the category average, no amount of advertising spend will fix the root cause.

Practical fixes: Test a new main image (lifestyle vs. product-on-white vs. infographic). Shorten and restructure your title for mobile readability. Check if your price is competitive. Verify your rating is not below category threshold (typically 4.0 stars).

**High Clicks, Low Cart Adds.** Shoppers are visiting your listing but leaving without adding to cart. The diagnosis is comparison failure: something on your product detail page loses to alternatives the customer is evaluating in parallel.

Common culprits: price is higher than similar products without clear value differentiation. Review count is low relative to established competitors. Bullet points and A+ Content do not address the customer's primary concern. Delivery date is slower than Prime expectation.

**High Cart Adds, Low Purchases.** This is the most frustrating leak because the customer was *almost there*. They liked your product enough to cart it, then chose something else at checkout.

Diagnosis requires nuance. Often the cause is a competitor offering a last-minute incentive — a coupon, a Subscribe & Save discount, or a Lightning Deal. Sometimes it is delivery speed: a customer who carts two similar products at similar prices will choose the one arriving tomorrow. In some categories, it is simply that the shopper was comparison-shopping and the cart was a bookmark.

The ratio between cart adds and purchases is your "close rate." Track it weekly. If it drops, something in the competitive landscape changed.

### 2.3 PPC Search Terms Report

Your Sponsored Products campaigns generate a search terms report that shows the *actual queries* shoppers typed before clicking your ad. This is the data that bridges your marketing spend to actual customer behaviour.

The PPC report gives you:

**The actual search term.** Not the broad-match keyword you targeted, but the specific words the customer typed. This is invaluable for understanding customer language and intent.

**Attributed sales.** Revenue directly generated from clicks on this search term through your ad. This is the "what did I get?" number.

**Cost Per Click (CPC).** What you paid for each click. This varies wildly by keyword competitiveness and time of day. It is the "what did I pay?" number.

**Conversion rate.** The percentage of ad clicks that turned into purchases. This combines ad relevance, listing quality, and price competitiveness into a single number.

**Impressions and clicks.** How often your ad was shown and how often it was clicked. The ratio is your ad click-through rate — a signal of ad relevance and creative quality.

### The Golden Trio Synergy

The magic is not in any single report. The magic is in the overlay.

**SQP tells you where the market is buying.** It reveals the keywords that generate the most purchases, the purchase share distribution among competitors, and your specific position.

**SCP tells you where your funnel leaks.** It diagnoses whether you have a visibility problem, a click-through problem, a consideration problem, or a conversion problem.

**PPC Search Terms tell you what you are paying for and whether it is working.** It reveals the financial reality behind your advertising strategy — which keywords generate ROI and which are burning cash.

Cross-referencing all three is where the Growth Machine starts producing actionable intelligence:

- A keyword with high SQP volume, low brand purchase share, and zero PPC spend is a **gap** — an untapped opportunity.
- A keyword with high SQP brand share and high PPC spend is a **cannibalisation risk** — you might be paying for clicks you would earn organically.
- A keyword where SCP shows a click-to-cart leak and PPC shows low conversion is a **listing quality problem** — spending more will not fix it.
- A keyword with low SQP volume, high CPC, and low conversion is a **drain** — a candidate for budget reallocation.

This cross-referencing framework is the analytical engine of every chapter that follows.

---

## Chapter 3: Setting Up Your Machine

### Connecting Your Data to Your Decision-Making Process

The concepts in this book are universal. Any brand-registered Amazon seller can manually pull SQP data, download PPC reports, and build spreadsheet analyses. Many do. The problem is that manual analysis takes hours, creates stale data, and does not scale.

The Growth Machine approach uses an AI agent — a language model running inside your development environment — connected to a structured data layer via the Model Context Protocol (MCP). This is not about replacing your brain. It is about replacing the spreadsheet.

#### What Is MCP?

The Model Context Protocol is an open standard that allows an AI assistant (like GitHub Copilot in VSCode) to call structured tools — essentially, API endpoints — through natural-language conversation. Instead of you logging into Seller Central, navigating to Brand Analytics, downloading a CSV, opening it in Excel, and building a pivot table, you type:

*"Show me the top 20 keywords for my donut pillow by purchase share, and flag any where my share is below 10 %."*

The AI translates this into a tool call, the MCP server executes it against your synchronised data, and the result comes back in seconds — already filtered, classified, and ready for analysis.

#### The NeonPanel Data Layer

NeonPanel is the specific MCP server we use throughout this book. It connects to your Amazon Seller Central account and your Amazon Advertising account, synchronises the reports on a regular cadence, and exposes them through structured tools.

The data it unifies:

- **Brand Analytics:** SQP, SCP, Top Search Terms, Repeat Purchase behaviour.
- **Advertising:** Campaign performance, search term reports, budget and bid data.
- **Financials:** Revenue, fees, cost of goods (landed cost and FIFO), profit and loss.
- **Inventory:** Stock levels, warehouse balances, sales velocity, replenishment risk.
- **Supply Chain:** Lead times, PO recommendations, shipment tracking, arrival forecasts.

This is the nervous system of the Growth Machine. Every analysis in this book, every decision framework, every weekly ritual draws data from this unified layer.

#### Setup in Practice

**Step 1: Connect your accounts.** You integrate your Amazon Seller Central and Advertising accounts through NeonPanel's integration flow. This grants read access to your reports and data.

**Step 2: Verify your company.** NeonPanel organises data by Company (your seller entity) and Profile (your advertising profile per marketplace). Your first tool call is `list_companies` — this confirms your connection is active and returns the company identifier you will use in every subsequent call.

**Step 3: Map your product catalogue.** Use `lookup_asin_catalog` to see the Parent-to-Child ASIN mapping for your products. This is the foundation: every analysis in this book starts with knowing which ASINs belong to which product family. A parent ASIN with five colour variations needs all five children included when you pull SQP data, or your purchase share will be understated.

**Step 4: Configure your thresholds.** The RYG framework from Chapter 2 uses default thresholds (5 %, 15 %), but every category is different. Use `list_ryg_thresholds` to see the current settings and `write_ryg_thresholds` to calibrate them for your market. If your category is highly fragmented, you might set Green at 8 %. If your category has a dominant player, you might set Green at 20 %.

**Step 5: Run your first query.** The moment of truth. Ask the agent to pull your SQP data for your primary product. When the table of keywords, search volumes, and purchase shares appears — you will see your business through an entirely new lens. That feeling is the beginning.

#### A Note on Tooling Agnosticism

While this book uses NeonPanel and VSCode-based agents extensively, the analytical frameworks are tool-agnostic. You can apply the Keyword Gap Analysis, the Incrementality Framework, and the Marketing Throttle with any data source — including manual CSV downloads from Brand Analytics. The tools make it faster. The thinking is what matters.

That said: speed matters. The seller who runs this analysis in 15 minutes every Monday will outperform the seller who runs it once a quarter. Tooling is a competitive advantage when it compresses the loop.

---

# SECTION II: MARKETING & ADVERTISING ENRICHMENT

---

## Chapter 4: The Keyword Gap Analysis

### Finding High-Volume Terms Where Your Brand Share Is Below 10 %

If you take only one concept from this entire book, take this one.

The Keyword Gap is the distance between where the market is buying and where your brand is showing up. It is the single most actionable output of the Growth Machine, because it answers the question every seller should be asking but few articulate clearly: *Where are customers searching, finding, and buying products like mine — but not buying mine?*

Every keyword where customers are purchasing and your brand is absent or underrepresented is a gap. Every gap is revenue you are leaving on the table. Not theoretical revenue — actual purchases happening right now, going to your competitors, on keywords you could compete for.

#### Why Gaps Exist

Gaps exist for one of four reasons, and the reason determines the response:

**1. You are not indexed.** Amazon's search algorithm has not connected your product to this keyword. Your listing's content — title, bullet points, backend search terms, A+ text — does not include the relevant terms or close semantic matches. Your product literally does not appear in search results for this keyword.

*Response:* Update your listing content to include the keyword naturally. This is the simplest and highest-ROI fix.

**2. You are indexed but buried.** Your product appears on page 3 or 4 — effectively invisible to most shoppers. You have some impressions but near-zero clicks. Your organic rank is too low to matter, and you are not running ads on this term.

*Response:* Launch a Sponsored Products campaign targeting this keyword to gain visibility while organic rank builds.

**3. You are visible but not clicked.** You appear on page 1 or 2, but shoppers choose other products. Your main image, title, price, or rating is losing the quick comparison.

*Response:* Analyse your SCP click-through rate versus the category. Test listing elements. This is a content problem, not a keyword problem.

**4. You are clicked but not bought.** Shoppers visit your listing and leave. Your price, reviews, or product detail page is losing the final comparison.

*Response:* Deep listing audit. Competitive analysis. Possibly pricing strategy adjustment.

The Keyword Gap Analysis identifies the gaps. The funnel diagnosis tells you which type of gap it is. The combination tells you exactly what to do.

#### The Method: Five Steps

**Step 1: Pull SQP Data.**

This is the foundation of the entire analysis. Using the Brand Analytics search query performance report, we retrieve all search terms where your ASIN appeared in search results during the period.

The output includes:
- Every keyword where your product was shown.
- Search volume for each keyword.
- Your impression share, click share, cart share, and purchase share.
- The RYG classification based on your configured thresholds.

This single data pull gives you the complete map of your competitive position across every keyword where you currently have any presence.

**Step 2: Filter for the Gap.**

From the full keyword list, we isolate the terms matching two criteria:

*High Search Volume.* We want keywords that represent meaningful market size. The exact threshold depends on your category. In a large category like "pillow," keywords with 10,000+ monthly searches are the primary targets. In a niche category like "ergonomic knee pillow," 2,000 searches might be significant. As a starting heuristic, filter for the top quartile of keywords by search volume.

*Low Brand Share.* Keywords where your Purchase Share is below 10 % — or whatever threshold you calibrated as "Red" in your RYG framework. These are keywords where the market is buying but you are not capturing a meaningful portion.

The intersection of these two filters is your Gap List: high-opportunity, low-performance keywords.

**Step 3: Diagnose the Funnel.**

For each gap keyword, we drill into the funnel to understand exactly *where* you are losing. This uses keyword-level funnel metrics to break down the conversion path:

- **Impression Share:** Are you being shown? If your impression share is below 5 %, you have a visibility problem. You either are not indexed or are buried too deep.
- **Click-Through Rate (relative to market):** Are you being clicked when shown? If your CTR is significantly below the average for that keyword, your above-the-fold listing elements need work.
- **Cart Add Rate:** Are you being considered? If clicks are healthy but cart adds are low, your product detail page is losing the comparison.
- **Purchase Rate:** Are you closing? If cart adds are healthy but purchases drop off, you are losing at the final stage — likely to price, delivery speed, or a competitor's coupon.

Each diagnosis points to a different intervention. There is no point launching PPC on a keyword where your listing's click-through rate is below average — you will pay for traffic that does not convert. Fix the listing first.

**Step 4: Cross-Reference Momentum.**

Not all keywords are worth pursuing. A keyword with 20,000 monthly searches that is declining 15 % month-over-month is not the same opportunity as a keyword with 10,000 searches growing at 25 %.

The momentum analysis categorises each gap keyword:

- **Accelerating:** Search volume is growing week-over-week. This keyword is becoming more important to the market. Priority target.
- **Stable:** Volume is flat. Reliable opportunity, but no urgency premium.
- **Declining:** Volume is shrinking. Unless you see a seasonal pattern (it will rebound), deprioritise.

We also look for *emerging* keywords — terms with relatively low current volume but sharp growth curves. These are the next wave. Being early on an emerging keyword means cheaper CPCs and easier organic ranking before the rest of the market catches on.

**Step 5: Check Competitive Density.**

The final filter: who currently owns each gap keyword, and how entrenched are they?

The competitive landscape analysis shows the top three products on each keyword and their respective purchase shares. This creates a contestability score:

- **Fragmented keyword:** No single product holds more than 15 % purchase share. The market is dispersed. You can break in with moderate investment.
- **Weak leader:** One product leads with 15–30 %, but the remaining share is spread among many. The leader is not dominant. You can challenge with a differentiated approach.
- **Dominant leader:** One product holds 40 %+ purchase share. Breaking through is expensive and uncertain. Only pursue if this keyword is strategically essential or if you have a genuinely differentiated product.
- **Duopoly/Oligopoly:** Two or three products split the market. Entry requires either displacing one of them or finding an angle they have not covered.

Contestability does not mean you avoid dominant keywords entirely. It means you prioritise your limited budget on keywords where the chance of meaningful share gain is highest.

#### The Output: Your Gap Report

The end product of this analysis is a prioritised keyword list — your strategic target list. Each keyword has:

1. **Search Volume** — the size of the prize.
2. **Current Purchase Share** — where you stand today.
3. **Gap Size** — the distance between your current share and a meaningful target (e.g., 15 %).
4. **Funnel Diagnosis** — impression gap, click gap, cart gap, or purchase gap.
5. **Momentum** — accelerating, stable, or declining.
6. **Contestability** — fragmented, weak leader, or dominant.
7. **Recommended Action** — targeting via PPC, listing optimisation, indexing fix, or pricing adjustment.

This list feeds directly into three workstreams:

- **PPC targeting:** Add the top gap keywords to your Sponsored Products campaigns.
- **Listing optimisation:** Fix click-through or conversion issues identified in the funnel diagnosis.
- **A+ Content strategy:** Create content modules that address the customer concerns surfaced by the gap analysis.

The list is not static. You regenerate it weekly as part of the Governance Loop (Chapter 9), and you track how your share moves on each target keyword over time.

---

## Chapter 5: Advertising vs. Organic

### Proving Whether PPC Is Cannibalising or Growing Your Market Share

Every Amazon seller running advertising faces the same nagging question: *Am I paying for clicks I would have gotten for free?*

The question is not paranoia. It is a legitimate strategic concern backed by a simple economic reality. If your product already ranks #1 organically on a branded keyword and you are also running Sponsored Products on that same keyword, a meaningful percentage of the shoppers clicking your ad would have clicked your organic listing anyway. You are paying for nothing.

The flip side is equally important. If your product is invisible organically on a high-volume generic keyword, and PPC is the only reason shoppers see your listing, then every ad click is genuinely incremental. Cutting that spend would directly cost you sales.

The difference between these two scenarios is the difference between wasting money and investing it. The Growth Machine gives you the framework to tell them apart.

#### The Data You Need

This analysis requires two data sources side by side:

**From SQP:** Your brand's click share and purchase share on each keyword. This reflects your *total* performance — organic and paid combined, as seen from the market level.

**From PPC Search Terms:** Your ad spend, ad clicks, and attributed sales on each keyword. This reflects your *paid* performance specifically.

The gap between total brand performance (SQP) and paid performance (PPC) reveals your organic performance. And the ratio between paid and total reveals how dependent you are on advertising for each keyword.

#### The Three Scenarios

**Scenario 1: The Waste Scenario.**

A keyword where your brand dominates organically, but you are also spending heavily on ads.

The telltale pattern:
- SQP shows high brand click share — say 65 % or more. You own this keyword organically.
- PPC shows significant spend and clicks on the same keyword.
- The keyword is often a branded term ("your brand name + product") or a long-tail term where you rank #1 organically.

What is happening: shoppers would have found and clicked your product anyway. The ad is a redundant signpost on a road that already leads to your door.

**The nuance:** this does not mean you should always pause branded ads. There is a defensive argument — if you do not bid on your own brand name, a competitor will, and they may siphon 5–10 % of your branded traffic. The question is whether the cost of defence is proportional to the risk. If you are spending $500/month defending a keyword where you hold 70 % organic share, the economics may not justify it — unless a competitor is actively attacking.

*Action:* Reduce bids to the minimum necessary to maintain top-of-search presence as a defensive position. Redirect the liberated budget to gap keywords identified in Chapter 4.

**Scenario 2: The Growth Scenario.**

A keyword where your brand has weak organic presence, but PPC is driving meaningful sales.

The telltale pattern:
- SQP shows low brand click share — below 15 %. Without ads, you are barely visible on this keyword.
- PPC shows the keyword is one of your top performers by attributed sales.
- Organic rank is low (page 2+) or non-existent.

What is happening: PPC is your *only* presence on this keyword. Every ad click is genuinely incremental — these are sales you would not have made without advertising.

*Action:* Maintain or increase spend. This keyword is a growth investment. Monitor whether sustained sales velocity from PPC begins building organic rank (the flywheel effect — covered in Scenario 3).

**Scenario 3: The Flywheel Scenario.**

The dream outcome. A keyword where you invested in PPC, gained sales velocity, and that velocity began pulling your organic rank upward.

The telltale pattern:
- Historically, SQP showed low brand share. You launched aggressive PPC.
- Over 4–8 weeks, brand click share and purchase share in SQP began rising.
- Your organic position improved (more impressions, more organic clicks).
- PPC attributed sales remain strong, but organic sales are now contributing a growing share.

What is happening: the flywheel is spinning. PPC-driven sales velocity signalled to Amazon's algorithm that your product is relevant for this keyword, and the algorithm rewarded you with improved organic rank. Now organic traffic is compounding on top of your paid traffic.

*Action:* This is the point where you begin gradually reducing PPC spend — not cutting it off, but easing it down as organic takes over. The key metric to watch is the crossover point: the week when your organic purchase share on this keyword exceeds your paid contribution. After that, PPC becomes maintenance, and you can redirect budget to the next flywheel target.

#### The Incrementality Score

To move beyond qualitative scenarios to a quantitative metric, we calculate an Incrementality Score for each keyword:

```
Incrementality = (Paid Clicks ÷ Total Brand Clicks) × (1 − Organic Rank Factor)
```

Where:
- **Paid Clicks** = clicks attributed to ads on this keyword (from PPC report).
- **Total Brand Clicks** = total brand clicks on this keyword (from SQP).
- **Organic Rank Factor** = Brand Click Share from SQP (a proxy for organic strength).

**Interpreting the score:**
- **Score near 1.0:** PPC is almost entirely incremental. Without ads, you would have no presence. This is a Growth keyword.
- **Score near 0.5:** PPC is contributing, but you also have organic traction. This is a Flywheel keyword — monitor the trend.
- **Score near 0.0:** PPC is largely redundant. Your organic presence captures most of the traffic anyway. This is a potential Waste keyword.

The score is a heuristic, not a gospel. It does not account for defensive bidding or competitor behaviour. But it gives you a quick numerical triage across hundreds of keywords, letting you focus your attention on the ones where the strategic question is most impactful.

#### Building the Incrementality Matrix

For your weekly analysis, build a matrix of all keywords with both SQP and PPC data:

| Keyword | SQP Purchase Share | PPC Spend | Incrementality Score | Scenario | Action |
|---|---|---|---|---|---|
| brand name pillow | 72 % | $420/mo | 0.08 | Waste | Lower bids |
| memory foam pillow | 4 % | $1,200/mo | 0.91 | Growth | Maintain |
| orthopedic pillow for neck | 12 % | $600/mo | 0.45 | Flywheel | Monitor |
| best pillow for side sleepers | 2 % | $0 | N/A | Gap | Launch campaign |

This matrix connects directly to the Gap Report from Chapter 4 (keywords with zero PPC spend are gaps) and informs the budget reallocation decisions that drive efficient growth.

---

## Chapter 6: The Search Term Goldmine

### Merging PPC Reports with Market Data to Find Blue Oceans

The most profitable keywords in your category might be the ones nobody is fighting over yet. Not because they lack volume or purchase intent — but because the dominant advertising strategy on Amazon is reactive, not proactive.

Most sellers build their keyword lists by mining their own PPC search terms report: they look at what is already working, add close variants, and incrementally expand. This is like fishing in a pond you already know — you will catch some fish, but you will never discover the lake over the hill.

The Blue Ocean analysis finds the lake.

#### Discovery Logic: The Category Gap

The concept is simple: a keyword exists with high search volume and strong purchase intent in Brand Analytics data, but your PPC campaigns have *zero spend* on it. You are not advertising on it. You may not even be indexed for it. Meanwhile, thousands of shoppers are searching this term every month and buying products exactly like yours.

How to find these keywords systematically:

**Step 1:** Pull your SQP data to get every keyword where your ASIN has any market presence. This is your "visible universe" — keywords where Amazon already associates your product.

**Step 2:** Pull your PPC search terms data to get every keyword you are actively bidding on. This is your "active universe" — keywords where you are investing.

**Step 3:** Pull the top search terms for your category. This is the "total universe" — all keywords that matter in your market.

**Step 4:** Calculate two sets:
- **Set A:** Keywords in the total universe that are NOT in your visible universe. These are terms the market cares about that Amazon does not currently associate with your product. You may need indexing fixes or listing content updates.
- **Set B:** Keywords in your visible universe (you have some SQP data) that are NOT in your active universe (zero PPC spend). These are terms where you have some organic presence but are not investing to grow.

Both sets contain opportunities. Set B is typically the faster win because you are already indexed — you just need to add the keyword to your campaigns. Set A requires foundational work (listing updates, backend keywords) before advertising will be effective.

#### Efficiency Signal: High Purchase Share, Low CPC

Not all Blue Ocean keywords are about discovery. Some are hiding in plain sight in your own PPC data, delivering outsized value that you have not noticed because your reporting focuses on different metrics.

The Efficiency Signal finds keywords where two conditions converge:

- **High purchase share in SQP.** The market actively buys on this keyword, and your share is healthy or growing.
- **Low CPC in PPC.** Competition is not bidding aggressively on this keyword, keeping your cost per click low.

This is an arbitrage opportunity. You are getting cheap access to a keyword where the market is buying. The reason most sellers miss it: they optimise on ROAS or ACoS within their ad console, which treats all keywords as equal-weight. They never overlay market-level purchase data to see which cheap keywords are actually valuable.

*Action:* Increase budget allocation to these keywords. They are your most efficient growth levers. But monitor CPC trends — if competitors start bidding, the arbitrage window closes.

#### Cross-Sell Discovery: The Indirect Path

Not all customer journeys are direct. A shopper searching for "pregnancy pillow" might also buy a "nursing pillow" or a "body pillow cover." These are cross-sell pathways — indirect routes to your product through related keywords.

The cross-sell analysis reveals keywords where shoppers searching for Product A frequently also purchase Product B. If Product B is yours but you are not targeting Product A's keywords, you have discovered an untapped channel.

This is particularly powerful for sellers with multiple products in adjacent categories. Your nursing pillow can capture traffic from pregnancy pillow keywords, your pillow protector can capture traffic from memory foam pillow keywords. These cross-sell keywords often have lower competition because sellers tend to target only the keywords directly describing their own product.

#### Building the Blue Ocean Map

The synthesis of all three discovery methods produces a Blue Ocean Map:

| Keyword | Source | Monthly Volume | Current PPC Spend | Purchase Share | CPC Estimate | Priority |
|---|---|---|---|---|---|---|
| contour pillow for sleeping | Category Gap | 15,000 | $0 | 0 % (not indexed) | $0.85 | High — index first |
| pillow for shoulder pain | Visible but untargeted | 8,000 | $0 | 3 % | $0.72 | High — launch campaign |
| soft foam pillow | Efficiency Signal | 12,000 | $180/mo | 11 % | $0.45 | High — increase budget |
| pregnancy pillow replacement cover | Cross-sell | 4,000 | $0 | 0 % | $0.38 | Medium — test |

This map becomes a permanent artefact of your Growth Machine, updated weekly, and the primary source for campaign expansion decisions.

---

# SECTION III: THE OPERATIONS & PROFITABILITY GEARBOX

---

## Chapter 7: True Unit Economics

### Using Landed Cost to Set Your Maximum Aggressive Bid

Every framework in Sections I and II assumed that your business can afford to compete. This chapter confronts the constraint that determines *how aggressively* you can compete: your actual unit economics.

Amazon Seller Central shows you revenue and fees. Your advertising console shows you ad spend. Neither knows your manufacturing cost, your sea freight rate, your customs duties, your inspection fees, or your inland logistics. Until you unify all three layers — revenue, Amazon costs, and true cost of goods — your "profitability" number is fiction. And making growth decisions based on fictional margins is how sellers scale themselves into bankruptcy.

#### The Problem with Amazon's Profitability View

Seller Central's "Business Reports" show you ordered units, revenue, and a rough breakdown of FBA fees and commissions. Your ad console shows campaign spend. If you subtract ad spend from (revenue minus fees), you get something that looks like profit.

It is not profit.

It is revenue minus the costs Amazon knows about. It excludes:

- **Manufacturing cost per unit.** What you actually paid your factory.
- **Freight.** Sea freight, air freight, or courier, allocated per unit.
- **Customs duties.** Import tariffs specific to your product's HS code.
- **Inspection fees.** Pre-shipment quality control, allocated per batch.
- **Insurance.** Marine cargo insurance, typically 0.3–0.5 % of shipment value.
- **Inland transport.** Factory to port, port to warehouse, warehouse to FBA.
- **Labelling and prep.** If you use a prep centre, the per-unit handling fee.

For a typical private-label product with a $25 selling price, these excluded costs might total $6–8 per unit. Ignoring them overstates your margin by 24–32 %. That margin error compounds across every decision you make.

#### The True Contribution Margin Formula

```
True Contribution Margin = Selling Price − FBA Fees − Referral Commission − Landed Cost
```

Where **Landed Cost** encompasses every cost from factory floor to Amazon's fulfilment centre warehouse, allocated per unit:

```
Landed Cost = Manufacturing + Freight + Duties + Insurance + Inspection + Inland Transport + Prep
```

The True Contribution Margin is what remains *before advertising*. It is the maximum you can spend on acquiring a customer on this SKU and still break even. Everything above this margin is profit. Everything below is a deliberate investment in market share — which may be strategic, but must be conscious.

#### Pulling Landed Cost Data

The NeonPanel data layer allows you to store and retrieve landed cost data per SKU. Use `get_inventory_landed_cost` to pull the current per-unit cost breakdown. If you have not yet entered your COGS data, this is the prerequisite — without it, every profitability analysis in this chapter and beyond is a guess.

To see the full financial picture, use `analyze_profit_and_loss`, which combines Amazon's revenue and fee data with your COGS to produce a complete P&L view. This shows you net margin per product *after* all costs including advertising.

#### Setting Your Maximum Aggressive Bid

With True Contribution Margin in hand, the advertising bidding question transforms from "What CPC feels reasonable?" to "What CPC does my unit economics support?"

The formula:

```
Maximum Break-Even CPC = True Contribution Margin × Conversion Rate
```

Where:
- **True Contribution Margin** = from the formula above, per unit.
- **Conversion Rate** = the percentage of ad clicks that result in a purchase (from your PPC data).

Example:
- Selling Price: $29.99
- FBA Fees: $6.50
- Referral Commission: $4.50
- Landed Cost: $7.20
- **True Contribution Margin: $11.79**
- Conversion Rate: 14 %
- **Max Break-Even CPC: $11.79 × 0.14 = $1.65**

You can bid up to $1.65 per click on any keyword and break even on every sale that results. Bidding $1.00 gives you $0.65 profit per ad-driven sale. Bidding $2.00 means you are investing $0.35 per sale into market share growth — acceptable as a short-term strategy, unsustainable as a permanent position.

This number is your financial guardrail. Every bid recommendation from the Growth Machine is constrained by it.

#### FIFO and Batch Cost Reality

There is a subtlety that most profitability models ignore: your cost of goods is not static. Each inventory shipment arrives with a different landed cost. Sea freight rates fluctuate. Factory prices change. Exchange rates move. If your January shipment had a $6.00 landed cost and your March shipment has an $8.50 landed cost, your margin is different depending on which batch is currently selling.

FIFO (First In, First Out) cost analysis addresses this. Use `analyze_fifo_cogs` to track how your effective COGS changes as different batches sell through. A high-cost shipment temporarily depresses your margin until it sells out and cheaper inventory takes over. This matters for:

- **Bid timing:** You might want to bid less aggressively during a high-COGS period and ramp up when cheaper inventory is available.
- **Pricing decisions:** If your current batch has unusually high COGS, raising your price slightly may be more profitable than absorbing the margin hit.
- **Profit tracking:** Your weekly P&L should use the FIFO cost for the units actually sold, not a blended average, to avoid overstating or understating profitability.

---

## Chapter 8: Stockout Prevention

### Ensuring Your Growth Machine Does Not Run Out of Fuel

This is the chapter that saves you from yourself.

Everything in this book is designed to accelerate growth — find more keywords, capture more market share, spend more efficiently, convert more shoppers. All of that is worthless if you run out of inventory.

A stockout is not just a missed sale. It is a compound loss:

- **Immediate revenue loss.** Every day out of stock is a day of zero sales on that ASIN.
- **Organic rank erosion.** Amazon's algorithm weighs recent sales velocity heavily. A stockout craters your velocity, and your organic rank drops. When you restock, you are climbing back from a lower position.
- **Buy Box loss.** If you have a multi-channel or wholesale listing, Amazon may shift the Buy Box to another seller during your stockout.
- **Review velocity stall.** No sales means no new reviews. In competitive categories, a two-week review drought is noticeable.
- **Competitor absorption.** Your traffic does not disappear — it goes to the next product in the search results. Your competitor's velocity increases, their rank improves, and they occupy the position you vacated. You are now competing against a stronger opponent when you return.

The worst outcome: you invested heavily in PPC to build momentum on a key keyword, your velocity spiked, your organic rank rose — and then you ran out of stock. The PPC spend is gone. The organic rank will decay. The competitor who was below you has now overtaken you. You have to start the flywheel from scratch.

The Marketing Throttle prevents this.

#### The Marketing Throttle

The Growth Machine has a built-in throttle mechanism that links advertising aggressiveness to inventory health. It is a simple table, but it prevents the single most expensive mistake in Amazon selling:

| Days of Supply (DOS) | Mode | What It Means |
|---|---|---|
| **> 45 days** | 🟢 **Aggressive Mode** | Plenty of inventory. Run full budgets, competitive bids, launch new keyword tests, expand to new match types. This is the growth window — use it. |
| **20–45 days** | 🟡 **Maintenance Mode** | Adequate but tightening. Hold current campaigns steady. No new keyword launches. No bid increases. Focus on efficiency — maintain current share without accelerating burn rate. |
| **< 20 days** | 🔴 **Conservation Mode** | Danger zone. Reduce bids by 30 %. Pause all discovery and broad-match campaigns. Keep only your highest-converting exact-match keywords running. The goal is to stretch inventory until replenishment arrives. |
| **< 10 days** | ⛔ **Emergency Mode** | Critical. Pause all advertising except branded terms (to prevent competitor conquest of your own brand name). Accept that sales velocity will drop. Preserve every unit for organic sales, which have zero marginal cost. |

The throttle is not optional. It is a hard rule in the Growth Machine. No bid increase, no budget expansion, no new keyword launch is ever approved without first checking inventory health.

#### Checking Inventory Health

Three data points combine to give you the full picture:

**Stock Replenishment Risk.** Use `list_stock_replenishment_risk_items` to get a list of all SKUs with their current inventory levels and risk classification. This is your first-pass filter — it immediately tells you which SKUs are in which throttle mode.

**FBA Replenishment Candidates.** Use `list_fba_replenishment_candidates` to see which SKUs need inventory sent to FBA. If a SKU is in Maintenance or Conservation mode, getting replenishment moving becomes the priority.

**Sales Velocity.** Use `analyze_sales_velocity` to validate the current burn rate. Days of Supply is only meaningful if the velocity assumption is accurate. If you just launched an aggressive campaign and velocity doubled, your DOS calculation based on the old velocity is dangerously optimistic. Always use the most recent velocity data.

#### Lead-Time Buffer and the Last Launch Date

The Marketing Throttle tells you when to slow down. The Lead-Time Buffer tells you when you needed to have acted to avoid slowing down at all.

Every product has a lead time: the total number of days from placing a purchase order to receiving inventory at Amazon's fulfilment centre.

```
Total Lead Time = Manufacturing Time + Transit Time + Receiving Time + Safety Buffer
```

Where:
- **Manufacturing Time:** Days from PO to factory shipment. Typically 15–30 days for standard products.
- **Transit Time:** Days from factory to Amazon. Sea freight is 25–40 days. Air express is 5–7 days.
- **Receiving Time:** Days from delivery at FBA to available for sale. Currently 7–14 days in most categories.
- **Safety Buffer:** An additional buffer for delays. 7 days is a reasonable minimum.

Use `list_product_logistics_parameters` to pull these lead times from your data.

**The Last Possible Date to Launch an Aggressive Campaign:**

```
Last Launch Date = Estimated Stockout Date − Total Lead Time
```

If your stockout date is June 1 (based on current velocity and inventory), and your total lead time is 52 days, you need to have placed a PO by April 10. If today is April 15 and no PO has been placed, you will stock out and there is nothing you can do except switch to Conservation Mode and start expediting.

Use `list_po_placement_candidates` to see which POs should be placed now, and `shipment_arrival_oracle` to track inbound shipments already in transit.

#### Integrating the Throttle into the Governance Loop

The Marketing Throttle check is the *first* step in every weekly governance ritual (Chapter 9), not the last. Before you even look at keyword opportunities or incrementality scores, you check inventory health for every SKU. The throttle mode determines the boundary conditions for all subsequent decisions that week.

A beautiful keyword gap analysis is worthless if you are 14 days from stockout.

---

# SECTION IV: THE WEEKLY GOVERNANCE LOOP

---

## Chapter 9: The Weekly Governance Ritual

### Transforming Data into a Perpetual Motion Machine

You have the tools. You have the frameworks. You have the data pipeline. Now comes the part that separates the sellers who grow from the sellers who analyse once and then forget about it for three months.

The Growth Machine is not a one-time audit. It is not a quarterly review. It is a weekly ritual — a structured cadence that turns data into decisions, decisions into actions, and actions into measurable outcomes. The loop is the machine. Everything else is just components.

#### Why Weekly?

Not daily. Not monthly. Weekly.

**Why not daily?** Amazon's data has a 48–72 hour reporting lag. Brand Analytics data is aggregated weekly. PPC data shows attributions over a 7-day or 14-day window. Reacting to daily fluctuations means reacting to noise, not signal. Daily adjustments create oscillation — bid up, bid down, bid up — that produces worse results than steady-state bidding.

**Why not monthly?** A month is too long to detect and respond to competitive shifts. If a new competitor enters your top keyword and starts gaining share, four weeks of unchecked erosion can cost you organic rank that takes months to rebuild. Weekly cadence is fast enough to catch problems and slow enough to see real trends.

**Why not fortnightly?** You can do every other week if your category is stable and you have limited bandwidth. But the sellers who grow fastest run the weekly loop. Consistency compounds.

#### The Five-Step Ritual

Every Monday morning. Same time. Same sequence. Non-negotiable.

**Step 1: Inventory Health Check (The Throttle)**

Before any marketing analysis, check your inventory. Pull stock levels, velocity, and days of supply for every active SKU. Assign each SKU its throttle mode (Aggressive, Maintenance, Conservation, Emergency). This sets the constraints for everything that follows.

If any SKU has moved from Aggressive to Maintenance since last week, investigate immediately — did velocity spike? Did a restock get delayed? Is a shipment in transit that will relieve the pressure?

Document the inventory status. This is your Week N baseline.

**Step 2: Review Last Week's Actions**

Open your action log from Week N−1. For each action you took — each bid change, budget shift, keyword launch, listing edit — ask:

*Did the predicted outcome occur?*

If you increased your bid on "memory foam pillow" from $0.80 to $1.10 with the hypothesis that purchase share would increase by 2 %, check the SQP data. Did purchase share move? By how much? Did CPC stay where you expected, or did competition drive it higher?

For each action, record:
- **Hypothesis:** What you predicted.
- **Outcome:** What actually happened.
- **Learning:** What you now know that you did not know before.

This is the feedback loop that transforms a static analysis into a learning system. Over time, you build an institutional memory of what works in your specific market. "In our category, a $0.30 bid increase typically produces a 1.5 % purchase share gain within two weeks." That kind of calibration is priceless and can only come from recording and reviewing outcomes.

**Step 3: Run the Full Data Pull**

Execute the Growth Machine data extraction for the current week:
- SQP data (purchase share, click share, RYG classification).
- SCP data (funnel metrics per ASIN).
- PPC search terms (spend, CPC, attributed sales).
- Financial snapshot (revenue, COGS, margins).

Compare to Week N−1 baseline. Calculate deltas:
- Purchase Share: ▲ or ▼ for each target keyword.
- Click Share: trending direction.
- TACoS (Total Advertising Cost of Sale): tightening (good) or loosening (investigate).
- Inventory health: any items that moved between throttle modes.

Flag any delta greater than your threshold (e.g., purchase share change > 2 %, TACoS change > 1.5 percentage points) for investigation.

**Step 4: Generate This Week's Actions**

With the delta analysis complete, generate a new action list:

*New gap keywords identified:* A keyword that was not in last week's gap report has appeared — perhaps a seasonal trend is emerging, or a competitor's listing update exposed a new keyword. Add it to a campaign.

*Cannibalisation detected:* Your incrementality analysis shows a keyword where organic share has grown to the point that PPC is now mostly redundant. Reduce bids, redirect budget.

*Stockout risk escalation:* A SKU moved from Aggressive to Maintenance. No new keyword launches this week. Check PO status.

*Funnel leak found:* SCP shows your click-through rate on a top keyword dropped 15 % this week. A competitor may have updated their main image or lowered their price. Investigate and plan a response.

*Blue Ocean candidate:* A new high-volume keyword appeared in the top search terms that has zero overlap with your active campaigns. Schedule a test campaign.

For each action, record:
- **What:** The specific change (e.g., "Increase bid on 'orthopedic pillow' from $1.00 to $1.25").
- **Why:** The data that prompted it (e.g., "Purchase share dropped from 8 % to 6 %, competitive landscape shows weak leader at 14 %").
- **Hypothesis:** The expected outcome (e.g., "Purchase share will recover to 8 % within two weeks").
- **Constraint check:** Inventory mode is Aggressive, True Contribution Margin supports a Max CPC of $1.65.

**Step 5: Execute and Log**

Implement the changes. Update bids. Adjust budgets. Launch campaigns. Update listings.

Log every action with a timestamp. Close the loop. Wait seven days.

#### The Compounding Effect

The first iteration of the loop produces rough insights. The second iteration is slightly better because you have one week of hypothesis-vs-outcome data. By the eighth week, you have two months of calibrated learning about your specific market.

After a quarter, the Growth Machine is not just analysing — it is *predicting*. You know that a certain keyword responds to bid increases within 10 days. You know that another keyword's purchase share is seasonal and peaks in September. You know that your competitor typically drops prices when their review count hits a milestone.

This accumulated intelligence is the true competitive advantage. The data is available to every brand-registered seller. The tools are available to anyone willing to set them up. But the compounded learning of 12 or 24 weekly cycles — that belongs only to you.

---

# SECTION V: THE PERSISTENT BRAIN

---

## Chapter 10: The Experience Engine

### Building Long-Term Memory for Your Growth Machine

A Growth Machine without memory is a Growth Session. You run the analysis, get insights, make decisions, and then close your laptop. Next Monday, you start from scratch. The insights from last week are half-remembered. The hypothesis you tested has no recorded outcome. The competitive shift you noticed gets re-discovered three weeks later when it has already caused damage.

Memory transforms a session into an engine. An engine that accumulates experience, refines its models, and produces increasingly accurate predictions over time.

#### What the Machine Needs to Remember

**The Action Log.**

Every action taken as part of the Growth Machine loop needs to be recorded with enough context to evaluate its outcome:

- **Timestamp.** When the action was taken.
- **Action Type.** Bid change, budget change, keyword addition, keyword pause, listing update, pricing change.
- **Target.** The keyword, campaign, ASIN, or SKU affected.
- **Before State.** The pre-change value (e.g., bid was $0.80).
- **After State.** The post-change value (e.g., bid is now $1.10).
- **Hypothesis.** The expected outcome and timeframe (e.g., "Purchase share on 'memory foam pillow' will increase from 7 % to 9 % within 14 days").
- **Data Context.** The data that prompted the action (competitve landscape, funnel diagnosis, etc.).

**The Hypothesis Result Log.**

After the appropriate waiting period (typically 7–14 days), the system checks each hypothesis:

- **Predicted Outcome.** What you expected.
- **Actual Outcome.** What happened.
- **Delta.** The gap between prediction and reality.
- **Confidence Adjustment.** Based on accuracy, the machine adjusts how much weight to give similar recommendations in the future.
- **Causal Notes.** Any confounding factors (a Prime Day sale skewed the data, a competitor ran out of stock, a new competitor entered the market).

Over time, this log builds a calibration curve. If your bid-increase hypotheses are consistently 30 % optimistic, the machine learns to discount future predictions accordingly.

**The Weekly Snapshot Archive.**

Every Monday, the Growth Machine captures a snapshot of all key metrics:

- Purchase share per target keyword.
- Click share per target keyword.
- TACoS (total advertising cost of sale).
- Days of supply per SKU.
- Revenue and margin per product.
- Active campaigns and total ad spend.

The snapshot archive enables trend analysis and seasonality detection. When your purchase share dips in March, you can check whether it dipped in March last year too. When your CPC spikes in November, the archive shows the Q4 pattern and lets you plan budget accordingly.

#### Where to Store It

The memory layer has three tiers, from lightest to most persistent:

**Tier 1: Session Memory (In-Conversation).**

During a Growth Machine session, the AI agent maintains working context — the data it has pulled, the analysis it has performed, the actions it has recommended. This disappears when the conversation ends. It is useful for within-session coherence but provides no cross-session learning.

**Tier 2: NeonPanel Reporting Layer.**

NeonPanel already stores historical Brand Analytics data, financial statements, inventory records, and advertising reports. The reporting infrastructure — accessible via `list_reports` and `get_report_details` — provides the raw historical data that the Growth Machine analyses. This is your read-only historical archive.

**Tier 3: External Action Database.**

The Action Log and Hypothesis Result Log need a dedicated store outside of NeonPanel and outside of session memory. Options include:

- **A simple spreadsheet** (Google Sheets, Excel) with structured columns matching the fields above. Low-tech, easy to maintain, searchable.
- **A database** (Supabase, Airtable, Notion database) for more structured querying. Useful once you have 50+ logged actions and want to filter by action type, keyword, or outcome.
- **A markdown file in your workspace** committed to version control. The simplest option if you are already working in VSCode — create an `action-log.md` and append to it each week.

The important thing is not the tool. It is the discipline. If you do not log the action and the hypothesis, you cannot evaluate the outcome. If you do not evaluate outcomes, the machine does not learn. If the machine does not learn, you are doing the same analysis from scratch every week — slightly better informed by experience, but without the quantitative calibration that turns a good analyst into a precision instrument.

---

# SECTION VI: THE NEONASPHERA AGENT

---

## Chapter 11: The Master Agent

### System Prompt and Decision Chain

Everything in this book — the frameworks, the analysis methods, the governance ritual — can be performed manually. You can pull data, build spreadsheets, and make decisions with your own brain. Many successful sellers do exactly that.

The NeonaSphera Agent is for sellers who want to automate the analytical layer and reserve their brain for strategic decisions. It is an AI orchestration layer that follows a strict protocol, pulling data, applying the frameworks from this book, checking constraints, and generating prioritised recommendations.

It is not a chatbot. It does not hallucinate strategy. It follows a defined decision chain, always grounded in data, always constrained by your operational reality.

#### The System Prompt

The system prompt defines the agent's identity, objective, and operating rules. Think of it as the job description for your AI analyst:

```
You are the NeonPanel Growth Architect. Your objective is the systematic 
expansion of market share while maintaining profitability for the brand 
you serve.

Operating Principles:
1. Data first. Every recommendation must cite the specific data point 
   that supports it. Never speculate.
2. Constraints are non-negotiable. Never recommend spend increases 
   without checking inventory health. If a SKU is in Conservation or 
   Emergency mode, no growth actions are permitted for that SKU.
3. Hypotheses are explicit. Every action recommendation includes a 
   predicted outcome, a timeframe, and a measurable metric to evaluate 
   success.
4. Cost is truth. Use True Contribution Margin (including landed cost) 
   for all profitability calculations, never Amazon's incomplete view.
5. Competitive context matters. Never recommend bid reductions without 
   checking the competitive landscape for that keyword. A bid cut on a 
   contested keyword may cede share to an aggressive competitor.

For every analysis, follow this sequence:
1. Snapshot — Collect current data across all domains.
2. Constraint Check — Verify inventory and financial constraints.
3. Opportunity Scan — Apply keyword gap, incrementality, and blue ocean 
   frameworks.
4. Action Generation — Produce a prioritised, constrained action list.
5. Logging — Record all findings and recommendations for future review.
```

This prompt ensures the agent never free-associates about strategy. It follows the same decision chain every time, producing consistent, auditable output.

#### The Decision Chain in Detail

**Phase 1: Snapshot.**

The agent pulls the complete data set:
- Brand Analytics: SQP (keyword performance), SCP (funnel metrics).
- Advertising: Campaign performance, search terms.
- Inventory: Stock levels, velocity, days of supply, risk items.
- Financials: Revenue, COGS, margins, P&L.

This is the raw material for all subsequent analysis.

**Phase 2: Constraint Check.**

Before identifying any opportunities, the agent checks hard constraints:

*Inventory:* For each SKU, calculate Days of Supply and assign a throttle mode. Any SKU in Conservation or Emergency mode is flagged immediately — no growth actions will be recommended for that SKU.

*Financial:* Calculate True Contribution Margin per SKU. If margin is negative or below a minimum threshold, flag the SKU — increasing volume on a money-losing product accelerates losses.

*Budget:* Check remaining daily and monthly advertising budget. If the budget is nearly exhausted, prioritise efficiency over expansion.

Constraints override opportunities. Always.

**Phase 3: Opportunity Scan.**

With constraints established, the agent applies the analytical frameworks:

*Keyword Gap Analysis (Chapter 4):* Identify high-volume, low-share keywords. Diagnose funnel stage. Cross-reference momentum and competitive density.

*Incrementality Check (Chapter 5):* For all keywords with both SQP and PPC data, calculate incrementality scores. Flag waste scenarios (high organic share + high ad spend) and growth scenarios (low organic share, PPC-dependent).

*Blue Ocean Scan (Chapter 6):* Cross-reference market keyword universe with active PPC keywords. Identify untargeted high-volume terms.

*Funnel Leak Diagnosis:* From SCP data, identify any significant week-over-week drops in funnel conversion rates. Flag for investigation.

**Phase 4: Action Generation.**

From the opportunity scan, generate a prioritised list of recommended actions. Each action includes:

- **Keyword or SKU:** The target.
- **Action Type:** Bid increase, bid decrease, keyword launch, keyword pause, listing update, PO recommendation.
- **Hypothesis:** Expected outcome and timeframe.
- **Confidence:** Based on historical accuracy of similar actions.
- **Constraint Status:** Confirmation that the action does not violate inventory, financial, or budget constraints.
- **Priority Score:** Weighted by market size (search volume), gap size, momentum, and confidence.

**Phase 5: Logging.**

Record the full analysis output — snapshot data, constraint status, opportunities identified, actions recommended — for review in the next week's governance loop.

#### What the Agent Does Not Do

The agent does not make changes to your campaigns automatically. It analyses and recommends. You review and execute. This is deliberate. Automated execution sounds efficient but removes the human judgement that catches edge cases, understands seasonal context, and makes strategic trade-offs that no algorithm can quantify.

The agent is your analyst. You are the CEO.

---

# SECTION VII: PRACTICAL WORKSHOP

---

## Chapter 12: Case Study — Live Data Extraction

### Running the Growth Machine on Your Own Product

This is where the book becomes real.

Everything you have read — the keyword gap analysis, the incrementality framework, the blue ocean discovery, the marketing throttle, the governance loop — is now going to be applied to your product, with your data, in real time.

This chapter is a hands-on walkthrough. You will open VSCode, connect to your NeonPanel MCP server, and execute a structured sequence of data extractions that produce the complete Growth Machine dossier for your product.

#### Prerequisites

Before you begin, ensure:

1. **NeonPanel account is active** with your Amazon Seller Central integration connected and synchronised. Data should be current (synced within the last 24 hours).

2. **Brand Analytics access is enabled.** This requires Brand Registry. If you are not yet brand-registered, you can still use the advertising and financial tools, but the Brand Analytics frameworks (SQP, SCP) will not be available.

3. **At least one advertising profile is connected.** Your Amazon Advertising account (Sponsored Products, at minimum) should be linked through NeonPanel.

4. **Your target Parent ASIN is identified.** Pick the product you want to analyse. Ideally, this is your best-seller or your highest-potential product — the one where a 5 % increase in purchase share would have the most revenue impact.

5. **VSCode with GitHub Copilot and NeonPanel MCP server is configured.** The agent should be able to call NeonPanel tools via natural language.

#### The Extraction Sequence

The workshop follows four phases. Each phase can run independently after the setup phase completes.

**Phase 0: Setup and Orientation.**

Start by identifying your company and mapping your product family:

1. List your connected companies. Confirm the company ID for your brand.
2. Look up your target Parent ASIN in the catalogue. Record all Child ASINs (variations). You will need these for the per-SKU analyses.
3. Review your RYG threshold settings. If this is your first time, the defaults (5 % / 15 %) are a reasonable starting point. You can adjust later based on your category's competitive structure.

**Phase 1: Market Data.**

This is the analytical core — Brand Analytics data that reveals your competitive position:

1. Pull Search Query Performance for your ASIN family. This is the primary input for the Keyword Gap Analysis. You will see every keyword where your product appeared, along with search volume, purchase share, and RYG classification.
2. Pull Search Catalog Performance. This shows your funnel metrics — where shoppers drop off between impressions, clicks, carts, and purchases.
3. For the top 10 gap keywords (high volume, low share), pull keyword-level funnel metrics. This diagnoses *why* you are underperforming on each specific term.
4. Pull search term momentum data. Identify which of your gap keywords are growing, stable, or declining.
5. Pull competitive landscape data. See who dominates each gap keyword and whether their position is contestable.
6. Pull conversion leak analysis. Understand systematic funnel weaknesses across your product.

**Phase 2: Advertising Data.**

Your paid performance data, which overlays onto the market picture:

1. Pull PPC search term performance. See every keyword you are bidding on, with spend, clicks, CPC, and attributed sales.
2. Pull campaign-level performance. Get the macro view: total spend, TACoS, ROAS by campaign.
3. Pull cross-sell opportunities. Discover indirect pathways to your product through related keywords.

**Phase 3: Operations Data.**

The constraints that determine how aggressively you can act on the opportunities identified in Phases 1 and 2:

1. Pull landed cost per SKU. Calculate your True Contribution Margin.
2. Pull FIFO COGS analysis. Understand how current batch costs affect your margins.
3. Pull profit and loss. See the complete financial picture.
4. Pull stock replenishment risk. Identify which SKUs are at risk and assign throttle modes.
5. Pull FBA replenishment candidates. See what needs restocking.
6. Pull sales velocity. Validate your Days of Supply calculation.
7. Pull logistics lead times. Calculate your Last Possible Launch Date for each SKU.
8. Pull PO placement candidates. See recommended purchase orders.
9. Track inbound shipments. Check when incoming stock will arrive.

**Phase 4: Synthesis.**

Combine all data into your Growth Machine dossier:

1. Generate a sales forecast. Forward-looking demand projection for inventory planning.
2. Pull repeat purchase analysis. Understand customer retention and lifetime value potential.
3. Review historical reports. Establish the Week 1 baseline for your governance loop.

#### Your Growth Machine Dossier

When the extraction is complete, you will have six deliverables:

1. **Keyword Gap Report.** A prioritised list of target keywords with search volume, current share, gap size, funnel diagnosis, momentum, and contestability. This is your PPC targeting roadmap and listing optimisation priority list.

2. **Incrementality Matrix.** A keyword-by-keyword classification into Waste, Growth, and Flywheel scenarios, with an incrementality score for each. This directly informs budget reallocation.

3. **Blue Ocean Keywords.** Keywords that the market values but your campaigns miss, sorted by discovery source (category gap, untargeted visible terms, efficiency signals, cross-sell).

4. **Unit Economics Dashboard.** True Contribution Margin per SKU, Max Break-Even CPC, and FIFO cost impact. This is the financial guardrail for all bidding decisions.

5. **Inventory Health Status.** Throttle mode per SKU, days of supply, inbound shipment status, and PO recommendations. This is the constraint layer that governs how aggressively you can pursue the opportunities.

6. **Week 1 Governance Baseline.** The snapshot from which all future deltas will be measured. Purchase share, click share, TACoS, inventory, and margins — captured and timestamped as your starting point.

With these six deliverables in hand, you are no longer guessing. You are operating a machine. Next Monday, you run the loop again. You compare Week 2 to Week 1. You evaluate your hypotheses. You adjust. You learn. And the machine gets better.

Welcome to systematic growth.

---

## Afterword

The Amazon marketplace rewards three things: relevance, velocity, and consistency.

Relevance means appearing on the keywords where customers are actually buying. Velocity means converting those appearances into sales at a rate that Amazon's algorithm notices and rewards. Consistency means doing this not once, not occasionally, but every single week.

Brand Analytics gives you the visibility to achieve relevance. The Growth Machine frameworks give you the methodology to build velocity. The weekly governance loop gives you the discipline to maintain consistency.

The sellers who win on Amazon in 2026 and beyond will not be the ones with the biggest budgets or the cheapest products. They will be the ones who understand their market position at the keyword level, respond to shifts within days rather than months, and compound their advantages through systematic, data-driven decision-making.

The tools exist. The data exists. The frameworks are in your hands.

Build the machine. Run the loop. Grow.
