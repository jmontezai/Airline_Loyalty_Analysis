# ✈️📊 Airline Loyalty Analysis — Churn & Customer Value

## 🚀 Executive Summary

In this project, I identified a **12.35% churn rate** in a loyalty program and found that **declining customer activity (fewer flights)** is the main indicator of churn.

The analysis shows that when customers reduce their usage frequency, they become significantly more likely to leave. This represents a direct risk to both **customer retention and revenue**, especially among **high-value customers**.

Additionally, I identified the segments with the highest churn risk, creating a clear opportunity for **early intervention and improved customer retention strategies**.

## 📌 Project Overview

This project analyzes customer behavior, loyalty program performance, and churn patterns within an airline.

The goal was to build an **end-to-end analytical solution**, from data creation and preparation in SQL to the development of an interactive dashboard in Power BI, focused on generating actionable business insights.

## 🎯 Business Objectives

- Analyze churn trends over time  
- Identify high-risk customer segments  
- Understand the relationship between customer activity and retention  
- Evaluate customer value through CLV  
- Monitor key metrics:
  - Total Customers  
  - Active Customers  
  - Churned Customers  
  - Churn Rate  
  - Retention Rate  
  - Total Flights  
  - Customer Lifetime Value (CLV)  

## 🛠️ Tools and Technologies

- SQL Server → database creation, data cleaning, transformation, and modeling  
- Power BI → data visualization and dashboard development  

## 🧠 Data Preparation (SQL)

A dedicated **Analytics schema** was created on top of the raw data in the **Loyalty schema**, separating operational data from analysis-ready data.

### Key steps:

- Created the database `Airline_Loyalty_Analysis`  
- Created schemas:
  - Loyalty  
  - Analytics  
- Created tables:
  - Calendar  
  - Customer_Flight_Activity  
  - Customer_Loyalty_History  
- Imported data using BULK INSERT  
- Converted data types to appropriate formats  
- Aggregated flight activity by customer, year, and month   
- Created the `SalaryMissing` column to flag missing salary data  
- Created the `IsActive` column for churn analysis:
  - 1 = active customer  
  - 0 = churned customer  
- Created analytical views:
  - VW_Calendar  
  - VW_Customer_Flight_Activity  
  - VW_Customer_Loyalty_History  

## 📊 Dashboard

The dashboard is divided into four main pages:

### Overview

- KPIs: Total Customers, Active Customers, Churned Customers, Churn Rate, Retention Rate  
- Customer base growth vs churn trend  
- Distribution by loyalty card and enrollment type  
- City-level analysis (customers, churn, flights, and CLV)  

### Churn Analysis

- Churn rate over time  
- Churn by loyalty card and enrollment type  
- Churn by ptovince and city  
- Time to churn (months)  

### Loyalty Analysis

- Total CLV and Average CLV  
- Average Points per Customer  
- Redemption Rate  
- CLV by segment  

### Geography

- Geographic distribution of customers  
- Map with metrics by city  

## 📸 Dashboard Preview

### Overview
![Overview](Power_BI/Images/01_Overview.png)

### Churn Analysis
![Churn Analysis](Power_BI/Images/02_Churn_Analysis.png)

### Loyalty Analysis
![Loyalty Analysis](Power_BI/Images/03_Loyalty_Analysis.png)

### Geography
![Geography](Power_BI/Images/04_Geography.png)

## 📖 Data Dictionary

Available at: `Docs/data_dictionary.md`

## 💡 Key Insights

📈 The customer base has grown over time, but churn has also increased, indicating that growth is not being matched by strong retention.

✈️ A decrease in the number of flights is one of the strongest indicators of churn, suggesting that reduced engagement leads to customer loss.

👥 Aurora customers have higher value (CLV) but also higher churn, representing a direct revenue risk among the most valuable customers.

🌍 Certain cities show higher churn levels, which may indicate differences in customer behavior or potential local issues.

📊 Low points redemption rates suggest that many customers are not fully engaging with the program benefits.

🔗 Overall, the data indicates that churn is strongly linked to declining engagement over time — customers who use the service less tend to leave.

## 💼 Business Recommendations

- Create campaigns targeting customers whose flight activity is decreasing to re-engage them before they churn  
- Prioritize high-value customers (Aurora), as they represent higher revenue but also higher risk  
- Encourage points redemption through more attractive offers to increase engagement  
- Investigate cities with higher churn to identify potential underlying issues  

## ⚠️ Limitations

- Simulated dataset  
- Does not include external factors such as marketing campaigns, pricing, or competition  
- No explicit churn reasons available  

## 🚀 Next Steps

- Enhance customer segmentation  
- Build predictive churn models  
- Improve engagement strategies  
- Increase points redemption rate  

## 📂 Project Structure

Dataset/  
SQL_Analysis/  
Power_BI/  
├── Airline_Loyalty_Analysis.pbix  
└── Images/  
Docs/  
└── data_dictionary.md  
README.md  

## 👤 Author

Developed by João, focused on end-to-end data analysis and data-driven decision-making.
