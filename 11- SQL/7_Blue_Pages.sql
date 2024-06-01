-- her departmanın toplam maaş miktarı

SELECT departman_id,
SUM(maas) AS maas_toplam
FROM personel p 
GROUP BY departman_id 
ORDER BY departman_id

------------------------------------------------------
-- her departmanın ortalama maaşı

SELECT departman_id,
AVG (maas) AS ort_maas
FROM personel
GROUP BY departman_id 
ORDER BY departman_id 

------------------------------------------------------
-- null değeri hesaba katmadan ortalama

SELECT
    departman_id,
    ROUND(AVG(COALESCE(maas, 0)), 2) AS avg_maas
FROM
    personel
GROUP BY
    departman_id;

------------------------------------------------------
-- her departmanın ortalama maaşı(küsurat olmadan)

SELECT departman_id,
ROUND(AVG (maas)) AS ort_maas
FROM personel
GROUP BY departman_id 
ORDER BY departman_id 

------------------------------------------------------
-- her departmanın ortalama maaşı(virgül sonrası 2 rakamlı)

SELECT departman_id,
ROUND(AVG (maas),2) AS ort_maas
FROM personel
GROUP BY departman_id 
ORDER BY departman_id 

------------------------------------------------------
-- şirkette en yüksek maaş

SELECT MAX(maas) AS max_maas
FROM personel

------------------------------------------------------
-- şirkette en yüksek maaş ile en düşük maaş arasındaki fsrk

SELECT MAX(maas)-MIN(maas) AS fark_maas
FROM personel

------------------------------------------------------
-- herbir departmanda kaç kişi çalışıyor

SELECT 
departman_id,
count(*) AS dep_pers_sayisi
FROM personel p
GROUP BY departman_id 

------------------------------------------------------
--ülkelere göre çalışan sayısı

SELECT 
ulke_id,
count(*) AS ulke_pers_sayisi
FROM personel
GROUP BY ulke_id 

------------------------------------------------------

