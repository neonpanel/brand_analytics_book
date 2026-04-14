# Инструкция по исправлению маппинга сервисов — 5SU, декабрь 2025

> Результат сверки данных Classify (reference), GL и PDF-отчёта Amazon (Monthly Unified Summary) за декабрь 2025, маркетплейс US.

---

## 1. НЕМАППЛЕННЫЕ СЕРВИСЫ — нужно назначить счета

Эти сервисы сейчас **вообще не привязаны** ни к какому счёту в CoA. Все суммы по ним выпадают из GL.

| Сервис | Сумма за дек. 2025 | Рекомендуемый счёт | Комментарий |
|--------|-------------------:|--------------------|----|
| **Non-Amazon Principal Liquidations** | **+$3,927.10** | Счёт доходов от ликвидации (напр. 40016 или аналог) | Выручка от программы FBA Liquidations. В PDF отражается в строке «FBA liquidation proceeds» в Income |
| **Non-Amazon LiquidationsBrokerageFee Liquidations** | **-$1,320.84** | Счёт расходов на ликвидацию (напр. 51xxx) | Комиссия брокера за ликвидацию. В PDF — строка «Liquidations fees» = -$1,505.89 |
| **Amazon Promotion fee Promotion Fee** | **-$245.00** | 51120 Amazon Fees: Amazon Service fees | Разовая промо-комиссия. Аналогична уже замаппленному «Special Promotion Fee» на том же счёте 51120 |
| Non-Amazon MarketplaceFacilitatorTax-Principal Liquidations | -$1.37 | 22012 Company TAX: Sales Tax US: Withhelded Sales Tax | Удержанный налог на ликвидацию |
| Non-Amazon Tax Liquidations | +$1.37 | 22011 Company TAX: Sales Tax US: Collected Sales Tax | Собранный налог на ликвидацию |
| Non-Amazon Tax Liquidations Adjustments | -$0.11 | 22011 Company TAX: Sales Tax US: Collected Sales Tax | Корректировка налога |
| Non-Amazon MarketplaceFacilitatorTax-Principal Liq. Adjustments | +$0.11 | 22012 Company TAX: Sales Tax US: Withhelded Sales Tax | Корректировка налога |

**Итого недоучтено:** +$2,361 нетто (из них +$2,606 доход от ликвидации минус комиссии и налоги).

---

## 2. НЕПРАВИЛЬНО ЗАМАППЛЕННЫЕ — нужно переназначить счёт

Подтверждено сверкой с PDF-отчётом Amazon.

| Сервис | Сумма | Сейчас на счёте (неверно) | Перенести на счёт (верно) | Обоснование |
|--------|------:|--------------------------|--------------------------|-------------|
| **Amazon Base fee AmazonFees** | **-$7,212.88** | 51040 Amazon Fees: FBA transaction fees | **51120 Amazon Fees: Amazon Service fees** | В PDF эта сумма входит в строку «Service fees» (-$10,470), а НЕ в «FBA transaction fees». При текущем маппинге GL завышает транзакционные комиссии на ~$7.2K и занижает сервисные |
| **Amazon DisposalComplete** | **-$780.01** | 51802 FBA inbound transportation fees | **51801 FBA Storage Fees** (или отдельный счёт утилизации) | Утилизация товара ≠ входящая транспортировка. В PDF входит в «FBA inventory and inbound services fees» |

---

## 3. РЕКОМЕНДУЕТСЯ ПРОВЕРИТЬ — возможно некорректный маппинг

Эти позиции не однозначные — нужно принять решение исходя из учётной политики.

| Сервис | Сумма | Сейчас на счёте | Вопрос |
|--------|------:|----------------|--------|
| **Amazon RefundCommission Refund** | -$3,253.39 | 51030 Amazon Fees: FBA Selling fee refunds (Commission) | В PDF это **отдельная** строка «Refund administration fees» (-$3,252), вынесенная из «Selling fee refunds». Справочный классификатор NeonPanel относит к «Service Fee». Можно оставить на 51030 или перенести на 51120 — зависит от учётной политики |
| **Amazon Base fee FBAFees** | -$1,054.91 | 12024 AWD Clearing Account (Актив) | Классификатор говорит «Расход» (инв. и входящие услуги), но маппинг на клиринговый счёт актива может быть намеренным для учёта предоплат AWD |
| **Amazon Discount on Fee FBAFees** | +$42.43 | 12024 AWD Clearing Account (Актив) | Тот же вопрос — скидка по AWD комиссии |
| **Amazon StorageRenewalBilling** | -$0.36 | 12023 FBA Inbound clearing (Актив) | Мелкая сумма, та же логика AWD/FBA клиринга |
| **MarketplaceFacilitatorVAT-Principal Order** | -$35.04 | 22022 UK VAT: Withhelded VAT | Транзакция проходит по маркетплейсу **US**, но маппится на счёт **UK VAT**. Возможно нужно 22012 (US Sales Tax)? |
| **MarketplaceFacilitatorVAT-Shipping Order** | -$14.01 | 22022 UK VAT: Withhelded VAT | То же — VAT на US маркетплейсе |

---

## Ожидаемый эффект после исправлений

| Категория GL | Сейчас (неверно) | После исправлений | PDF (эталон) |
|-------------|----------------:|-----------------:|-------------:|
| FBA transaction fees | -$391,051 | **-$383,838** | -$384,771 |
| Service fees | -$3,258 | **-$10,716** | -$10,470 |
| Liquidations income (сейчас отсутствует) | $0 | **+$2,606** нетто | +$2,774 нетто |

---

*Дата сверки: 9 марта 2026. Источники: Amazon Monthly Unified Summary Dec 2025 (PDF), NeonPanel Classify (reference mode), NeonPanel GL (customer_name = Amazon.com).*
