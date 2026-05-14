-- Aggregates Amazon settlement transaction detail into the same Summary
-- class/subclass layout used by Amazon Monthly Unified Summary PDFs.
--
-- Dialect: DuckDB SQL for local TSV exports.
-- Replace the file path in raw_source if you load data from a table instead.

WITH params AS (
    SELECT
        DATE '2026-04-01' AS start_date,
        DATE '2026-05-01' AS end_date
),

raw_source AS (
    SELECT *
    FROM read_csv(
        'AJM4B4QFRLL5D_2026-04-06_26089758211.tsv',
        delim = '\t',
        header = true,
        all_varchar = true
    )
),

source_rows AS (
    SELECT
        NULLIF(TRIM("settlement-id"), '') AS settlement_id,
        TRY_CAST(NULLIF(TRIM("settlement-start-date"), '') AS DATE) AS settlement_start_date,
        TRY_CAST(NULLIF(TRIM("settlement-end-date"), '') AS DATE) AS settlement_end_date,
        TRY_CAST(NULLIF(TRIM("deposit-date"), '') AS DATE) AS deposit_date,
        TRY_CAST(NULLIF(TRIM("total-amount"), '') AS DECIMAL(18, 2)) AS settlement_total_amount,
        NULLIF(TRIM(currency), '') AS currency,
        COALESCE(NULLIF(TRIM("transaction-type"), ''), '') AS transaction_type,
        NULLIF(TRIM("order-id"), '') AS order_id,
        NULLIF(TRIM("marketplace-name"), '') AS marketplace_name,
        COALESCE(NULLIF(TRIM("amount-type"), ''), '') AS amount_type,
        COALESCE(NULLIF(TRIM("amount-description"), ''), '') AS amount_description,
        TRY_CAST(NULLIF(TRIM(amount), '') AS DECIMAL(18, 2)) AS amount,
        COALESCE(NULLIF(TRIM("fulfillment-id"), ''), '') AS fulfillment_id,
        TRY_CAST(NULLIF(TRIM("posted-date"), '') AS DATE) AS posted_date,
        NULLIF(TRIM(sku), '') AS sku
    FROM raw_source
    WHERE TRY_CAST(NULLIF(TRIM(amount), '') AS DECIMAL(18, 2)) IS NOT NULL
),

transaction_lines AS (
    SELECT source_rows.*
    FROM source_rows
    CROSS JOIN params
    WHERE posted_date >= params.start_date
      AND posted_date < params.end_date
),

mapped_transaction_lines AS (
    SELECT
        settlement_id,
        posted_date AS summary_date,
        currency,
        marketplace_name,
        transaction_type,
        amount_type,
        amount_description,
        amount,
        CASE
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                 AND fulfillment_id = 'AFN'
                THEN 'Income'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Income'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                 AND fulfillment_id = 'AFN'
                THEN 'Income'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Income'
            WHEN transaction_type = 'Chargeback Refund'
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Income'
            WHEN transaction_type = 'Liquidations'
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Income'
            WHEN transaction_type IN ('Liquidations Adjustments', 'Liq. Adjustments')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Income'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Shipping'
                THEN 'Income'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Shipping'
                THEN 'Income'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'GiftWrap'
                THEN 'Income'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'GiftWrap'
                THEN 'Income'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'Promotion'
                 AND amount_description IN ('Principal', 'Shipping')
                THEN 'Income'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'Promotion'
                 AND amount_description IN ('Principal', 'Shipping')
                THEN 'Income'
            WHEN transaction_type = 'other-transaction'
                 AND amount_type = 'FBA Inventory Reimbursement'
                 AND amount > 0
                THEN 'Income'
            WHEN transaction_type = 'other-transaction'
                 AND amount_description IN ('Previous Reserve Amount Balance', 'Receivables Deductions')
                THEN 'Income'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge', 'Refund', 'Refund_Retrocharge', 'Liquidations', 'Liquidations Adjustments', 'Liq. Adjustments', 'Chargeback Refund')
                 AND amount_type IN ('ItemPrice', 'ItemWithheldTax')
                 AND amount_description IN (
                    'Tax', 'ShippingTax', 'GiftWrapTax', 'RegulatoryFee', 'TaxOnRegulatoryFee',
                    'MarketplaceFacilitatorTax-Principal', 'MarketplaceFacilitatorTax-Shipping',
                    'MarketplaceFacilitatorTax-Other', 'MarketplaceFacilitatorVAT-Principal',
                    'MarketplaceFacilitatorVAT-Shipping'
                 )
                THEN 'Tax'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                 AND fulfillment_id = 'AFN'
                THEN 'Expenses'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                THEN 'Expenses'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge', 'Chargeback Refund')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                THEN 'Expenses'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description IN ('FBAPerUnitFulfillmentFee', 'ShippingChargeback', 'GiftwrapChargeback')
                THEN 'Expenses'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description IN ('FBAPerUnitFulfillmentFee', 'ShippingChargeback', 'GiftwrapChargeback')
                THEN 'Expenses'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge', 'Chargeback Refund')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'RefundCommission'
                THEN 'Expenses'
            WHEN transaction_type = 'FBAFees'
                THEN 'Expenses'
            WHEN transaction_type = 'other-transaction'
                 AND (
                    amount_description IN (
                        'Storage Fee', 'StorageRenewalBilling', 'DisposalComplete',
                        'FBA Inbound Placement Service Fee'
                    )
                    OR amount_type = 'Inbound Defect Fee'
                 )
                THEN 'Expenses'
            WHEN transaction_type = 'AmazonFees'
                THEN 'Expenses'
            WHEN transaction_type = 'other-transaction'
                 AND amount_type = 'FBA Inventory Reimbursement'
                 AND amount < 0
                THEN 'Expenses'
            WHEN transaction_type = 'Liquidations'
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'LiquidationsBrokerageFee'
                THEN 'Expenses'
            WHEN transaction_type IN ('Cost of Advertising', 'Advertising')
                THEN 'Expenses'
        END AS summary_class,
        CASE
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                 AND fulfillment_id = 'AFN'
                THEN 'FBA product sales'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Product sales (non-FBA)'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                 AND fulfillment_id = 'AFN'
                THEN 'FBA product sale refunds'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Product sale refunds (non-FBA)'
            WHEN transaction_type = 'Chargeback Refund'
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'Chargebacks'
            WHEN transaction_type = 'Liquidations'
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'FBA liquidation proceeds'
            WHEN transaction_type IN ('Liquidations Adjustments', 'Liq. Adjustments')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Principal'
                THEN 'FBA Liquidations proceeds adjustments'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Shipping'
                THEN 'Shipping credits'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'Shipping'
                THEN 'Shipping credit refunds'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'GiftWrap'
                THEN 'Gift wrap credits'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemPrice'
                 AND amount_description = 'GiftWrap'
                THEN 'Gift wrap credit refunds'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'Promotion'
                 AND amount_description IN ('Principal', 'Shipping')
                THEN 'Promotional rebates'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'Promotion'
                 AND amount_description IN ('Principal', 'Shipping')
                THEN 'Promotional rebate refunds'
            WHEN transaction_type = 'other-transaction'
                 AND amount_type = 'FBA Inventory Reimbursement'
                 AND amount > 0
                THEN 'FBA inventory credit'
            WHEN transaction_type = 'other-transaction'
                 AND amount_description IN ('Previous Reserve Amount Balance', 'Receivables Deductions')
                THEN 'Receivables Deductions'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge', 'Refund', 'Refund_Retrocharge', 'Liquidations', 'Liquidations Adjustments', 'Liq. Adjustments', 'Chargeback Refund')
                 AND amount_type = 'ItemPrice'
                 AND amount_description IN ('Tax', 'ShippingTax', 'GiftWrapTax', 'RegulatoryFee', 'TaxOnRegulatoryFee')
                 AND amount >= 0
                THEN 'Product, shipping, gift wrap taxes and regulatory fee collected'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge', 'Refund', 'Refund_Retrocharge', 'Liquidations', 'Liquidations Adjustments', 'Liq. Adjustments', 'Chargeback Refund')
                 AND amount_type = 'ItemPrice'
                 AND amount_description IN ('Tax', 'ShippingTax', 'GiftWrapTax', 'RegulatoryFee', 'TaxOnRegulatoryFee')
                 AND amount < 0
                THEN 'Product, shipping, gift wrap taxes and regulatory fee refunded'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge', 'Refund', 'Refund_Retrocharge', 'Liquidations', 'Liquidations Adjustments', 'Liq. Adjustments', 'Chargeback Refund')
                 AND amount_type = 'ItemWithheldTax'
                 AND amount_description IN (
                    'MarketplaceFacilitatorTax-Principal', 'MarketplaceFacilitatorTax-Shipping',
                    'MarketplaceFacilitatorTax-Other', 'MarketplaceFacilitatorVAT-Principal',
                    'MarketplaceFacilitatorVAT-Shipping'
                 )
                THEN 'Amazon Obligated Tax and Regulatory Fee Withheld'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                 AND fulfillment_id = 'AFN'
                THEN 'FBA selling fees'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                THEN 'Seller fulfilled selling fees'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge', 'Chargeback Refund')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'Commission'
                THEN 'Selling fee refunds'
            WHEN transaction_type IN ('Order', 'Order_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description IN ('FBAPerUnitFulfillmentFee', 'ShippingChargeback', 'GiftwrapChargeback')
                THEN 'FBA transaction fees'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge')
                 AND amount_type = 'ItemFees'
                 AND amount_description IN ('FBAPerUnitFulfillmentFee', 'ShippingChargeback', 'GiftwrapChargeback')
                THEN 'FBA transaction fee refunds'
            WHEN transaction_type IN ('Refund', 'Refund_Retrocharge', 'Chargeback Refund')
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'RefundCommission'
                THEN 'Refund administration fees'
            WHEN transaction_type = 'FBAFees'
                THEN 'FBA inventory and inbound services fees'
            WHEN transaction_type = 'other-transaction'
                 AND (
                    amount_description IN (
                        'Storage Fee', 'StorageRenewalBilling', 'DisposalComplete',
                        'FBA Inbound Placement Service Fee'
                    )
                    OR amount_type = 'Inbound Defect Fee'
                 )
                THEN 'FBA inventory and inbound services fees'
            WHEN transaction_type = 'AmazonFees'
                THEN 'Service fees'
            WHEN transaction_type = 'other-transaction'
                 AND amount_type = 'FBA Inventory Reimbursement'
                 AND amount < 0
                THEN 'Adjustments'
            WHEN transaction_type = 'Liquidations'
                 AND amount_type = 'ItemFees'
                 AND amount_description = 'LiquidationsBrokerageFee'
                THEN 'Liquidations fees'
            WHEN transaction_type IN ('Cost of Advertising', 'Advertising')
                 AND amount < 0
                THEN 'Cost of Advertising'
            WHEN transaction_type IN ('Cost of Advertising', 'Advertising')
                 AND amount >= 0
                THEN 'Refund for Advertiser'
        END AS summary_subclass
    FROM transaction_lines
),

transfer_lines AS (
    SELECT
        settlement_id,
        deposit_date AS summary_date,
        currency,
        NULL AS marketplace_name,
        'Transfer' AS transaction_type,
        'Transfer' AS amount_type,
        'Settlement transfer to bank account' AS amount_description,
        -1 * settlement_total_amount AS amount,
        'Transfers' AS summary_class,
        'Transfers to bank account' AS summary_subclass
    FROM (
        SELECT DISTINCT
            settlement_id,
            deposit_date,
            currency,
            settlement_total_amount
        FROM source_rows
        WHERE settlement_id IS NOT NULL
          AND deposit_date IS NOT NULL
          AND settlement_total_amount IS NOT NULL
    ) settlements
    CROSS JOIN params
    WHERE deposit_date >= params.start_date
      AND deposit_date < params.end_date
),

mapped_lines AS (
    SELECT * FROM mapped_transaction_lines
    WHERE summary_class IS NOT NULL

    UNION ALL

    SELECT * FROM transfer_lines
),

summary_catalog AS (
    SELECT * FROM (VALUES
        (1,  1, 'Income',   'Product sales (non-FBA)'),
        (1,  2, 'Income',   'Product sale refunds (non-FBA)'),
        (1,  3, 'Income',   'FBA product sales'),
        (1,  4, 'Income',   'FBA product sale refunds'),
        (1,  5, 'Income',   'FBA inventory credit'),
        (1,  6, 'Income',   'FBA liquidation proceeds'),
        (1,  7, 'Income',   'FBA Liquidations proceeds adjustments'),
        (1,  8, 'Income',   'Shipping credits'),
        (1,  9, 'Income',   'Shipping credit refunds'),
        (1, 10, 'Income',   'Gift wrap credits'),
        (1, 11, 'Income',   'Gift wrap credit refunds'),
        (1, 12, 'Income',   'Promotional rebates'),
        (1, 13, 'Income',   'Promotional rebate refunds'),
        (1, 14, 'Income',   'A-to-z Guarantee claims'),
        (1, 15, 'Income',   'Chargebacks'),
        (1, 16, 'Income',   'Amazon Shipping Reimbursement Adjustments'),
        (1, 17, 'Income',   'SAFE-T reimbursement'),
        (1, 18, 'Income',   'Receivables Deductions'),
        (1, 19, 'Income',   'Amazon Shipping Charge Adjustments'),
        (2,  1, 'Expenses', 'Seller fulfilled selling fees'),
        (2,  2, 'Expenses', 'FBA selling fees'),
        (2,  3, 'Expenses', 'Selling fee refunds'),
        (2,  4, 'Expenses', 'FBA transaction fees'),
        (2,  5, 'Expenses', 'FBA transaction fee refunds'),
        (2,  6, 'Expenses', 'Other transaction fees'),
        (2,  7, 'Expenses', 'Other transaction fee refunds'),
        (2,  8, 'Expenses', 'FBA inventory and inbound services fees'),
        (2,  9, 'Expenses', 'Shipping label purchases'),
        (2, 10, 'Expenses', 'Shipping label refunds'),
        (2, 11, 'Expenses', 'Carrier shipping label adjustments'),
        (2, 12, 'Expenses', 'Service fees'),
        (2, 13, 'Expenses', 'Refund administration fees'),
        (2, 14, 'Expenses', 'Adjustments'),
        (2, 15, 'Expenses', 'Cost of Advertising'),
        (2, 16, 'Expenses', 'Refund for Advertiser'),
        (2, 17, 'Expenses', 'Liquidations fees'),
        (3,  1, 'Tax',      'Product, shipping, gift wrap taxes and regulatory fee collected'),
        (3,  2, 'Tax',      'Product, shipping, gift wrap taxes and regulatory fee refunded'),
        (3,  3, 'Tax',      'Amazon Obligated Tax and Regulatory Fee Withheld'),
        (4,  1, 'Transfers','Transfers to bank account'),
        (4,  2, 'Transfers','Failed transfers to bank account'),
        (4,  3, 'Transfers','Disburse to Amazon Gift Card balance'),
        (4,  4, 'Transfers','Charges to credit card and other debt recovery')
    ) AS labels(class_order, subclass_order, summary_class, summary_subclass)
),

subclass_summary AS (
    SELECT
        summary_class,
        summary_subclass,
        SUM(CASE WHEN amount < 0 THEN amount ELSE 0 END) AS debits,
        SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) AS credits,
        SUM(amount) AS net_amount,
        COUNT(*) AS line_count
    FROM mapped_lines
    GROUP BY 1, 2
),

class_summary AS (
    SELECT
        summary_class,
        SUM(debits) AS debits,
        SUM(credits) AS credits,
        SUM(net_amount) AS net_amount,
        SUM(line_count) AS line_count
    FROM subclass_summary
    GROUP BY 1
)

SELECT
    summary_catalog.summary_class,
    summary_catalog.summary_subclass,
    COALESCE(subclass_summary.debits, 0) AS debits,
    COALESCE(subclass_summary.credits, 0) AS credits,
    COALESCE(subclass_summary.net_amount, 0) AS net_amount,
    COALESCE(subclass_summary.line_count, 0) AS line_count
FROM summary_catalog
LEFT JOIN subclass_summary
    ON subclass_summary.summary_class = summary_catalog.summary_class
   AND subclass_summary.summary_subclass = summary_catalog.summary_subclass
ORDER BY summary_catalog.class_order, summary_catalog.subclass_order;

-- Totals by top-level Summary class. Run after the CTE block above if your SQL client
-- supports selecting from prior CTEs, or replace the final SELECT with this one.
-- SELECT * FROM class_summary
-- ORDER BY CASE summary_class
--     WHEN 'Income' THEN 1
--     WHEN 'Expenses' THEN 2
--     WHEN 'Tax' THEN 3
--     WHEN 'Transfers' THEN 4
-- END;

-- QA: every non-zero source transaction should map to exactly one Summary label.
-- Replace the final SELECT with this query during validation.
-- SELECT
--     transaction_type,
--     amount_type,
--     amount_description,
--     SUM(amount) AS net_amount,
--     COUNT(*) AS line_count
-- FROM mapped_transaction_lines
-- WHERE summary_class IS NULL
--   AND amount <> 0
-- GROUP BY 1, 2, 3
-- ORDER BY ABS(SUM(amount)) DESC, line_count DESC;