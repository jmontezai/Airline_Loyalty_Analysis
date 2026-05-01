-- ============================================
-- Schema created to organize the analysis views
-- ============================================
CREATE SCHEMA Analytics; 
GO

-- ============================================
-- VIEW: Calendar Table With Useful Data Fields
-- Objective: Prepare date fields for time-based 
-- analysis (year, month, quarter)
-- ============================================
CREATE VIEW Analytics.VW_Calendar AS
    SELECT
        [Date],
        StartOfYear,
        StartOfQuarter,
        StartOfMonth,
        YEAR([Date]) AS [Year],
        DATEPART(QUARTER,[Date]) AS [Quarter],
        MONTH(Date) AS [Month],
	    DATENAME(MONTH, Date) AS [MonthName],
	    DATEPART(DAY, Date) AS DayNumber
    FROM Loyalty.Calendar;
GO

-- ============================================
-- VIEW: Clean Flight Activity Table
-- Objective: Remove duplicates and aggregate 
-- trips in the same month
-- ============================================
CREATE VIEW Analytics.VW_Customer_Flight_Activity AS
    SELECT
        CAST(loyaltynumber AS INT) AS LoyaltyNumber,
        CAST([year] AS INT) AS [Year],
        CAST([month] AS INT) AS [Month],
        SUM(CAST(totalflights AS INT)) AS TotalFlights,
        SUM(CAST(distance AS INT)) AS Distance,
        SUM(CAST(pointsaccumulated AS DECIMAL(12,2))) AS PointsAccumulated,
        SUM(CAST(pointsredeemed AS INT)) AS PointsRedeemed,
        SUM(CAST(dollarcostpointsredeemed AS INT)) AS DollarCostPointsRedeemed
    FROM Loyalty.Customer_Flight_Activity
    GROUP BY loyaltynumber, [year], [month];
GO

-- ============================================
-- VIEW: Clean Customer Table
-- Objective: Fix errors and add useful columns for analysis
-- ============================================
CREATE VIEW Analytics.VW_Customer_Loyalty_History AS
    SELECT
        Loyaltynumber,
        Country,
        Province,
        City,
        PostalCode,
        Gender,
        Education,
    
        -- I identified 20 salary values with negative amounts:
        -- 19 from customers with "Bachelor" education and 1 with "High School or Below".
        -- Since the absolute values fall within the normal range
        -- for their respective education levels, I assumed a sign error.
        -- Fix: converted to positive values using ABS().
        CASE 
            WHEN salary IS NULL THEN NULL
            WHEN CAST(salary AS DECIMAL(12,2)) < 0 THEN ABS(CAST(salary AS DECIMAL(12,2)))
            ELSE CAST(salary AS DECIMAL(12,2))
        END AS Salary,
 
        -- I found 4,238 customers (all with "College" education) without salary data.
        -- The absence is systematic, not random — therefore I did not impute estimated values.
        -- I created this flag column (1 = missing salary, 0 = has salary)
        -- to allow filtering these records in salary analyses
        -- without losing the customers in other analyses.
        CASE 
            WHEN salary IS NULL THEN 1
            ELSE 0
        END AS SalaryMissing,

        Maritalstatus,
        LoyaltyCard,
        CAST(clv AS DECIMAL(12,2)) AS CLV,
        EnrollmentType,
        CAST(enrollmentyear AS INT) AS EnrollmentYear,
        CAST(enrollmentmonth AS INT) AS EnrollmentMonth,
        CAST(cancellationyear AS INT) AS CancellationYear,
        CAST(cancellationmonth AS INT) AS CancellationMonth,
    
        -- Customers with a filled cancellation_year have left the program.
        -- I created this flag to simplify churn analysis:
        -- 1 = active customer, 0 = customer who churned.
        CASE 
            WHEN cancellationyear IS NULL THEN 1
            ELSE 0
        END AS IsActive

    FROM Loyalty.Customer_Loyalty_History;
GO
