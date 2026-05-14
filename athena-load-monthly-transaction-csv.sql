-- Best-practice load path for Amazon Monthly Transaction CSV -> Iceberg:
-- 1. Create a cleaned CSV where the Amazon metadata lines are removed.
--    For 2026AprMonthlyTransaction.csv, remove lines 1-9 so line 1 is the header:
--    "date/time","settlement id","type",...
-- 2. Upload the cleaned CSV to a dedicated S3 staging prefix.
-- 3. Create this external staging table over that S3 prefix.
-- 4. Insert/cast from staging into the Iceberg table.
-- 5. Drop the staging table when validation passes.

CREATE EXTERNAL TABLE IF NOT EXISTS neonpanel_iceberg.amazon_monthly_transactions_csv_stage (
    posted_at_text string,
    settlement_id string,
    transaction_type string,
    order_id string,
    sku string,
    description string,
    quantity string,
    marketplace string,
    fulfillment string,
    order_city string,
    order_state string,
    order_postal string,
    tax_collection_model string,
    product_sales string,
    product_sales_tax string,
    shipping_credits string,
    shipping_credits_tax string,
    gift_wrap_credits string,
    gift_wrap_credits_tax string,
    regulatory_fee string,
    tax_on_regulatory_fee string,
    promotional_rebates string,
    promotional_rebates_tax string,
    marketplace_withheld_tax string,
    selling_fees string,
    fba_fees string,
    other_transaction_fees string,
    other_amount string,
    total_amount string,
    transaction_status string,
    transaction_release_date_text string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    'separatorChar' = ',',
    'quoteChar' = '"',
    'escapeChar' = '"'
)
STORED AS TEXTFILE
LOCATION 's3://REPLACE-ME/staging/amazon_monthly_transactions/2026-04/'
TBLPROPERTIES (
    'skip.header.line.count' = '1'
);

-- Quick stage sanity check before inserting.
SELECT
    COUNT(*) AS stage_rows,
    SUM(TRY_CAST(total_amount AS decimal(18, 2))) AS stage_total_amount,
    MIN(posted_at_text) AS first_posted_at_text,
    MAX(posted_at_text) AS last_posted_at_text
FROM neonpanel_iceberg.amazon_monthly_transactions_csv_stage;

INSERT INTO neonpanel_iceberg.amazon_monthly_transactions_raw (
    company_id,
    report_month,
    source_file,
    source_row_number,
    posted_at_text,
    settlement_id,
    transaction_type,
    order_id,
    sku,
    description,
    quantity,
    marketplace,
    fulfillment,
    order_city,
    order_state,
    order_postal,
    tax_collection_model,
    product_sales,
    product_sales_tax,
    shipping_credits,
    shipping_credits_tax,
    gift_wrap_credits,
    gift_wrap_credits_tax,
    regulatory_fee,
    tax_on_regulatory_fee,
    promotional_rebates,
    promotional_rebates_tax,
    marketplace_withheld_tax,
    selling_fees,
    fba_fees,
    other_transaction_fees,
    other_amount,
    total_amount,
    transaction_status,
    transaction_release_date_text,
    ingested_at
)
SELECT
    106 AS company_id,
    '2026-04' AS report_month,
    '2026AprMonthlyTransaction.csv' AS source_file,
    ROW_NUMBER() OVER () AS source_row_number,
    NULLIF(TRIM(posted_at_text), '') AS posted_at_text,
    NULLIF(TRIM(settlement_id), '') AS settlement_id,
    NULLIF(TRIM(transaction_type), '') AS transaction_type,
    NULLIF(TRIM(order_id), '') AS order_id,
    NULLIF(TRIM(sku), '') AS sku,
    NULLIF(TRIM(description), '') AS description,
    TRY_CAST(NULLIF(TRIM(quantity), '') AS integer) AS quantity,
    NULLIF(TRIM(marketplace), '') AS marketplace,
    NULLIF(TRIM(fulfillment), '') AS fulfillment,
    NULLIF(TRIM(order_city), '') AS order_city,
    NULLIF(TRIM(order_state), '') AS order_state,
    NULLIF(TRIM(order_postal), '') AS order_postal,
    NULLIF(TRIM(tax_collection_model), '') AS tax_collection_model,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(product_sales), ''), ',', '') AS decimal(18, 2)), 0) AS product_sales,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(product_sales_tax), ''), ',', '') AS decimal(18, 2)), 0) AS product_sales_tax,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(shipping_credits), ''), ',', '') AS decimal(18, 2)), 0) AS shipping_credits,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(shipping_credits_tax), ''), ',', '') AS decimal(18, 2)), 0) AS shipping_credits_tax,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(gift_wrap_credits), ''), ',', '') AS decimal(18, 2)), 0) AS gift_wrap_credits,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(gift_wrap_credits_tax), ''), ',', '') AS decimal(18, 2)), 0) AS gift_wrap_credits_tax,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(regulatory_fee), ''), ',', '') AS decimal(18, 2)), 0) AS regulatory_fee,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(tax_on_regulatory_fee), ''), ',', '') AS decimal(18, 2)), 0) AS tax_on_regulatory_fee,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(promotional_rebates), ''), ',', '') AS decimal(18, 2)), 0) AS promotional_rebates,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(promotional_rebates_tax), ''), ',', '') AS decimal(18, 2)), 0) AS promotional_rebates_tax,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(marketplace_withheld_tax), ''), ',', '') AS decimal(18, 2)), 0) AS marketplace_withheld_tax,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(selling_fees), ''), ',', '') AS decimal(18, 2)), 0) AS selling_fees,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(fba_fees), ''), ',', '') AS decimal(18, 2)), 0) AS fba_fees,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(other_transaction_fees), ''), ',', '') AS decimal(18, 2)), 0) AS other_transaction_fees,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(other_amount), ''), ',', '') AS decimal(18, 2)), 0) AS other_amount,
    COALESCE(TRY_CAST(REPLACE(NULLIF(TRIM(total_amount), ''), ',', '') AS decimal(18, 2)), 0) AS total_amount,
    NULLIF(TRIM(transaction_status), '') AS transaction_status,
    NULLIF(TRIM(transaction_release_date_text), '') AS transaction_release_date_text,
    current_timestamp AS ingested_at
FROM neonpanel_iceberg.amazon_monthly_transactions_csv_stage;

-- Validate the Iceberg load.
SELECT
    company_id,
    report_month,
    source_file,
    COUNT(*) AS loaded_rows,
    SUM(total_amount) AS loaded_total_amount,
    SUM(product_sales) AS product_sales,
    SUM(product_sales_tax) AS product_sales_tax,
    SUM(shipping_credits) AS shipping_credits,
    SUM(promotional_rebates) AS promotional_rebates,
    SUM(marketplace_withheld_tax) AS marketplace_withheld_tax,
    SUM(selling_fees) AS selling_fees,
    SUM(fba_fees) AS fba_fees,
    SUM(other_transaction_fees) AS other_transaction_fees,
    SUM(other_amount) AS other_amount
FROM neonpanel_iceberg.amazon_monthly_transactions_raw
WHERE company_id = 106
  AND report_month = '2026-04'
GROUP BY 1, 2, 3;

-- Optional cleanup after the insert and validation succeed.
-- DROP TABLE neonpanel_iceberg.amazon_monthly_transactions_csv_stage;
