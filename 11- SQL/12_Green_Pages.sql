--nested query yapmak için

-- 1. AŞAMA

SELECT customer_id
FROM customers c
WHERE score > 500
			
--2. AŞAMA

SELECT *
FROM orders o
WHERE customer_id IN(2,3);		
				
--NESTED QUERY İLE

SELECT *
FROM orders o
WHERE customer_id IN(
					SELECT customer_id
					FROM customers c
					WHERE score > 500
					);
					
-----------------------------------------------------------------------