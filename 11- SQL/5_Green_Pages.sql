SELECT * FROM employees e 

SELECT salary, salary*0.1 AS bonus --bonus olarak yeni bir geçici sütun oluşturabiliriz.
FROM employees e 

SELECT salary
FROM employees e 

---------------------------------------------------------------------------

-- WHERE satır bazlı sorgulama yapar

SELECT * FROM customers
WHERE country = 'Germany' -- tek tırnak value, çift tırnak field

---------------------------------------------------------------------------

SELECT * FROM customers c 
WHERE score > 500

---------------------------------------------------------------------------

SELECT *
FROM customers
WHERE score < 400 AND country = 'Germany'

---------------------------------------------------------------------------

SELECT *
FROM customers c
WHERE country = 'Germany'
AND score < 400

---------------------------------------------------------------------------
