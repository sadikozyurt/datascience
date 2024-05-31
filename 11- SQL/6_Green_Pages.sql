-- Ülkesi Germany veya skoeu 500'den küçük müşteriler

SELECT * FROM customers
WHERE country = 'Germany'
OR score < 500

---------------------------------------------------------------

---------------------------------------------------------------

-- skoru 400'den küçük olmayan müşteriler

SELECT * FROM customers
WHERE NOT score < 400

---------------------------------------------------------------

---------------------------------------------------------------

-- skoru 100 ile 500 arasında olan tüm müşteriler

SELECT * FROM customers
WHERE score between 100 AND 500 ---100 ve 500 dahil olarak getirir

---------------------------------------------------------------

-- id numarası 1,2 veya 5 olan çalışanların tüm bilgileri

SELECT *
FROM customers c
WHERE customer_id IN (1, 2, 5)

---------------------------------------------------------------

-- n harfi ile biten adların hepsi

SELECT first_name  FROM customers c 
WHERE first_name  LIKE '%n'

---------------------------------------------------------------

-- 3. harfi r olan adların hepsi

SELECT first_name  FROM customers c 
WHERE first_name  LIKE '__r%'

---------------------------------------------------------------

-- M harfi ile başlaya adların hepsi

SELECT first_name  FROM customers c 
WHERE first_name  LIKE 'M%'

---------------------------------------------------------------

-- içinde r harfi geçen adların hepsi

SELECT first_name  FROM customers c 
WHERE first_name  LIKE '%r%'

---------------------------------------------------------------

SELECT * FROM customers c 

-- Her bir ülke için total customer sayılarını getir sonra sırala

SELECT count (*) AS total_customers,country  FROM customers c 
GROUP BY country 
ORDER BY count (*) ASC 


---------------------------------------------------------------

SELECT count (*) AS total_customers FROM customers c 

---------------------------------------------------------------

SELECT count (score) AS total_customers FROM customers c 

---------------------------------------------------------------

SELECT count (customer_id) AS total_customers FROM customers c 
---------------------------------------------------------------

SELECT count (score) AS total_customers FROM customers c 

---------------------------------------------------------------
-- tüm order sayısı

SELECT sum(quantity) AS sum_quantity FROM orders

---------------------------------------------------------------