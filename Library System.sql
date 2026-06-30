SHOW DATABASES;

-- Create Database
CREATE DATABASE  Library_Management_System ;

SHOW DATABASES;

USE Library_Management_System ;

-- Create Staff Table --
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

SELECT * FROM Staff;
SHOW COLUMNS FROM Staff;

-- Create Readers Table --
CREATE TABLE Readers (
    readers_id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    membership_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE
);

SELECT * FROM Readers;
SHOW COLUMNS FROM Readers;

-- Create Publisher Table --
CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

SELECT * FROM Publisher;
SHOW COLUMNS FROM Publisher;

-- Create Book Table --
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    author VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    status VARCHAR(30) NOT NULL,
    publisher_id INT NOT NULL,

    FOREIGN KEY (publisher_id)
    REFERENCES Publisher(publisher_id)
);


SELECT * FROM Book;
SHOW COLUMNS FROM Book;


-- Create Report Table --
CREATE TABLE Report (
    report_id INT PRIMARY KEY,
    report_type VARCHAR(100) NOT NULL,
    report_date DATE NOT NULL,
    generated_by INT NOT NULL,
    total_books INT NOT NULL,

    FOREIGN KEY (generated_by)
    REFERENCES Staff(staff_id)
);

SELECT * FROM Report;
SHOW COLUMNS FROM Report;

INSERT INTO Staff VALUES
(1,'Rashan Wickramasinghe','0715551111','rashan.w@gmail.com'),
(2,'Imantha Karunaratne','0726662222','imantha.k@gmail.com'),
(3,'Sajini Fernando','0737773333','sajini.f@gmail.com'),
(4,'Dilan Perera','0748884444','dilan.p@gmail.com'),
(5,'Nethmi Jayasinghe','0759995555','nethmi.j@gmail.com'),
(6,'Heshan Bandara','0761112223','heshan.b@gmail.com'),
(7,'Tharushi Kumari','0772223334','tharushi.k@gmail.com'),
(8,'Kasun Madusanka','0783334445','kasun.m@gmail.com'),
(9,'Dilini Silva','0794445556','dilini.s@gmail.com'),
(10,'Yasindu Rodrigo','0705556667','yasindu.r@gmail.com');


INSERT INTO Readers VALUES
(11,'Malith Abeysekara','Kandy','2025-02-05','malith.a@gmail.com'),
(12,'Chamodi Peris','Colombo','2025-02-12','chamodi.p@gmail.com'),
(13,'Ruwan Jayalath','Galle','2025-03-01','ruwan.j@gmail.com'),
(14,'Nimasha Bandara','Matara','2025-03-18','nimasha.b@gmail.com'),
(15,'Isuru Fernando','Negombo','2025-04-02','isuru.f@gmail.com'),
(16,'Shanika Rathnayake','Kurunegala','2025-04-10','shanika.r@gmail.com'),
(17,'Thilina Herath','Jaffna','2025-04-22','thilina.h@gmail.com'),
(18,'Kavindi Silva','Badulla','2025-05-03','kavindi.s@gmail.com'),
(19,'Dinuka Perera','Anuradhapura','2025-05-15','dinuka.p@gmail.com'),
(20,'Sithmi Nisansala','Ratnapura','2025-05-28','sithmi.n@gmail.com');


INSERT INTO Publisher VALUES
(101,'Pearl Books','Colombo','0111111111','contact@pearlbooks.com'),
(102,'Island Press','Kandy','0812222222','info@islandpress.com'),
(103,'Ceylon Publications','Galle','0913333333','support@ceylonpub.com'),
(104,'Lakmini Books','Matara','0414444444','lakmini@gmail.com'),
(105,'Blue Lotus Publishing','Negombo','0315555555','bluelotus@gmail.com'),
(106,'Sunrise Books','Kurunegala','0376666666','sunrise@gmail.com'),
(107,'Heritage Press','Jaffna','0217777777','heritage@gmail.com'),
(108,'Golden Pages','Batticaloa','0658888888','goldenpages@gmail.com'),
(109,'Evergreen Publications','Anuradhapura','0259999999','evergreen@gmail.com'),
(110,'Nova Books','Ratnapura','0450000000','nova@gmail.com');


INSERT INTO Book VALUES
(111,'Arthur Silva','Adventure','Available',101),
(112,'Kamal Rodrigo','Mystery','Borrowed',102),
(113,'Samantha Perera','Fiction','Available',103),
(114,'Nuwan Dias','Detective','Borrowed',104),
(115,'Anushka Fernando','Horror','Available',105),
(116,'Pradeep Jayasinghe','Sci-Fi','Available',106),
(117,'Lakshmi Kumari','Romance','Borrowed',107),
(118,'Chathura Bandara','Classic','Available',108),
(119,'Roshan Silva','Crime','Borrowed',109),
(120,'Vimukthi Perera','Fantasy','Available',110);


INSERT INTO Report VALUES
(201,'Daily Report','2026-01-05',1,120),
(202,'Weekly Report','2026-01-10',2,135),
(203,'Monthly Report','2026-01-31',3,150),
(204,'Daily Report','2026-02-01',4,160),
(205,'Weekly Report','2026-02-07',5,170),
(206,'Monthly Report','2026-02-28',6,180),
(207,'Daily Report','2026-03-01',7,190),
(208,'Weekly Report','2026-03-07',8,200),
(209,'Monthly Report','2026-03-31',9,210),
(210,'Yearly Report','2026-12-31',10,500);

SELECT * FROM Book;

SELECT name, city
FROM Readers;

-- WHERE-- 
SELECT *
FROM Readers
WHERE city = 'Colombo';

-- ORDERBY-- 
SELECT *
FROM Publisher
ORDER BY publisher_name ASC;

-- LIKE-- 
SELECT *
FROM Book
WHERE category LIKE 'Fantasy';

-- INNER JOIN-- 
SELECT Book.author, Publisher.publisher_name
FROM Book
INNER JOIN Publisher
ON Book.publisher_id = Publisher.publisher_id;

-- LEFT JOIN-- 
SELECT Readers.name, Report.report_type
FROM Readers
LEFT JOIN Report
ON Readers.reader_id = Report.generated_by;

-- RIGHT JOIN--  
SELECT Staff.name, Report.report_type
FROM Staff
RIGHT JOIN Report
ON Staff.staff_id = Report.generated_by;

-- GROUP BY-- 
SELECT category, COUNT(*) AS total_books
FROM Book
GROUP BY category;

-- SELECT COUNT() -- 
SELECT COUNT(*) FROM Book;

SELECT status, COUNT(*) AS total_books
FROM Book
GROUP BY status;

SELECT Staff.name, COUNT(Report.report_id) AS total_reports
FROM Staff
JOIN Report ON Staff.staff_id = Report.generated_by
GROUP BY Staff.name;


SELECT COUNT(*) AS total_members
FROM Readers;

SELECT category, COUNT(*) AS borrowed_count
FROM Book
WHERE status = 'Borrowed'
GROUP BY category
ORDER BY borrowed_count DESC;