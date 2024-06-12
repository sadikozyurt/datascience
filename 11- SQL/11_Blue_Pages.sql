
SELECT * FROM personel p
SELECT * FROM ulke u


--Her bir personelin adını, soyadını ve ülkesinin ismini listeleyin.
--Liste; ülke adı, personel adı ve personel soyadına göre sıralanmış olsun.

SELECT 
u.ad AS millet,
p.ad AS adi,
p.soyad AS soyadi
FROM personel p
INNER JOIN ulke u
ON p.ulke_id = u.ad 
ORDER BY u.ad, p.ad, p.soyad

------------------------------------------------------------------------------------

--Bana öyle bir liste hazırlayın ki, içinde her bir ülkenin
--ID’si, ismi ve o ülkeden gelen personelin sayısı olsun.

SELECT 
u.id AS ID,
u.ad AS ULKE,
count(p.id) AS TOPLAM
FROM ulke u
INNER JOIN personel p
ON p.ulke_id = u.ad
GROUP BY u.ad, u.id

------------------------------------------------------------------------------------

-- ÖNEMLİ nOT:
--Pratikte; COUNT,SUM gibi matematiksel komutlar söz konusu
--olduğunda,sayılan alan haricindeki (ÖRNE. COUNT(*))
--bütün alanları GROUP BY listesine dahil etmemiz gerekecektir.



--Herbir departmanın ID’sini, adını ve o departmana ödenen toplam maaşı
--tek bir liste içinde görmek istiyorum

SELECT 
d.id,
d.ad,
sum(p.maas)
FROM personel p
INNER JOIN departman d
ON p.departman_id = d.id 
GROUP BY d.id ,d.ad;


------------------------------------------------------------------------------------

--Çocuklar, bana getirdiğiniz listeyi maaş toplamına
--göre artan şekilde sıralar mısınız ?

SELECT
d.id AS departman_id,
d.ad AS departman_ad,
sum(p.maas)
FROM departman d
INNER JOIN personel p
ON p.departman_id  = d.id
GROUP BY d.ad, d.id
ORDER BY sum(p.maas)


------------------------------------------------------------------------------------

-- Personele ödenen maaşları ülke bazında toplayıp listeleminizi istiyorum.
--Çıktılar ülke ismine göre sıralanmış olsun

SELECT 
u.id AS ID,
u.ad AS millet,
sum(p.maas) AS toplam_maas
FROM personel p
INNER JOIN ulke u
on u.ad = p.ulke_id 
GROUP BY u.id, u.ad 
ORDER BY u.ad

------------------------------------------------------------------------------------

--Aylık maaşı 2.000 den fazla olan kişilerin maaşlarının toplamını ülke bazında görmek istiyorum.
--Çıktı listesinde ülkenin ID si, adı ve maaş toplamı yer alsın.

SELECT
u.ad AS millet,
u.id AS ID,
sum(p.maas)
FROM ulke u
INNER JOIN personel p
ON u.ad = p.ulke_id
WHERE maas > 2000
GROUP BY u.ad, u.id;

------------------------------------------------------------------------------------

-- Departmanlara ödenecek toplam maaşları departman ID si
--ve ad bazında listelemenizi istiyorum. Ancak, bu listede
--sadece, toplam ödenecek maaş tutarı 10.000 in üzerinde
-- olan departmanlar yer alsın.

SELECT
d.id AS ID,
d.ad AS Departman,
sum(p.maas) AS top_maas
FROM personel p
INNER JOIN departman d
ON d.id = p.departman_id
GROUP BY d.id, d.ad
HAVING sum(p.maas)> 10000

------------------------------------------------------------------------------------

--Şirketimizde çalışan bütün personelin ve bütün müşterilerimizin 
--ad, soyad, E-Posta ve doğum günü bilgilerini tek bir liste içinde görmek istiyorum.

SELECT
	ad,
	soyad,
	dogum,
	email
FROM personel p
UNION
SELECT
	ad,
	soyad,
	dogum,
	email
FROM musteri m
------------------------------------------------------------------------------------


