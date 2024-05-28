CREATE TABLE calisanlar(
	id SERIAL PRIMARY KEY,
	isim varchar(50) UNIQUE,
	maas NUMERIC(10,2) NOT NULL,
	ise_baslama DATE
);

CREATE TABLE adresler(
  
	adres_id  serial,
	sokak varchar (30),
	cadde varchar (30),
	sehir varchar(30),
   FOREIGN KEY (adres_id) REFERENCES calisanlar (id)
);


INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');


SELECT * FROM calisanlar 
-- INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- error verir.çünkü isim UNIQUE olmalıydı

-- INSERT INTO calisanlar VALUES('10006', 'Canan Yaz', NULL, '2019-04-12') --error verir.


-------------------------------------------------------------------

-- PERSON tablosu oluşturalım

CREATE TABLE person (
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);


INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir'); 
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara'); 

SELECT * FROM person;

-------------------------------------------------------------------

-- person tablosunda isim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz

SELECT isim, soyisim FROM person
ORDER BY length(soyisim) ASC

-------------------------------------------------------------------

-- person Tüm isim ve soyisim değerlerini aralarında bir boşluk ile aynı sutunda çağırarak, her bir isim ve soyisim değerinin toplam uzunluğuna göre sıralayınız.

SELECT concat(isim,' ',soyisim) AS isim_soyisim FROM person
ORDER BY length(isim) + length(soyisim)

-------------------------------------------------------------------
