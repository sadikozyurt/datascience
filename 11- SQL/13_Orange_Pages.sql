CREATE TABLE musteriler (
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;


-------------------------------------------------------------------------

--Müşteriler tablosundan ürün ismi 'Orange', 'Apple' veya 'Apricot'
--olan verileri listeleyiniz.

SELECT *
FROM musteriler m 
WHERE urun_isim IN ('Orange','Apple','Apricot');

-------------------------------------------------------------------------

--Senaryo 1: marka_id si 100 olan firmada çalışanların bilgilerini listeleyiniz (markalar ve calisanlar3 tablosuna göre)

--1
SELECT marka_isim
FROM markalar m 
WHERE marka_id = 100; --Vakko

--2
SELECT * FROM calisanlar3 c 
WHERE isyeri = 'Vakko'

--nested ile
SELECT *
FROM calisanlar3 c 
WHERE isyeri = (
				SELECT marka_isim
				FROM markalar m 
				WHERE marka_id = 100
				)
				
SELECT * FROM markalar
SELECT * FROM calisanlar3 c 
------------------------------------------------------------------------

--Senaryo 2: (INTERVIEW QUESTION) calisanlar3 tablosunda max maaşı alan çalışanın tüm fieldlarını listeleyiniz.


SELECT * 
FROM calisanlar3 c 
WHERE maas (
			SELECT max(maas)
			FROM calisanlar3 c2
			);
			
------------------------------------------------------------------------

--Senaryo 3: (INTERVIEW QUESTION) calisanlar3 tablosunda max 2. maaşı alan çalışanın tüm fieldlarını listeleyiniz.


SELECT *
FROM calisanlar3 c
WHERE maas IN(
               SELECT maas
               FROM calisanlar3 c
               ORDER BY maas DESC
               LIMIT 1
               OFFSET 1
              );
              
------------------------------------------------------------------------
             
---Senaryo 3: calisanlar3 tablosunda max veya min maaşı alan çalışanların tüm fieldlarını gösteriniz.

--1. yol
             
SELECT *
FROM  calisanlar3 c
WHERE maas = (SELECT max(maas) FROM calisanlar3 c2)
			  OR
	  maas = (SELECT min(maas) FROM calisanlar3 c2)
	  
--2. yol

--2.yol:
select * from calisanlar3
where maas IN
((select max(maas) from calisanlar3),
(select MIN(maas) from calisanlar3))

--3. yol

SELECT *
FROM calisanlar3 c
WHERE maas IN(
               SELECT max(maas)
               FROM calisanlar3 c
               UNION
               SELECT min(maas)
               FROM calisanlar3 c2
              )
              
              
------------------------------------------------------------------------

--Senaryo 4: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
              
SELECT marka_id, calisan_sayisi
FROM markalar m
WHERE marka_isim IN(
               SELECT marka_isim
               FROM calisanlar3 c2
               WHERE sehir = 'Ankara'
              );    
              
------------------------------------------------------------------------------
             
--Senaryo 6: Çalisan sayisi 15.000’den cok olan markalarin
--isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyiniz.


SELECT isim, maas
FROM calisanlar3 c
WHERE isyeri IN(
                    SELECT marka_isim
                    FROM markalar
                    WHERE calisan_sayisi > 15000
                    );
                   
------------------------------------------------------------------------------
--Senaryo 7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.


SELECT marka_id,
marka_isim, (
			SELECT count (DISTINCT (sehir))
			FROM calisanlar3
			WHERE isyeri = marka_isim
			)
FROM markalar

------------------------------------------------------------------------------
--Senaryo 8: Her markanin ismini, calisan sayisini ve
--o markaya ait calisanlarin maksimum ve min maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim, calisan_sayisi, (
									SELECT max(maas) FROM calisanlar3 c
									WHERE c.isyeri = m.marka_isim
									), (
										SELECT min(maas) FROM calisanlar3 c
										WHERE c.isyeri = m.marka_isim
										)
									
FROM markalar m

------------------------------------------------------------------------------

CREATE TABLE mart
(     
urun_id int,      
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(     
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
SELECT * FROM nisan;

-------------------------------------------------------

--Senaryo 1: “mart” ve “nisan” adlarinda iki tablo oluşturunuz ve Mart ayında 
--'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.

--where exist kullanınca parantezler arasında true, false sorgusu yaparız. true çıkarsa üst taraf çalışır

SELECT * 
FROM nisan n 
WHERE EXISTS (
				SELECT *
				FROM mart m 
				WHERE urun_isim ='Toyota'
				);
-------------------------------------------------------
			
-- Senaryo 2:
-- Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT *
FROM nisan n
WHERE EXISTS (
				SELECT *
				FROM mart m
				WHERE urun_isim ='Volvo'
				);
-------------------------------------------------------
			
--Senaryo 3: Mart ayında satılan ürünlerin urun_id ve musteri_isim’lerini,
--eğer urun(urun_isim) Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız	

SELECT urun_id, musteri_isim
FROM mart m
WHERE EXISTS (
				SELECT urun_isim
				FROM nisan n
				WHERE n.urun_isim = m.urun_isim
				);
			
-------------------------------------------------------
	--Senaryo 4: Her iki ayda birden satılan ürünlerin urun_isim’lerini,
	--bu ürünleri NİSAN ayında satın alan musteri_isim’lerine gore listeleyen bir sorgu yazınız		

SELECT urun_isim, musteri_isim
FROM nisan n
WHERE EXISTS (
				SELECT *
				FROM mart m
				WHERE n.urun_isim = m.urun_isim
				);

			
-------------------------------------------------------

-- VIEW Kullanımı
/* Bazı sorguları tekrar tekrar yazmak yerine ilgili kısmı hafızasına alması için Create View yapılır ve daha sonra Select ile çağırılır..
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine view'e atadığımız ismi SELECT komutuyla çağırırız
*/

--- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
-- maksimum ve minimum maaşini listeleyen bir Sorgu yaziniz.

CREATE VIEW max_min_maas
AS
SELECT calisan_sayisi ,
marka_isim,
(SELECT max(maas) AS max_maas FROM calisanlar3 c WHERE c.isyeri = m.marka_isim),
(select min(maas) AS min_maas FROM calisanlar3 c WHERE isyeri = m.marka_isim
)
FROM markalar m;

--Yukardaki View ile kaydettiğim sorguyu çağırmak için alttaki gibi yazarız
SELECT * FROM max_min_maas


-- silmek için DROP VIEW max_min_maas
-- değiştirmek için REPLACE VIEW
			
