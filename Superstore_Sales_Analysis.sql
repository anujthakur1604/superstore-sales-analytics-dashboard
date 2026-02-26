/* ============================================================
-- Project: Superstore Sales Analytics
-- Developed by: Anuj Thakur
-- Tools Used: SQL Server, Excel, Power BI
-- Objective: Sales Performance & Profitability Analysis
============================================================ */


/* ------------------------------------------------------------
   1. DATA OVERVIEW
   Purpose: View raw transactional data
------------------------------------------------------------ */
SELECT * 
FROM superstore_sales;



/* ------------------------------------------------------------
   2. BUSINESS KPI SUMMARY
   Objective: Calculate overall performance metrics
   - Total Sales
   - Total Profit
   - Total Orders
------------------------------------------------------------ */
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_sales;



/* ------------------------------------------------------------
   3. REGIONAL PERFORMANCE ANALYSIS
   Objective: Identify top-performing regions by sales & profit
------------------------------------------------------------ */
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESC;



/* ------------------------------------------------------------
   4. CATEGORY-WISE PERFORMANCE ANALYSIS
   Objective: Evaluate sales and profit across product categories
------------------------------------------------------------ */
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;



/* ------------------------------------------------------------
   5. PROFIT MARGIN ANALYSIS BY CATEGORY
   Objective: Measure profitability efficiency per category
------------------------------------------------------------ */
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) * 100.0 / SUM(Sales)), 2) AS Profit_Margin_Percent
FROM superstore_sales
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;



/* ------------------------------------------------------------
   6. TOP 5 CUSTOMERS BY REVENUE
   Objective: Identify highest revenue-generating customers
------------------------------------------------------------ */
SELECT TOP 5
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;



/* ------------------------------------------------------------
   7. CUSTOMER PROFITABILITY CHECK (Top Revenue Customers)
   Objective: Verify whether high-revenue customers are profitable
------------------------------------------------------------ */
SELECT TOP 5
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;



/* ------------------------------------------------------------
   8. CUSTOMER-LEVEL PROFITABILITY INVESTIGATION
   Case Study: Sean Miller
   Objective: Identify category-level profit contribution
------------------------------------------------------------ */
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
WHERE Customer_Name = 'Sean Miller'
GROUP BY Category
ORDER BY Total_Profit ASC;



/* ------------------------------------------------------------
   9. DISCOUNT ANALYSIS FOR SEAN MILLER
   Objective: Compare category-wise average discount impact
------------------------------------------------------------ */
SELECT 
    Category,
    AVG(Discount) AS Avg_Discount
FROM superstore_sales
WHERE Customer_Name = 'Sean Miller'
GROUP BY Category;