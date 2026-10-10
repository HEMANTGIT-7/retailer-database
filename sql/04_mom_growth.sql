-- Month-over-Month Revenue Growth
-- Skills: CTE, LAG() window function, NULLIF

WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', invoice_date)::date AS month,
        ROUND(SUM(quantity * unit_price)::numeric, 2) AS revenue
    FROM online_retail
    WHERE quantity > 0 AND unit_price > 0
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY month)) 
         / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100)::numeric, 
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY month;