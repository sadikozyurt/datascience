-- adı Mehmet veya Dilek olan tüm çalışanlar

SELECT * FROM personel
WHERE ad='Mehmet'
OR ad='Dilek'

---------------------------------------------------------------

-- adı Mehmet veya Dilek olan tüm çalışanlardan maaşı 1400'den büyük olan çalışanlar

SELECT * FROM personel
WHERE maas > 1400
AND (ad='Mehmet' OR ad='Dilek')


-- ALTERNATİF OLARAK 
SELECT *
FROM customers c
WHERE score >= 100 AND score <= 500;

---------------------------------------------------------------

SELECT id, ad, soyad,maas FROM personel
WHERE maas BETWEEN 1000 AND 2000
ORDER BY maas

---------------------------------------------------------------

-- 1978 yılında doğmuş bütün çalışanların ad, soyad ve doğum günü bilgileri

SELECT ad, soyad, dogum FROM personel 
WHERE dogum BETWEEN '1978-01-01' AND '1978-12-31'


---------------------------------------------------------------

-- Her personelin id, ad ,soyad ve 21 Aralık 2012 tarihinde kaç yaşında olduğunu getir

SELECT id, ad, soyad, (('2012-12-21' - dogum)/365) AS gun_farki
FROM personel 

---------------------------------------------------------------

-- İsmi Mehmet, Dilek veya Cengiz olan bütün çalışanları listeleyin. Liste ad ve soyada göre sıralanmış olsun.

SELECT * FROM personel
WHERE ad IN ('Mehmet','Dilek','Cengiz')
ORDER BY ad,soyad

---------------------------------------------------------------

-- soyadı 'oğlu' ile biten tüm personel

SELECT * FROM personel
WHERE soyad  LIKE '%oğlu'

---------------------------------------------------------------

-- isminde h haarfi geçen tüm personel

SELECT * FROM personel
WHERE ad  LIKE '%h%'

---------------------------------------------------------------

-- ada göre sıralı liste

SELECT * FROM personel
ORDER BY ad ASC

---------------------------------------------------------------

-- tüm çalışan sayısı

SELECT count(*) FROM personel

---------------------------------------------------------------

--Bana bütün şirket çalışanlarının ad, soyad ve maaş bilgilerinin tam listesi lazım.
--Bu listeyi öyle hale getirin ki; ada göre ters, soyada göre ters ve maaşa göre düz bir şekilde sıralanmış olsun.


SELECT ad, soyad,maas FROM personel
ORDER BY ad DESC, soyad DESC, maas ASC 

---------------------------------------------------------------

-- tüm maaş toplam miktarı

SELECT sum(maas) AS maas_toplam FROM personel

---------------------------------------------------------------

-- ismi mehmet olan çalışanların  maaş toplam miktarı

SELECT sum(maas) AS maas_toplam FROM personel
WHERE ad ='Mehmet'

---------------------------------------------------------------

-- muhasebe departmanından kaç para maaş verilecek toplam

SELECT sum(maas) AS muhasebe_maas
FROM personel p
WHERE departman_id = 1
