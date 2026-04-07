-- ===================================================
-- Question 10: 
-- Which enrollment year brought the most valuable customers?
-- ===================================================

SELECT 
    EnrollmentYear,
    COUNT(DISTINCT LoyaltyNumber) AS Customers,
    CAST(AVG(CLV) AS DECIMAL(10,2)) AS AvgCLV,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(DISTINCT LoyaltyNumber) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History
GROUP BY 
    EnrollmentYear
ORDER BY 
    EnrollmentYear;

-- Insight: 2015 brought the highest value customers 
-- (avg CLV $8,178) but also the highest churn (17.3%). 
-- 2012 has 0% churn — the most loyal cohort. 2018 has 
-- only 3.9% churn but it's too early to judge. Best balance
-- of value and retention: 2016 (CLV $8,058, churn 15.9%).
