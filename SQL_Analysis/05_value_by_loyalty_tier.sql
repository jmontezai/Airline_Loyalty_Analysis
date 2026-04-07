-- ===================================================
-- Question 5: 
-- What value does each loyalty tier bring to the company?
-- ===================================================

SELECT 
    LoyaltyCard,
    COUNT(*) AS Customers,
    CAST(AVG(CLV) AS DECIMAL(10,2)) AS AvgCLV,
    CAST(SUM(CLV) AS DECIMAL(15,2)) AS TotalCLV,
    CAST(SUM(CLV) * 100.0 / SUM(SUM(CLV)) OVER() AS DECIMAL(5,2)) AS PctTotalCLV,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History
GROUP BY 
    LoyaltyCard
ORDER BY 
    AvgCLV DESC;

-- Insight: Aurora has the highest avg CLV but only 20% of 
-- customers. Star has the lowest avg CLV but contributes 
-- the most total value because it has the most customers.
-- Aurora has the highest churn despite being the premium tier.
