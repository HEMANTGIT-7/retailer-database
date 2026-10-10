-- Monthly Revenue Trend
-- Shows total orders, units sold, and revenue per month
-- Skills: DATE_TRUNC, COUNT(DISTINCT), GROUP BY, ROUND

SELECT 
    DATE_TRUNC('month', invoice_date)::date AS month,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS revenue
FROM online_retail
WHERE quantity > 0 
  AND unit_price > 0
GROUP BY month
ORDER BY month;