-- “markalar” ve “calisanlar3” adinda iki tablo oluşturun.*/


CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

CREATE TABLE calisanlar3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

------------------------------------------------------------

--calisanlar3 tablosunda max maaş değerini bulunuz.

SELECT max(maas)
AS max_maas
FROM calisanlar3

------------------------------------------------------------

--calisanlar3 tablosunda min maaş değerini bulunuz.

SELECT
    MIN(maas) AS min_maas
FROM
    calisanlar3;


------------------------------------------------------------

--calisanlar3 tablosunda toplam maaş değerini bulunuz.

SELECT
    SUM(maas) AS toplam_maas
FROM
    calisanlar3;

------------------------------------------------------------

--calisanlar3 tablosunda ortalama maaş değerini bulunuz.

SELECT
    AVG(maas) AS avg_maas
FROM
    calisanlar3;

------------------------------------------------------------

--calisanlar3 tablosundaki kayıt sayısını bulunuz.

SELECT count(*)
AS kayıt_sayısı
FROM calisanlar3


------------------------------------------------------------

--calisanlar3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.

SELECT count(*) AS
maas_2500_olanlar
FROM calisanlar3
WHERE maas = 2500

---------------------------------------------------------------
-- öğretmenler tablosu oluşturalım

CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,	
city varchar(20),
course_name varchar(20),
salary real	
);

INSERT INTO teachers VALUES(111,'AhmeT  ','  Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES(112,'Mehmet','Ran ',33,'Van','HTML',4000);
INSERT INTO teachers VALUES(113,' Bilal','Fan ',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES(114,'Celal',' San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES(115,'Deniz',' Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES(116,'ekreM','Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES(117,'Fatma','Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES(118,'Hakan','Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES(119,'mert','Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES(120,'Nilay','Cetin',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES(121,'Selma','Celik',40,'Ankara','SpringBOOT',5550);
INSERT INTO teachers VALUES(122,'fatiH','Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES(123,'Nihat','Keskin',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES(124,'Hasan','Temel',37,'Istanbul','S.Security',3000.5);

SELECT * FROM teachers;
----------------------------------------------------------------------------
--teachers tablosundaki tüm kayıtların
--firstname değerlerini büyük harfe,
-- lastname değerlerini küçük harfe çevirerek,
--uzunlukları ile birlikte listeleyiniz.

SELECT
	UPPER(firstname) AS upper_firstname,
	LENGTH(firstname) AS len_firstname,
	LOWER(lastname) AS lower_lastname,
	LENGTH(lastname) AS len_lastname
FROM teachers t 


----------------------------------------------------------------------------
--teachers tablosunda firstname ve lastname değerlerindeki
--başlangıç ve sondaki boşlukları kaldırınız.

SELECT TRIM(firstname), TRIM(lastname)
FROM teachers t 

----------------------------------------------------------------------------
--teachers tablosunda tüm kayıtların firstname değerlerini
-- ilk harfini büyük diğerleri küçük harfe çevirerek görüntüleyiniz.

SELECT 
	firstname,
	initcap(firstname) AS baslangic_buyuk_firstname 
FROM teachers t 





