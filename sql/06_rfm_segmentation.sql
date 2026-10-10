-- RFM Customer Segmentation (Recency, Frequency, Monetary)
-- Skills: Multiple CTEs, NTILE window function, CASE logic
-- This is the KEY interview query - be ready to explain each CTE

WITH customer_metrics AS (
    SELECT 
        customer_id,
        MAX(invoice_date)::date AS last_purchase_date,
        COUNT(DISTINCT invoice_no) AS frequency,
        ROUND(SUM(quantity * unit_price)::numeric, 2) AS monetary
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0 
      AND unit_price > 0
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT 
        customer_id,
        (SELECT MAX(invoice_date)::date FROM online_retail) - last_purchase_date AS recency_days,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY last_purchase_date ASC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM customer_metrics
),
segmented AS (
    SELECT 
        customer_id,
        recency_days,
        frequency,
        monetary,
        r_score, f_score, m_score,
        (r_score + f_score + m_score) AS rfm_total,
        CASE 
            WHEN (r_score + f_score + m_score) >= 12 THEN 'Champions'
            WHEN (r_score + f_score + m_score) >= 9  THEN 'Loyal'
            WHEN r_score >= 4 AND f_score <= 2        THEN 'New Customers'
            WHEN r_score <= 2 AND (f_score + m_score) >= 6 THEN 'At Risk'
            WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'Lost'
            ELSE 'Others'
        END AS segment
    FROM rfm_scores
)
SELECT 
    segment,
    COUNT(*) AS num_customers,
    ROUND(AVG(recency_days)::numeric, 0) AS avg_recency_days,
    ROUND(AVG(frequency)::numeric, 1) AS avg_frequency,
    ROUND(AVG(monetary)::numeric, 2) AS avg_monetary,
    ROUND(SUM(monetary)::numeric, 2) AS total_revenue
FROM segmented
GROUP BY segment
ORDER BY total_revenue DESC;