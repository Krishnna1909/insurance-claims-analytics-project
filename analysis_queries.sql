-- =========================================
-- Insurance Analytics Queries
-- =========================================


-- Query 1: Total Premium Collected in 2024
SELECT SUM(Premium) AS total_premium
FROM policy_sales
WHERE YEAR(Policy_Purchase_Date) = 2024;



-- Query 2: Monthly Claim Cost
SELECT
YEAR(Claim_Date) AS year,
MONTH(Claim_Date) AS month,
SUM(Claim_Amount) AS total_claim_cost
FROM claims_data
GROUP BY year, month
ORDER BY year, month;



-- Query 3: Claim Ratio by Policy Tenure
SELECT
p.Policy_Tenure,
SUM(c.Claim_Amount) / SUM(p.Premium) AS claim_ratio
FROM policy_sales p
LEFT JOIN claims_data c
ON p.Vehicle_ID = c.Vehicle_ID
GROUP BY p.Policy_Tenure;



-- Query 4: Claim Ratio by Sales Month
SELECT
MONTH(p.Policy_Purchase_Date) AS sale_month,
SUM(c.Claim_Amount) / SUM(p.Premium) AS claim_ratio
FROM policy_sales p
LEFT JOIN claims_data c
ON p.Vehicle_ID = c.Vehicle_ID
GROUP BY sale_month;