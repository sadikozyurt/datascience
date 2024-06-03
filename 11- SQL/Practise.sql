--1-Bir kütüphanedeki kitapların bilgilerini depolamak için bir tablo oluşturun. 
--Tablo aşağıdaki sütunlara sahip olmalıdır:

--book_id (Integer)
--title (Varchar(80))
--author (Varchar(50))
--published_date (Date)
--genre (Varchar(20))

CREATE TABLE books(
book_id INTEGER,
title VARCHAR(80),
author VARCHAR(50),
published_date DATE,
genre VARCHAR(20)
);

-----------------------------------------------------------------------------------
--2-"books" tablosuna aşağıdaki kitap bilgilerini ekleyin:
-- İd:100
-- Başlık: "Savaş ve Barış"
-- Yazar: "Lev Tolstoy"
-- Yayınlanma Tarihi: "1869-01-01"
-- Tür: "Roman"

INSERT INTO books VALUES(100,'Savaş ve Barış','Lev Tolstoy','1869-01-01','Roman');

-----------------------------------------------------------------------------------
--3-"books" tablosuna aşağıdaki kitapların bilgilerini ekleyin:

/* Kitap 1:
İd:101
Başlık: "1984"
Yazar: "George Orwell"
Yayınlanma Tarihi: "1949-06-08"
Tür: "Distopya"

Kitap 2:
İd:102
Başlık: "Bülbülü Öldürmek"
Yazar: "Harper Lee"
Yayınlanma Tarihi: "1960-07-11"
Tür: "Roman"

Kitap 3:
İd:103
Başlık: "Yabancı"
Yazar: "Albert Camus"
Yayınlanma Tarihi: "1942-01-01"
Tür: "Roman" */

--1. YOL

--INSERT INTO books VALUES (101,‘1984’,‘George Orwell’,‘1949-06-08’,‘Distopya’);
--INSERT INTO books VALUES (102,‘Bülbülü Öldürmek’,‘Harper Lee’,‘1960-07-11’,‘Roman’);
--INSERT INTO books VALUES (103,‘Yabancı’,’Albert Camus’,‘1942-01-01’,‘Roman’)

--2. YOL

INSERT INTO books VALUES(101,'1984', 'George Orwell', '1949-06-08', 'Distopya'),
						(102,'Bülbülü Öldürmek', 'Harper Lee', '1960-07-11', 'Roman'),
                        (103,'Yabancı', 'Albert Camus', '1942-01-01', 'Roman');


-----------------------------------------------------------------------------------
/*
4-"books" tablosuna yalnızca 
başlık "Suç ve Ceza" ve yazar "Fyodor Dostoyevski"  
başlık "Martin Eden" , yazar "Jack London" , tür "Roman" 
alanlarını
 içeren yeni kitap bilgileri ekleyin.
 Diğer alanlar için varsayılan değerler kullanılmalıdır.
 */
                       
INSERT INTO books(title,author) VALUES('Suç ve Ceza','Fyodor Dostoyevski');
INSERT INTO books(title,author,genre) VALUES('Martin Eden','Jack London','Roman');

-----------------------------------------------------------------------------------

SELECT * FROM books

-----------------------------------------------------------------------------------

/* 5- Öğrenci bilgileri için bir tablo (students) oluşturun. 
5th
student_id (Primary Key, Integer, otomatik artan)
first_name (Metin 50 karakter, NULL olamaz)
last_name (Metin 30 karakter, NULL olamaz)
date_of_birth (Tarih, NULL olamaz)
email (Metin 50 karakter, NULL olamaz, Benzersiz)
phone_number (Metin 15 karakter)
gender (Metin 8 karakter, 'male' veya 'female' olmalı)*/

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,--UNIQUE,NOT NULL,bu tablo başka tablo ile ilişkilendirilebir 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(30) NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
phone_number VARCHAR(15),
gender VARCHAR(8) CHECK(gender IN ('male','female'))
);

-----------------------------------------------------------------------------------

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('John', 'Doe', '1998-05-15', 'john@example.com', '555-1234', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Jane', 'Smith', '2000-08-22', 'jane@example.com', '555-5678', 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Michael', 'Brown', '1999-03-30', 'michael@example.com', '555-9876', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Emily', 'Johnson', NULL, 'emily@example.com', '555-2222', 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('David', 'Lee', '2001-10-18', 'david@example.com', '555-4444', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('Maria', 'Garcia', '1997-12-25', NULL, '555-7777', 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Christopher', 'Martinez', '2002-06-05', 'chris@example.com', '555-6666', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('Sarah', 'Wilson', '1998-08-14', 'sarah@example.com', NULL, 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('James', 'Taylor', '2000-04-03', 'james@example.com', '555-3333', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Jennifer', 'Adams', '1999-09-20', ' ', '555-8888', 'female'); -- boşluk da bir karakter olduğu için email field'ı NULL değildir.

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Daniel', 'Hernandez', '2001-07-10', 'daniel@example.com', '555-1111', 'male');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('Amanda', 'Thomas', '2000-01-28', 'amanda@example.com', '555-9999', 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender) VALUES
('Robert', 'White', '2003-02-14', 'robert@example.com', '555-5555', NULL);

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Megan', 'Scott', '1998-11-05', 'megan@example.com', '555-7777', 'female');

INSERT INTO students(first_name,last_name,date_of_birth,email,phone_number,gender)
VALUES ('Kevin', 'Garcia', '1999-05-30', 'kevin@example.com', '555-2222', 'erkek');

-----------------------------------------------------------------------------------

INSERT INTO students 
VALUES(1,'Kevin', 'Garcia', '1999-05-30', 'kevin@example.com', '555-2222', 'male')

-- primary key constrait'i olduğu için student_id'si için 1 değerini kabul etmez.
-- serial unique olmayı sağlamaz, serial olsaydı 1 değeri olabilirdi.
-- yani PK olduğu için id:1 olarak kabul etmez, SERIAL UNIQUE olmayı garanti etmez
-----------------------------------------------------------------------------------
-- 6-a-Öğrenciler tablosunda tüm dataları görüntüleyin

SELECT * FROM students;

-----------------------------------------------------------------------------------
-- 6-b-Öğrenciler tablosunda sadece isimleri görüntüleyin

SELECT first_name FROM students;

-----------------------------------------------------------------------------------
-- 6-c-Öğrenciler tablosunda isim,soyisim ve doğum tarihlerini görüntüleyin

SELECT first_name,last_name,date_of_birth FROM students;

-----------------------------------------------------------------------------------

/* 7-Bir öğrencinin adres bilgilerini depolayan bir tablo(student_address) oluşturun. 
Bu tablo, her öğrenci için yalnızca bir tane adres bilgisine sahip olacak. 
Tablonun aşağıdaki sütunlara sahip olması gerekiyor:

address_id (Primary Key, Integer, otomatik artan)
student_id (Öğrenci tablosuna referans, NULL olamaz)
city (Varchar(50))
country (Varchar(15))*/

CREATE TABLE student_address(
address_id SERIAL PRIMARY KEY,--NOT NULL,UNIQUE,kimlik bilgisi / -- SERIAL DATA tipi değildir, INTEGER değerdir ve sadece 1'den itibaren otomatik üretilmesi gerektiğini belirtir.
student_id INTEGER NOT NULL UNIQUE,
city VARCHAR(50),
country VARCHAR(15),
FOREIGN KEY(student_id) REFERENCES students(student_id)
); 

-----------------------------------------------------------------------------------

-- 8-"student_address" tablosuna öğrenci adres bilgilerini ekleyin

SELECT * FROM student_address;
SELECT * FROM students;

INSERT INTO student_address (student_id, city, country) 
VALUES (11, 'New York', 'USA'); -- students tablosundaki student _id'si 11 olan öğrencinin adres bilgisi


INSERT INTO student_address (student_id, city, country) 
VALUES (12, 'Paris', 'FR');

INSERT INTO student_address (student_id, city, country) 
VALUES (17, 'London', 'UK'); -- students tablosundaki student _id'si 17 olan öğrenci yok, hata verir

INSERT INTO student_address (student_id, city, country) 
VALUES (14, 'Amsterdam', 'NL');

INSERT INTO student_address (student_id, city, country) 
VALUES (24, 'New York', 'USA'); -- students tablosundaki student _id'si 24 olan öğrenci yok, hata verir

-----------------------------------------------------------------------------------
-- students --PK (Parent)
-- student_address--FK(references PK) (Child)

-----------------------------------------------------------------------------------

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER DEFAULT 0, -- age INTEGER DEFAULT 0; --DEFAULT olarak NULL değil, 0 vermek için
    email VARCHAR(100)
);

INSERT INTO teachers (name, age, email) VALUES
('John Doe', 25, 'john.doe@example.com'),
('Jane Smith', 30, 'jane.smith@example.com'),
('Michael Brown', 28, 'michael.brown@example.com'),
('Emily Johnson', 22, 'emily.johnson@example.com'),
('David Lee', 35, 'david.lee@example.com'),
('Maria Garcia', 27, 'maria.garcia@example.com'),
('Christopher Martinez', 29, 'christopher.martinez@example.com'),
('Sarah White', 26, 'white@example.com'),
('James Taylor', 31, 'james.taylor@example.com'),
('Jennifer Adams', 33, 'jennifer.adams@example.com'),
('Daniel Hernandez', 28, 'daniel.hernandez@example.com'),
('Amanda Thomas', 24, 'amanda.thomas@example.com'),
('Robert White', 32, 'white@example.com'),
('Megan Scott', 29, 'scott@example.com'),
('Kevin Scott', 27, 'scott@example.com');

-----------------------------------------------------------------------------------

SELECT * from teachers;

INSERT INTO teachers(name,email) VALUES('Jack','jack@mail.com') -- age verilmediği için DEFAULT 0 olacak

-----------------------------------------------------------------------------------

--9-a-teachers tablosundaki kayıtları isimlere göre alfabetik sıralayın

SELECT * FROM teachers 
ORDER BY name; -- normal sıralama INSERT ettiğimiz sıradır, DEFAULT ASC sıralama yapar, azalan sıralama için DESC

-----------------------------------------------------------------------------------

-- 9-b-teachers tablosundaki kayıtları yaşa göre azalan sıralayın

SELECT * FROM teachers 
ORDER BY age DESC ;

-----------------------------------------------------------------------------------

/*9-c-teachers tablosundaki kayıtları 
önce emaile göre artan sonra yaşa göre azalan sıralayın*/


SELECT * FROM teachers 
ORDER BY email ASC,age DESC ;

-----------------------------------------------------------------------------------

/* 9-d-teachers tablosundaki kayıtları 
önce ismin uzunluğuna göre azalan sıralayın */

SELECT * FROM teachers
ORDER BY length(name) DESC ;

-----------------------------------------------------------------------------------