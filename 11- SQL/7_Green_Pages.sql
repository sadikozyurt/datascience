--ortalama skor

SELECT AVG(score) AS AVG_score
FROM customers

---------------------------------------------

-- eğer null değere bir değer verip ortalamaya katmak istersek

SELECT AVG(COALESCE(score, 0)) AS AVG_score -- NULL değeri 0 yaptı ve ortalama aldı
FROM customers

---------------------------------------------

--müşterilerin maximum score değeri nedir?
SELECT
MAX(score) AS max_score
FROM customers c

---------------------------------------------

--müşterilerin minimum score değeri nedir?
SELECT
MIN(score) AS max_score
FROM customers c

---------------------------------------------
-- son order 
SELECT order_date
FROM orders
ORDER BY order_date  DESC
LIMIT 1

---------------------------------------------
-- son order (alternatif)

SELECT MAX(order_date) AS first_order FROM orders o 

---------------------------------------------
-- ilk order

SELECT MIN(order_date) AS first_order FROM orders o 

---------------------------------------------

/*
TRIM(Sütun parametresi) string ifadenin başındaki ve sonundaki boşluk karakterlerini siler
LTRIM sadece soldan boşluk siler
RTRIM sadece sağdan boşluk siler
REPLACE(sütun,'değişecek ifade','yeni ifade') belirtilen ifadeyi o sütunda bulursa, belirlediğiniz yeni ifade ile değiştirir
bir değişiklik yaptığı için UPDATE ile kullanılır
CONCAT(sütunadı, 'string') iki veya daha fazla dizeyi birleştirme işlemi için kullanılır
SUBSTRING(sütun adı,başlangıç index,bitiş index) o sütunda belirtilen index aralığındaki string değerini verir
istediğimiz bir sütunda stringlerin istediğimiz kısımlarını değiştirebiliriz. Tek index ilede çalışır belirtilen kısımdan 
en sona kadar alır
UPPER (sütun adı) o sütundaki strng değerleri büyük harfle getirir 
LOWER (sütun adı) o sütundaki strn değerleri küçük harfle getirir 
INITCAP(sütun adı) o sütundaki her bir satırdaki stringlerin baş harfini büyük harf yapar
LENGTH(sütun adı) belirtilen sütundaki her satır içinde bulunan stringlerin uzunluklarını alır 
REVERSE(sütun adı) sütunu ters çevirir
LEFT() / RIGHT() (Başlangıç ve Son Karakterler): Bir dizinin başlangıç veya sonundaki belirli karakterleri alır.
LEFT(sütun, 3) ilk 3 karakteri alır RIGHT olsa son 3 karakteri alırdı
--FETCH NEXT n ROW ONLY: sadece sıradaki ilk n satırı getirir
--                LIMIT n : sadece sıradaki ilk n satırı getirir
--                OFFSET n : n satırı atlayıp sonrakileri getirir
*/ 
--------------------------------------------------------------

--ad, soyad arasına - koyarak birleştirme

SELECT concat(first_name,'-',last_name)AS new_name
FROM customers

--------------------------------------------------------------

-- adları büyük harf yap

SELECT upper(first_name)AS upper_name
FROM customers

--------------------------------------------------------------

-- soyadları küçük harf yap

SELECT lower(last_name)AS upper_last_name
FROM customers

--------------------------------------------------------------

SELECT last_name,
length(last_name) AS len_lastname,   -- Trim öncesi uzunluklar (trim boşlukları siler)
TRIM(last_name) AS clean_lastname,  -- Trim işlemi
LENGTH(TRIM(last_name))AS clean_len_lastname --Trim sonrası uzunluklar
FROM customers c

--------------------------------------------------------------

--SUBSTRING
-- Kelimenin  belli bir bölümünü almak için

SELECT 
last_name,
substring(last_name,2,3) 
FROM customers c 

--------------------------------------------------------------
-- ülkelere göre toplam müşteri sayısını bulalım.
SELECT
country,
count(*) AS total_customer
FROM customers
GROUP BY country
ORDER BY count(*)

--------------------------------------------------------------
--her bir ülke için en yüksek skoru getirin

SELECT 
max(score) AS max_score
FROM customers c 
GROUP BY country

--------------------------------------------------------------
-- herbir ülke için toplam müşteri sayısını bul ve müşteri sayısı 1'den fazla olanları getir 
SELECT
	country,
	COUNT(*) AS total_customer
FROM customers c
GROUP BY country
HAVING count(*)>1

--------------------------------------------------------------

