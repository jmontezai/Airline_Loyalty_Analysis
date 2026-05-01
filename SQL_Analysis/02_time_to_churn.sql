-- ===================================================
-- Question 2: 
-- How long do we have to retain a customer before they cancel?
-- ===================================================

WITH churn_calc AS (
    SELECT
        *,
        (CancellationYear - EnrollmentYear) * 12 + 
        (CancellationMonth - EnrollmentMonth) AS MonthsToChurn
    FROM Analytics.VW_Customer_Loyalty_History
    WHERE IsActive = 0
)
 
SELECT 
    CASE 
        WHEN MonthsToChurn <= 6 THEN '0-6 months'
        WHEN MonthsToChurn <= 12 THEN '7-12 months'
        WHEN MonthsToChurn <= 24 THEN '13-24 months'
        ELSE '25+ months'
    END AS TimeToChurn,
    COUNT(*) AS Customers,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS Percentage
FROM churn_calc
GROUP BY 
    CASE 
        WHEN MonthsToChurn <= 6 THEN '0-6 months'
        WHEN MonthsToChurn <= 12 THEN '7-12 months'
        WHEN MonthsToChurn <= 24 THEN '13-24 months'
        ELSE '25+ months'
    END
ORDER BY 
    MIN(MonthsToChurn);

-- Insight: Most customers cancel within 7-12 months after enrollment.
-- The critical retention window is the first year — the majority 
-- of all cancellations happen within 12 months.
