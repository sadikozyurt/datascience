SELECT * 
FROM orders o 
WHERE EXISTS(
			 SELECT 1
			 FROM customers c 
			 WHERE c.customer_id = o.customer_id 
			 AND 
			 score >500
			);
			
-------------------------------------------------------------------------
		