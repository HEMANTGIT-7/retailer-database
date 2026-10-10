-- Top 10 Products by Revenue
-- Skills: RANK() window function

SELECT 
    stock_code,
    description,
    SUM(quantity) AS units_sold,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS revenue,
    RANK() OVER (ORDER BY SUM(quantity * unit_price) DESC) AS revenue_rank
FROM online_retail
WHERE quantity > 0 
  AND unit_price > 0
  AND description IS NOT NULL
GROUP BY stock_code, description
ORDER BY revenue DESC
LIMIT 10;