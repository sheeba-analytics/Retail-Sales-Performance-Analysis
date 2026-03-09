
USE Retail_Business

Select * From Products

--Total number of products
SELECT COUNT(DISTINCT name) AS total_products
FROM Products;


--Total Sales
SELECT ROUND(SUM(discount_price),2) AS total_sales
FROM Products;

--Average Sales
SELECT ROUND(AVG(discount_price),2) AS average_sales
FROM Products;

--Average Rating
SELECT ROUND(AVG(ratings),2) AS average_ratings
FROM Products;

--Average Number Of Rating
SELECT ROUND(AVG(no_of_ratings),2) AS average_no_of_ratings
FROM Products;


--Products per category & subcategory

SELECT
    main_category,
    sub_category,
    COUNT(DISTINCT name) AS total_products
FROM Products
GROUP BY main_category, sub_category
ORDER BY main_category, total_products DESC;

--Average actual vs discount price by category
SELECT 
    main_category,
    ROUND(AVG(actual_price),2) AS avg_actual_price,
    ROUND(AVG(discount_price),2) AS avg_discount_price
FROM Products
GROUP BY main_category;

--Discount percentage per product
SELECT 
    name,
    main_category,
	sub_category,
    actual_price,
    discount_price,
    CASE
    WHEN actual_price IS NULL
      OR discount_price IS NULL
      OR actual_price <= 0
      OR discount_price < 0
      OR discount_price > actual_price
    THEN 0
    ELSE ROUND(
        (actual_price - discount_price) * 100.0 / actual_price,2)
	END AS discount_percentage
FROM Products


--Average rating by category & subcategory
SELECT 
    main_category,
    sub_category,
    ROUND(AVG(ratings), 2) AS avg_rating
FROM Products
GROUP BY main_category, sub_category
ORDER BY avg_rating DESC;

--Products with high rating but low number of ratings
SELECT 
    name,
    ratings,
    no_of_ratings
FROM Products
WHERE ratings >= 4.5
  AND no_of_ratings < 50
ORDER BY no_of_ratings DESC;

--Most reviewed products
SELECT TOP 25
    main_category,name,
    AVG(no_of_ratings) AS avg_reviews
FROM Products
GROUP BY main_category,name
ORDER BY avg_reviews DESC;

--Average number of ratings per category
SELECT 
    main_category,
    AVG(no_of_ratings) AS avg_reviews
FROM Products
GROUP BY main_category
ORDER BY avg_reviews DESC;

--Top 3 products within category by rating
WITH item_count AS(
	SELECT main_category,sub_category,name,count(no_of_ratings) as avg_reviews,
       ROW_NUMBER() OVER (PARTITION BY main_category ORDER BY count(no_of_ratings) DESC) AS rating_rank
	FROM Products
	GROUP BY main_category,sub_category,name
	)
SELECT rating_rank, main_category,sub_category,name, avg_reviews 
FROM item_count
WHERE rating_rank <= 3

--Rating per price unit    
--highest value_score = best value product
--Top 25 Best Value Products
SELECT Top 25
    name,
	main_category,
    ratings,
    discount_price,
	no_of_ratings,
	ROUND (ratings / discount_price, 4) AS value_score 
FROM Products
WHERE discount_price > 0 
	AND discount_price <= actual_price
	AND no_of_ratings >= 100
ORDER BY value_score DESC;

--Categories with high rating but high price

SELECT 
    main_category,
    ROUND(AVG(ratings), 2) AS avg_rating,
    ROUND(AVG(discount_price), 2) AS avg_price
FROM Products
WHERE discount_price > 0 
	AND discount_price <= actual_price
GROUP BY main_category
HAVING AVG(ratings) >= 4
ORDER BY avg_price DESC;

--To check null values
SELECT *
FROM Products
WHERE actual_price   IS NULL
   OR discount_price IS NULL
   OR ratings         IS NULL;

SELECT COUNT(*) AS rows_with_nulls
FROM Products
WHERE actual_price   IS NULL
   OR discount_price IS NULL
   OR ratings         IS NULL;

--Find Duplicate  Products
SELECT *
FROM Products
WHERE name IN (
    SELECT name
    FROM Products
    GROUP BY name
    HAVING COUNT(*) > 1
)
ORDER BY name;


