-- ==================================================
-- Question 1: 
-- Which regions are losing the most customers?
-- ==================================================

SELECT 
    Province,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) AS Churned,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History
GROUP BY 
    Province
ORDER BY 
    ChurnRate DESC;

-- Insight: Prince Edward Island has the highest churn 
-- rate (16.67%), followed by Manitoba (15.2%).
-- However, PEI only has 66 customers — small sample.
-- Manitoba with 658 customers is more concerning.
-- New Brunswick has the lowest churn (10.5%).
