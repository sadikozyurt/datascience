CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;


---------------------------------------------------

-- senaryo 1: manav tablosundaki tüm isimleri ve her bir isim için, toplam ürün miktarını görüntüleyiniz.*/
SELECT isim,
	sum(urun_miktar) AS toplam_urun
FROM manav
GROUP BY isim;

---------------------------------------------------

-- Senaryo 2: manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
-- Toplam ürün miktarına göre azalan olarak sıralayınız.*/

SELECT isim,
sum(urun_miktar) AS total_urun
FROM manav
GROUP BY isim
ORDER BY sum(urun_miktar) DESC;

---------------------------------------------------

-- Senaryo 3: Her bir ismin aldığı, her bir ürünün toplam miktarını, isme göre sıralı görüntüleyiniz.*/

SELECT isim,urun_adi,
	sum(urun_miktar) AS toplam_urun
FROM manav
GROUP BY isim, urun_adi --önce isim, sonra ürün adına göre gruplar
ORDER BY  isim;

---------------------------------------------------

-- Senaryo 4: ürün adina göre, her bir ürünü alan toplam kişi sayısını gösteriniz.*/

SELECT urun_adi,
	count(isim) AS toplam_kisi
FROM manav
GROUP BY urun_adi;

-- aynı ürünü alınca görünmemesi için
SELECT 
urun_adi ,
count(DISTINCT isim)
FROM manav m 
GROUP BY urun_adi

---------------------------------------------------

--Senaryo 5: Isme göre, alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz*/


