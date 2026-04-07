-- ===================================================
-- Question 6: 
-- Did the 2018 promotion bring customers of the same value?
-- ===================================================

SELECT 
    EnrollmentType,
    COUNT(*) AS Customers,
    CAST(AVG(CLV) AS DECIMAL(10,2)) AS AvgCLV,
    CAST(AVG(Salary) AS DECIMAL(10,2)) AS AvgSalary,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History
WHERE 
    EnrollmentYear = 2018
GROUP BY 
    EnrollmentType;

-- Insight: The 2018 promotion brought customers with 
-- similar CLV to standard enrollees. However, promo 
-- customers have a much higher churn rate vs standard 2018. 
-- They fly more but leave faster.
