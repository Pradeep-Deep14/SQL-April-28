SELECT * FROM walmart_eu;

/*
--Question
Write a query to find the highest-selling 
product for each customer

Return cx id, product description, 
and total count of purchase.

*/ 
-- cx all product they purchased and their total orders
-- order by by number of purchase desc
-- 1 product that has highest purchase 
-- rank 

SELECT CUSTOMERID,DESCRIPTION,TOTAL_PURCHASE
FROM
(
SELECT CUSTOMERID,
	   DESCRIPTION,
	   COUNT(*)AS TOTAL_PURCHASE,
	   RANK()OVER(PARTITION BY CUSTOMERID ORDER BY COUNT(*) DESC )AS RNK
FROM WALMART_EU
GROUP BY CUSTOMERID,DESCRIPTION
ORDER BY CUSTOMERID,TOTAL_PURCHASE DESC
)AS SUBQUERY
WHERE RNK=1



