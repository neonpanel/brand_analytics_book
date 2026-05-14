-- Athena engine v3 / Iceberg table for Amazon Monthly Transaction CSV data.
-- Replace the LOCATION value with the S3 prefix where this Iceberg table should live.
-- Example LOCATION: 's3://your-athena-results-or-data-bucket/iceberg/monthly_transactions/'

CREATE TABLE IF NOT EXISTS neonpanel_iceberg.amazon_monthly_transactions_raw (
    company_id integer,
    report_month varchar,
    source_file varchar,
    source_row_number bigint,

    posted_at_text varchar,
    settlement_id varchar,
    transaction_type varchar,
    order_id varchar,
    sku varchar,
    description varchar,
    quantity integer,
    marketplace varchar,
    fulfillment varchar,
    order_city varchar,
    order_state varchar,
    order_postal varchar,
    tax_collection_model varchar,

    product_sales decimal(18, 2),
    product_sales_tax decimal(18, 2),
    shipping_credits decimal(18, 2),
    shipping_credits_tax decimal(18, 2),
    gift_wrap_credits decimal(18, 2),
    gift_wrap_credits_tax decimal(18, 2),
    regulatory_fee decimal(18, 2),
    tax_on_regulatory_fee decimal(18, 2),
    promotional_rebates decimal(18, 2),
    promotional_rebates_tax decimal(18, 2),
    marketplace_withheld_tax decimal(18, 2),
    selling_fees decimal(18, 2),
    fba_fees decimal(18, 2),
    other_transaction_fees decimal(18, 2),
    other_amount decimal(18, 2),
    total_amount decimal(18, 2),

    transaction_status varchar,
    transaction_release_date_text varchar,
    ingested_at timestamp
)
PARTITIONED BY (company_id, report_month)
LOCATION 's3://REPLACE-ME/neonpanel_iceberg/amazon_monthly_transactions_raw/'
TBLPROPERTIES (
    'table_type' = 'ICEBERG',
    'format' = 'parquet',
    'write_compression' = 'snappy'
);
