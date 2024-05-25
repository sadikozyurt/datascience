-- Database oluşturma
CREATE DATABASE test

-------------------------------------------------------------------
-- Tablo oluşturma
CREATE TABLE 
ogrenciler(
ogrenci_no char (7),
isim varchar (20),
soyisim varchar (30),
not_ort REAL, --ondalıklı sayıları belirtir
kayit_tarihi date
);


--ogrenciler tablosundan bütün fieldları getirir
SELECT  * 
FROM ogrenciler

-------------------------------------------------------------------

-- SQL de tablo oluşturmanın 2 yolu vardır.
-- 1) Birincisi sıfırdan oluşturmaktır
-- 2) diğeri de var olan tablodan belli "field"ları kopyalarak yapmaktır


-- var olan tablodan yeni tablo oluşturmak
CREATE TABLE ogrenci_notlari
AS 
SELECT isim, soyisim, not_ort
FROM ogrenciler 


-- ogrenci_notları tablosundan tüm fieldları getirir
SELECT *
FROM ogrenci_notlari

-------------------------------------------------------------------

-- INSERT INTO ile veri girişi yapma
INSERT INTO ogrenciler VALUES ('1234567','Tom','Cruise',85.5,'2024-05-25')
INSERT INTO ogrenciler VALUES ('2345678','Ali','Can',90.2,now());

-- ogrenci_notları tablosundan tüm fieldları getirir
SELECT *
FROM ogrenci_notlari

-------------------------------------------------------------------

--Tablonun bazı field'larına data ekleme
INSERT INTO ogrenciler (isim, soyisim)
VALUES
('Brad','Pitt')


-- ogrenci_notları tablosundan tüm fieldları getirir
SELECT *
FROM ogrenci_notlari

-------------------------------------------------------------------

/* NOT:
 * çoklu
 * yorum
 * satırı için /* ve */ kullanılır.
 */

-------------------------------------------------------------------

-- Table silme

DROP TABLE ogrenci_notlari

-- ogrenci_notları tablosundan tüm fieldları getirir
SELECT *
FROM ogrenci_notlari

-------------------------------------------------------------------

-- ogrenciler tablosundan isim, soyisim field'larını getirme
SELECT isim, soyisim
FROM ogrenciler

-------------------------------------------------------------------

--CONSTRAINTS/ KISITLAMALAR/BELİRLEYİCİLER

CREATE TABLE ogrenciler2 (
ogrenci_no CHAR (7)UNIQUE,
isim VARCHAR(20)NOT NULL,
soyisim VARCHAR (30)NOT NULL,
not_ort REAL,
kayit_tarihi DATE
);

INSERT INTO ogrenciler2 VALUES ('1234567','Ali', 'Yılmaz', 80, now())
INSERT INTO ogrenciler2 VALUES ('2342567',' ', 'Yılmaz', 90, now())
INSERT INTO ogrenciler2 VALUES ('2242567','Sami','Yılmaz')

SELECT * FROM ogrenciler2

-------------------------------------------------------------------
--PRIMARY KEY ATAMASI 1
CREATE TABLE ogrenciler3 (
ogrenci_no CHAR (7)PRIMARY KEY,
isim VARCHAR(20)NOT NULL,
soyisim VARCHAR (30)NOT NULL,
not_ort REAL,
kayit_tarihi DATE
);


SELECT * FROM ogrenciler3

-------------------------------------------------------------------
--PRIMARY KEY ATAMASI 2
CREATE TABLE ogrenciler4 (
ogrenci_no CHAR (7),
isim VARCHAR(20)NOT NULL,
soyisim VARCHAR (30)NOT NULL,
not_ort REAL,
kayit_tarihi DATE,
CONSTRAINT ogrenci_no_pk PRIMARY KEY (ogrenci_no)
);

SELECT * FROM ogrenciler4
INSERT INTO ogrenciler4 VALUES ('1234567','Veli', 'Yılmaz', 80, now()),

-------------------------------------------------------------------

-- Foreign Key:Tablolar arasında ilişki oluşturmak içindir.
-- Değer olarak "null" kabul eder
-- Tekrarlanan verileri kabul eder
-- Bir tablo birden çok "Foreign Key" alanına sahip olabilir.

CREATE TABLE sirketler (
sirket_id integer,
sirket varchar(50) PRIMARY KEY,
personel_sayisi integer
)

SELECT * FROM sirketler

-----------------------

CREATE TABLE personel (
id integer,
isim varchar(50),
sehir varchar(50),
maas REAL,
sirket varchar(50),
FOREIGN KEY (sirket) REFERENCES sirketler (sirket)
)

SELECT * FROM sirketler

-------------------------------------------------------------------

--CHECK ataması
-- age ve salary için veri giriş şartı oluşturalım
-- salary 5000'den büyük olmalı ve age 0'dan küçük olmamalı

CREATE TABLE person (

id integer,
name varchar (50),
salary REAL CHECK (salary > 5000),
age integer CHECK (age >= 0)
)

SELECT * FROM person
INSERT INTO person values(11,'Ali Can',6000,35),
INSERT INTO person values(12,'Vei Can',5500,-3), --HATA: Age ile ilgili hata verir
INSERT INTO person values(13,'Ali Can',4000,45); -- HATA: Salary ile ilgili hata verir

-------------------------------------------------------------------

-- DISTINCT komutu green_pages database'de gösteriliyor
