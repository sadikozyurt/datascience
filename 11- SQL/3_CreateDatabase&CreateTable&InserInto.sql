-- Database oluşturma
CREATE DATABASE test


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



-- INSERT INTO ile veri girişi yapma
INSERT INTO ogrenciler VALUES ('1234567','Tom','Cruise',85.5,'2024-05-25')
INSERT INTO ogrenciler VALUES ('2345678','Ali','Can',90.2,now());


