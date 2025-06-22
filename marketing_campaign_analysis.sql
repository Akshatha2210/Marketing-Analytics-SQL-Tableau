/*1. Total number of customers*/
SELECT COUNT(*) AS total_customers
from campaign.marketing_campaign; 

/*2. Average customer income*/
SELECT AVG(income) AS avg_income
from  campaign.marketing_campaign; 

/* 3. Customer count by education level*/
SELECT education,COUNT(*) as customer_count
from campaign.marketing_campaign
group by Education
order by customer_count DESC

/* 4. Average spending (mnttotal) by marital status*/
SELECT marital_status, AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS average_spending
FROM marketing_campaign
GROUP BY marital_status;

/* 5. Find customers who responded to the campaign*/
SELECT COUNT(*) AS total_responders
FROM marketing_campaign
WHERE response = 1;

/* 6. Monthly average income grouped by year-month*/
SELECT DATE_FORMAT(dt_customer, '%Y-%m') AS year_months, AVG(income) AS avg_income
FROM marketing_campaign
GROUP BY year_months
ORDER BY year_months;

/*7. Customer Segmentation by Income Brackets*/
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 70000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS customer_count
FROM marketing_campaign
GROUP BY income_group;

/* 8. Customers Who Responded and Made Web Purchases*/
SELECT COUNT(*) AS responders_with_web_purchases
FROM marketing_campaign
WHERE Response = 1 AND NumWebPurchases > 0;

/* 9. Customers with Kids at Home*/
SELECT COUNT(*) AS customers_with_kids
FROM marketing_campaign
WHERE Kidhome > 0 OR Teenhome > 0;

/* 10. Most Loyal Customers (Lowest Recency & Highest Spending)*/
SELECT ID, Income, Recency, (MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent
FROM marketing_campaign
ORDER BY Recency ASC, total_spent DESC
LIMIT 10;
