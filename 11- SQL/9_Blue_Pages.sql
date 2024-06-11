-- BLue Pages Database

-- Team LEAD:
--59 ID’li personeli Almanya ya gönderip maaşına da 
--100 Birim zam yapıldı. Veritabanındaki gerekli modifikasyonu yapalım

SELECT * FROM personel p 

UPDATE personel 
SET 
	maas = maas + 100,
	ulke_id = 'DE'
WHERE id = 59
--NOT: eğer where koşulu olmadan yazılırsa tüm tablo SET 
-- ifadesindeki gibi değişmiş olurdu

--ALTER TABLE konusu

CREATE TABLE haber (
    id SERIAL PRIMARY KEY,
    tarih DATE,
    baslik CHAR(50),
    metin TEXT,
    goruntu INTEGER
);

SELECT * FROM haber

-- TEam Lead:
--Database’e eklediğiniz haber tablosu için teşekkür ederim. 
-- Ama o tabloda ozet isimli field eklemeyi unutmuşsunuz. Onu da ekleyelim..

ALTER TABLE haber
ADD ozet char(100);

-- Ozet alanı için teşekkürler. Lakin bu alan için 100 
--karakter yeterli değil. Bu alanın uzunluğunu 250 
-- karakter yapalım.

ALTER TABLE haber
ALTER COLUMN ozet TYPE char(250);

-- eğer ozet field ı silmek istersek:
--  ALTER TABLE haber
--  DROP COLUMN ozet;

-- INNER JOIN KONUSU
--Bana her bir personelin ID’sini, adını ve soyadını; 
--bunun yanı sıra çalıştığı departmanın ID’sini ve adını 
--bir arada listeleyip getirin.

SELECT * FROM personel p 

SELECT 
p.id AS personel_id,
p.ad AS AD,
p.soyad AS SOYAD,
p.departman_id AS departman_id,
d.ad AS departman_adi
FROM personel p 
INNER JOIN departman d 
ON p.departman_id = d.id 



SELECT * FROM departman d 

















