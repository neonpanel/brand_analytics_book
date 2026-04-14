import json, sys

with open(sys.argv[1]) as f:
    data = json.load(f)

items = data['items']
company_monthly = {}
pf_monthly = {}

for item in items:
    pf = item.get('product_family') or item.get('group_key') or 'Unknown'
    forecast_json = item.get('forecast_series_json')
    if forecast_json:
        series = json.loads(forecast_json)
        for entry in series:
            period = entry['period']
            amt = entry['sales_amount']
            company_monthly[period] = company_monthly.get(period, 0) + amt
            if pf not in pf_monthly:
                pf_monthly[pf] = {}
            pf_monthly[pf][period] = pf_monthly[pf].get(period, 0) + amt

all_periods = sorted(company_monthly.keys())
forecast_periods = [p for p in all_periods if p >= '2026-03']
recent_periods = [p for p in all_periods if '2025-10' <= p <= '2026-02']

print('=== RECENT MONTHS (Actuals in Forecast) ===')
for p in recent_periods:
    print(f'  {p}: ${company_monthly[p]:>12,.0f}')

print('\n=== 24-MONTH SALES FORECAST (Company Total) ===')
annual_2026 = 0
annual_2027 = 0
for p in forecast_periods:
    print(f'  {p}: ${company_monthly[p]:>12,.0f}')
    if p.startswith('2026'):
        annual_2026 += company_monthly[p]
    elif p.startswith('2027'):
        annual_2027 += company_monthly[p]
print(f'  ---')
print(f'  2026 remaining (Mar-Dec): ${annual_2026:>12,.0f}')
print(f'  2027 (Jan-Mar+):          ${annual_2027:>12,.0f}')

print('\n=== TOP 5 PRODUCT FAMILIES - FORECAST BY QUARTER ===')
top5 = sorted(items, key=lambda x: float(x.get('sales_last_30_days') or 0), reverse=True)[:5]
top5_names = [item.get('product_family') or item.get('group_key') for item in top5]

q_map = {
    '2026-03': 'Q1-2026', '2026-04': 'Q2-2026', '2026-05': 'Q2-2026', '2026-06': 'Q2-2026',
    '2026-07': 'Q3-2026', '2026-08': 'Q3-2026', '2026-09': 'Q3-2026',
    '2026-10': 'Q4-2026', '2026-11': 'Q4-2026', '2026-12': 'Q4-2026',
    '2027-01': 'Q1-2027', '2027-02': 'Q1-2027', '2027-03': 'Q1-2027',
}
q_order = ['Q1-2026', 'Q2-2026', 'Q3-2026', 'Q4-2026', 'Q1-2027']

for pf in top5_names:
    q_totals = {q: 0 for q in q_order}
    if pf in pf_monthly:
        for period, amt in pf_monthly[pf].items():
            q = q_map.get(period)
            if q:
                q_totals[q] += amt
    print(f'  {pf}:')
    for q in q_order:
        print(f'    {q}: ${q_totals[q]:>10,.0f}')
    print()
