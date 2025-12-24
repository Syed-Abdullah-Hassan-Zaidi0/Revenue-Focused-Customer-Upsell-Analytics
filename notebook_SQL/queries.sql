/*
-- to check table--
.tables


-- to check customer--
SELECT COUNT(*) AS total_customers
FROM upsell_predictions;
-- to check data (limit ke sath)
SELECT * 
FROM upsell_predictions
LIMIT 10;



-- 🟦 UPSALE BUSINESS QUERIES (IMPORTANT)
-- 3️⃣ High upsell customers (Top priority)
SELECT customerid,
       upsell_probability,
       upsell_priority
FROM upsell_predictions
WHERE upsell_probability >= 0.80
ORDER BY upsell_probability DESC;

-- 2️⃣ Medium upsell customers (Medium priority)
SELECT customerid,
       upsell_probability
FROM upsell_predictions
WHERE upsell_probability BETWEEN 0.50 AND 0.79
ORDER BY upsell_probability DESC;

-- 1️⃣ Low upsell customers (Low priority)(AVOID)
SELECT customerid,
       upsell_probability   
FROM upsell_predictions
WHERE upsell_probability < 0.50
ORDER BY upsell_probability DESC;

--🟦 REVENUE-FOCUSED QUERIES (HR WOW)
-- 6️⃣ High upsell + high monthly charges

SELECT customerid,
       monthly_charges,
       upsell_probability
FROM upsell_predictions
WHERE upsell_probability >= 0.80
  AND monthly_charges > 80
ORDER BY monthly_charges DESC;

--High value target
--Average monthly charges by upsell priority

SELECT upsell_priority,
       ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM upsell_predictions
GROUP BY upsell_priority;



--🟦 CUSTOMER BEHAVIOR QUERIES
--8️⃣ Contract type vs upsell
SELECT
  contract_one_year,
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob
FROM upsell_predictions
GROUP BY contract_one_year;





PRAGMA table_info(upsell_predictions);


SELECT
  contract_one_year,
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob
FROM upsell_predictions
GROUP BY contract_one_year;



SELECT * FROM upsell_predictions LIMIT 1;*/


--1️⃣ Table check (safe)
SELECT * 
FROM upsell_predictions
LIMIT 5;

--🟦 2️⃣ Total customers
SELECT COUNT(*) AS total_customers
FROM upsell_predictions;

--3 High Upsell Customers (Top Priority)
SELECT customerid,
       upsell_probability,
       upsell_priority
FROM upsell_predictions
WHERE upsell_probability >= 0.80
ORDER BY upsell_probability DESC;


--4️⃣ Revenue Focus (High upsell + high charges)
SELECT customerid,
       monthly_charges,
       upsell_probability
FROM upsell_predictions
WHERE upsell_probability >= 0.80
  AND monthly_charges > 80
ORDER BY monthly_charges DESC;




-- 5️⃣ Contract Type vs Upsell (🔥 HR WOW)
-- 🔹 One-Year Contract Customers

SELECT
  "contract_One year" AS one_year_contract,
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_one_year
FROM upsell_predictions
WHERE "contract_One year" = 1;


--🔹 Two-Year Contract Customers
SELECT
  "contract_Two year" AS two_year_contract,
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_two_year
FROM upsell_predictions
WHERE "contract_Two year" = 1;

--🟦 6️⃣ Payment Method vs Upsell
--Credit Card (Automatic)
SELECT
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_credit_card
FROM upsell_predictions
WHERE "payment_method_Credit card (automatic)" = 1;
--Electronic Check
SELECT
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_electronic_check
FROM upsell_predictions
WHERE "payment_method_Electronic check" = 1;


--7️⃣ Internet Type vs Upsell
--Fiber Optic
SELECT
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_using_fiber
FROM upsell_predictions
WHERE "internet_service_Fiber optic" = 1;

--DSL(AVOID)
SELECT
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_using_dsl   
FROM upsell_predictions
WHERE "internet_service_DSL" = 1; 
--No Internet Service(AVOID)
SELECT
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob_no_internet_service
FROM upsell_predictions
WHERE "internet_service_No" = 1;



-- 8️⃣ Loyalty Insight (Tenure based)
SELECT
  CASE
    WHEN tenure_months < 12 THEN 'New Customers'
    WHEN tenure_months BETWEEN 12 AND 36 THEN 'Mid-term Customers'
    ELSE 'Loyal Customers'
  END AS customer_group,
  COUNT(*) AS customers,
  ROUND(AVG(upsell_probability), 2) AS avg_upsell_prob
FROM upsell_predictions
GROUP BY customer_group;


