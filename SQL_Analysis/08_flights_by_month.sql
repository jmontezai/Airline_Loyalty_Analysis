-- ===================================================
-- Question 8: 
-- In which months do customers fly the most and when 
-- should we launch campaigns?
-- ===================================================

SELECT 
    c.Month,
    c.MonthName,
    SUM(CAST(f.TotalFlights AS INT)) AS TotalFlights,
    CAST(AVG(CAST(f.TotalFlights AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AvgFlights,
    CAST(AVG(CAST(f.Distance AS DECIMAL(15,2))) AS DECIMAL(10,2)) AS AvgDistance
FROM Analytics.VW_Customer_Flight_Activity AS f
INNER JOIN Analytics.VW_Calendar AS c 
    ON f.Year = c.Year AND f.Month = c.Month
GROUP BY 
    c.Month, 
    c.MonthName
ORDER BY 
    c.Month;

-- Insight: July is the peak month (1.98 avg flights), 
-- followed by June and August — the summer season. 
-- February is the lowest (0.83). Campaigns should launch 
-- in April-May to capture the summer surge, and November 
-- to boost the December holiday travel spike.
