-- ===================================================
-- Question 9: 
-- Are low-frequency flyers at risk of leaving?
-- ===================================================

SELECT 
    CASE 
        WHEN AvgFlights = 0 THEN '0 - No Flights'
        WHEN AvgFlights < 1 THEN '1 - Under 1/month'
        WHEN AvgFlights < 2 THEN '2 - 1 to 2/month'
        WHEN AvgFlights < 3 THEN '3 - 2 to 3/month'
        ELSE '4 - 3+/month'
    END AS FlightFrequency,
    COUNT(*) AS Customers,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM (
    SELECT 
        l.LoyaltyNumber,
        l.IsActive,
        AVG(CAST(f.TotalFlights AS DECIMAL(10,2))) AS AvgFlights
    FROM Analytics.VW_Customer_Loyalty_History AS l
    INNER JOIN Analytics.VW_Customer_Flight_Activity AS f 
        ON l.LoyaltyNumber = f.LoyaltyNumber
    GROUP BY 
        l.LoyaltyNumber, 
        l.IsActive
) sub
GROUP BY 
    CASE 
        WHEN AvgFlights = 0 THEN '0 - No Flights'
        WHEN AvgFlights < 1 THEN '1 - Under 1/month'
        WHEN AvgFlights < 2 THEN '2 - 1 to 2/month'
        WHEN AvgFlights < 3 THEN '3 - 2 to 3/month'
        ELSE '4 - 3+/month'
    END
ORDER BY 
    ChurnRate DESC;

-- Insight: Yes. Customers with no flights have 60.6% churn.
-- Under 1 flight/month: 23.5%. 1-2 flights/month drops to 3.4%.
-- Flight frequency is the strongest predictor of retention.


