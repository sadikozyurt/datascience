/* ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS 
 * islemleri icin kullanilir.
   ALTER TABLE ifadesi tablolari yeniden isimlendirmek 
   (RENAME) icin de kullanilir. */
   
   
CREATE TABLE public.persons (
id SERIAL PRIMARY KEY,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL UNIQUE
);

--------------------------------------------------------------------

SELECT * FROM persons p 

--TASK: persons tablosuna 15 karakterlik email filed ekleyelim

ALTER TABLE persons
ADD email varchar(15) NOT NULL


----------------------------------------------------------------------

--TASK: persons tablosuna 100 karakterlik adres filed ekleyelim

ALTER TABLE public.persons -- public olmasa da olur
ADD COLUMN adres varchar(100); -- ADD COLUMN yazarken COLUMN olmasa da olur

----------------------------------------------------------------------

--TASK: persons tablosundan adres filed'ını kaldıralım

ALTER TABLE public.persons
DROP COLUMN adres  -- DROP COLUMN yazarken COLUMN olmasa da olur

----------------------------------------------------------------------

--TASK: persons tablosunda PHONE filed'ının veri tipini varchar(20) olarak düzeltelim

ALTER TABLE persons
ALTER COLUMN phone TYPE varchar(20);

----------------------------------------------------------------------

--TASK: persons tablosunun adını "contacts" olarak değiştirelim

ALTER TABLE persons
RENAME TO contacts;


SELECT * FROM contacts;

----------------------------------------------------------------------

--TASK: contacts tablosundaki phone field adını contact_number olarak değiştirelim

ALTER TABLE contacts
RENAME COLUMN phone TO contact_number; --COLUMN olmasa da olur


SELECT * FROM contacts;

----------------------------------------------------------------------

