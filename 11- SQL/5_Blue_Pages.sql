SELECT * FROM personel p

Çocuklar; elemanların adını, soyadını ve maaşını listelediğiniz ekranda 
küçük bir değişiklik istiyorum. Ad sütunununbaşlığı 'A', 
soyad sütununun başlığı ise 'S' olsun. Maaş sütununun başlığı 
yine 'MAAŞ' olarak kalabilir.

SELECT
ad AS "A", --"A" şeklinde değil de A olarak yazsak a olarak değiştirir.
soyad AS "S",
maas
FROM personel ;

-- çift tırnak field isimler tek tırnak value ları belirlemek içindir

-----------------------------------------------------

SELECT * FROM personel p 
WHERE ad = 'Mehmet'

-----------------------------------------------------

SELECT ad,soyad,dogum FROM personel p 
WHERE dogum ='1978-11-1'

-----------------------------------------------------
