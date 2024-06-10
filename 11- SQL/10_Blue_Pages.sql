 -- 59 ID’li personeli Almanya ya gönderip maaşına da 100 Birim zam yapıldı.
 -- Veritabanındaki gerekli modifikasyonu yapalım
 
SELECT * FROM personel p 

UPDATE personel
SET 
	maas = maas + 100,
	ulke_id = 'DE'
WHERE
	id = 59
	
------------------------------------------------------------------------------

CREATE TABLE haber (
   id SERIAL PRIMARY KEY,
   tarih DATE,
   baslik CHAR(50),
   metin TEXT,
   goruntu INTEGER
);


SELECT * FROM haber

	
------------------------------------------------------------------------------

-- tabloda ozet isimli field eklemeyi unutmuşsunuz. Onu da ekleyelim..

ALTER TABLE haber 
ADD ozet varchar(200);

------------------------------------------------------------------------------

--bu alan için 100 karakter yeterli değil. Bu alanın uzunluğunu 250 karakter yapalım.

ALTER TABLE haber
ALTER ozet TYPE char(250);

------------------------------------------------------------------------------

--ozet filed'ını silelim

ALTER TABLE haber
DROP COLUMN ozet;

------------------------------------------------------------------------------

