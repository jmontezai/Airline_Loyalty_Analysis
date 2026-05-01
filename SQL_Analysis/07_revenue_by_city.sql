-- ===================================================
-- Question 7: 
-- Which cities generate the most revenue?
-- ===================================================

SELECT 
    City,
    Province,
    COUNT(*) AS Customers,
    CAST(SUM(CLV) AS DECIMAL(15,2)) AS TotalCLV,
    CAST(AVG(CLV) AS DECIMAL(10,2)) AS AvgCLV,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM Analytics.VW_Customer_Loyalty_History 
GROUP BY 
    City, 
    Province
ORDER BY 
    TotalCLV DESC;

-- Insight: Toronto, Vancouver and Montreal are the 
-- top 3 cities by total CLV. However, Whistler has 
-- the highest average CLV per customer — a smaller 
-- but premium market.
