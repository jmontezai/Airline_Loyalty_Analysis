-- ====================================================
-- Question 4: 
-- What is the profile of our most valuable customers?
-- ====================================================

SELECT 
    Education,
    Gender,
    MaritalStatus,
    COUNT(*) AS Customers,
    CAST(AVG(CLV) AS DECIMAL(10,2)) AS AvgCLV,
    CAST(AVG(Salary) AS DECIMAL(10,2)) AS AvgSalary,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History
GROUP BY 
    Education, 
    Gender, 
    MaritalStatus
ORDER BY AvgCLV DESC;

-- Insight: The most valuable profile is divorced males with 
-- high school education (avg CLV $11,121). Bachelor-educated 
-- females also rank high. Salary has little impact on CLV — 
-- engagement drives value, not income. 
 
