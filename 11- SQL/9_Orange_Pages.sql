-- Orange Pages Database

SELECT * FROM person p 

-- DROP TABLE ifadesi tüm tabloyu (satırlar ve sütunların hepsi) kaldırır
DROP TABLE person 

-- VACUUM komutu
/* PostgreSQL'de bir tablo veya veri silindiğinde disk 
 * alanını geri kazanmak istiyorsanız, VACUUM komutunu 
 * kullanabilirsiniz. VACUUM komutu silinen verilerin yer 
 * kaplamasını önler, boş alanı temizler ve veritabanındaki
 *  diğer işlemler için kullanılabilir hale getirir. 
-- Syntax: VACUUM FULL table_name;
-- MySQL de PURGE komutunmunu karşılığı */

-- ALTER TABLE konusu
-- Senaryo 1: calisanlar4 tablosuna yas (int) seklinde yeni sutun ekleyiniz */

SELECT * FROM calisanlar4

ALTER TABLE calisanlar4
ADD COLUMN yas int ;
 
--Senaryo 2: calisanlar4 tablosuna remote (boolean) seklinde yeni sutun ekleyiniz. 
--varsayılan olarak remote değeri TRUE olsun

ALTER TABLE calisanlar4 
ADD remote BOOLEAN DEFAULT TRUE;

--Senaryo 3: calisanlar4 tablosunda yas sutununu siliniz

ALTER TABLE calisanlar4 
DROP yas

--Senaryo 4: calisanlar4 tablosundaki maas sutununun data tipini 
-- real olarak güncelleyiniz
ALTER TABLE calisanlar4
ALTER COLUMN maas TYPE REAL;


-- Senaryo 9: calisanlar4 tablosunda isim sütununa 
--NOT NULL constrainti ekleyiniz.

ALTER TABLE calisanlar4 
ALTER COLUMN isim SET NOT NULL
-- NOT: NOT NULL eklenen field'ın mevcut halinin de bu kritere 
--uygun olması gerekir. Aksi halde hata alırız




