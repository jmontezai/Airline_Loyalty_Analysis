-- ===================================================
-- Question 3: 
-- Are customers who redeem points more loyal?
-- ===================================================

WITH customer_redeem AS (
    SELECT 
        l.LoyaltyNumber,
        l.IsActive,
        SUM(f.PointsRedeemed) AS TotalRedeemed
    FROM Analytics.VW_Customer_Loyalty_History l
    INNER JOIN Analytics.VW_Customer_Flight_Activity f 
        ON l.LoyaltyNumber = f.LoyaltyNumber
    GROUP BY 
        l.LoyaltyNumber, 
        l.IsActive
)
 
SELECT 
    CASE 
        WHEN TotalRedeemed = 0 THEN 'Never Redeemed'
        WHEN TotalRedeemed <= 100 THEN 'Low (1-100)'
        WHEN TotalRedeemed <= 500 THEN 'Medium (101-500)'
        ELSE 'High (500+)'
    END AS RedemptionLevel,
    COUNT(*) AS Customers,
    CAST(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ChurnRate
FROM customer_redeem
GROUP BY 
    CASE 
        WHEN TotalRedeemed = 0 THEN 'Never Redeemed'
        WHEN TotalRedeemed <= 100 THEN 'Low (1-100)'
        WHEN TotalRedeemed <= 500 THEN 'Medium (101-500)'
        ELSE 'High (500+)'
    END
ORDER BY ChurnRate DESC;

-- Insight: Yes. Customers who never redeemed points have the highest 
-- churn rate. Those who redeemed 500+ points have the lowest.
-- Point redemption is strongly linked to retention.
