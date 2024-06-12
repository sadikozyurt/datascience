--Şirketimze İLK sipariş vermiş olan müşterimizin özlük bilgilerini alabilir miyim?

SELECT * FROM musteri m
SELECT * FROM siparis s

-- 1. AŞAMA

SELECT musteri_id AS Musteri
FROM siparis s
ORDER BY id
LIMIT 1

--2. AŞAMA

SELECT *
FROM musteri m
WHERE id = 18


--NESTED QUERY İLE

SELECT *
FROM musteri m
WHERE id = (
			SELECT musteri_id AS Musteri
			FROM siparis s
			ORDER BY id
			LIMIT 1
			);

------------------------------------------------------------------------------------------
	
--Şirketimze SON sipariş vermiş olan müşterimizin özlük bilgilerini alabilir miyim?

SELECT * FROM musteri m
SELECT * FROM siparis s


-- 1. AŞAMA

SELECT musteri_id AS Musteri
FROM siparis s
ORDER BY id DESC
LIMIT 1

--2. AŞAMA

SELECT *
FROM musteri m
WHERE id = 18


--NESTED QUERY İLE

SELECT *
FROM musteri m
WHERE id = (
			SELECT musteri_id AS Musteri
			FROM siparis s
			ORDER BY id DESC
			LIMIT 1
			);
			

------------------------------------------------------------------------------------------

--Şirketimze en yüksek maaşı alan kişinin özlük bilgilerini öğrenebilir miyim?

-- 1. aşama
		
SELECT max(maas) AS MAX_MAAS
FROM personel p

--2. aşama
SELECT * 
FROM personel p
WHERE maas = (
			  SELECT max(maas)
			  FROM personel p
			  );
			
------------------------------------------------------------------------------------------
		
