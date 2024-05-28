-- personel tablosundaki bütün elemanların listesini (tüm field'lar) getirir

SELECT * FROM personel





--------------------------------------------------------------------------------------------

-- bütün elemanların ad,soyad ve maaş bilgilerini getirir

SELECT  ad,soyad,maas FROM personel 





--------------------------------------------------------------------------------------------

-- Şimdiye kadar en az bir sipariş vermiş olan müşterilerin ID'lerinin listesini getirir

SELECT musteri_id FROM siparis --bu şekilde yazılırsa sipariş listesinde tekrar eden müşteri id'ler olabilir

SELECT DISTINCT  musteri_id FROM siparis -- bu şekilde ise sipariş listesinde tekrar eden müşteri id'leri kaldırılır (unique getirir)


--------------------------------------------------------------------------------------------

-- Şirketimize ilk siparişi vermiş olan müşterimize küçük bir ödül vermek istiyoruz.
-- Müşterinin ID numarasını getirir misiniz ?

SELECT musteri_id AS musteri
FROM siparis
ORDER BY id
LIMIT 1

--------------------------------------------------------------------------------------------