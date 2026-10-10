-- Peak Shopping Days Analysis
-- Skills: TO_CHAR, EXTRACT for date manipulation

SELECT 
    TO_CHAR(invoice_date, 'Day') AS day_of_week,
    EXTRACT(DOW FROM invoice_date) AS day_num,
    COUNT(DISTINCT invoice_no) AS orders,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS revenue
FROM online_retail
WHERE quantity > 0 AND unit_price > 0
GROUP BY day_of_week, day_num
ORDER BY day_num;