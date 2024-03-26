-- Creating a database with the best books read from 2018 to present day and the books I want to read
-- Still in work


CREATE TABLE bestbooks(
	id INT,
	title VARCHAR(100),
	author VARCHAR(100),
	pub_date VARCHAR(100),
	read_date VARCHAR(100),
	country VARCHAR(100)
); 

CREATE TABLE nonfictionbooks(
		id INT,
		title VARCHAR(100),
		author VARCHAR(100),
		pub_date VARCHAR(100),
		read_date VARCHAR(100)
); 


-- Drop the table if it exists

IF EXISTS (SELECT * 
			FROM bestbooks)
DROP TABLE bestbooks

--Creating table Book To Read

CREATE TABLE bookstoread(
	id INT,
	title VARCHAR(100),
	author VARCHAR(100),
	pub_date VARCHAR(100),
	country VARCHAR(100)
);

CREATE TABLE nonfictionmustread(
	id INT,
	title VARCHAR(100),
	author VARCHAR(100),
	pub_date VARCHAR(100)
);

SELECT *
FROM bestbooks


-- Inserting the data into the table

INSERT INTO Books.dbo.bestbooks(id, title, author, pub_date, read_date, country)
	VALUES (
		01, 'Animal Farm', 'George Orwell', '17/08/1945', '06/08/2019', 'United Kingdom'),
		(02, 'All the Light We Cannot See', 'Anthony Doerr', '06/05/2014', '02/06/2023', 'France'),
		(03, 'The Nightingale', 'Kristin Hannah', '08/10/2015', '16/03/2023', 'France'),
		(04, 'Homegoing', 'Yaa Gyasi', '07/06/2016', '24/07/2021', 'Ghana'),
		(05, 'Pachinko', 'Min Jin Lee', '07/07/2017', '28/12/2019', 'South Korea'),
		(06, 'The Travelling Cat Chronicles', 'Hiro Arikawa', '01/11/2012', '17/10/2019', 'Japan'),
		(07, 'A Woman Is No Man', 'Etaf Rum', '05/03/2019', '13/03/2021', 'United States'),
		(08, 'Almond', 'Sohn Won-Pyung', '31/03/2017', '26/03/2021', 'South Korea'),
		(09, 'Yellow Wife', 'Sadeqa Johnson', '12/01/2021', '20/01/2024', 'United States'),
		(10, 'The Rose Code', 'Kate Quinn', '09/03/2021', '07/02/2024', 'United Kingdom')
	
INSERT INTO Books.dbo.nonfictionbooks(id, title, author, pub_date, read_date)
	VALUES (
		01, 'Quiet', 'Susan Cain', '24/01/2012', '20/06/2020'),
		(02, 'When Breath Becomes Air', 'Paul Kalanithi', '12/01/2016', '22/10/2018'),
		(03, 'I Contain Multitudes', 'Ed Yong', '09/08/2016', '19/12/2019'),
		(04, 'The Radium Girls', 'Kate Moore', '02/05/2017', '15/11/2020'),
		(05, 'The Butchering Art', 'Lindsey Fitzharris', '31/10/2017', '10/08/2019'),
		(06, 'Endure', 'Alex Hutchinson', '06/02/2018', '06/09/2019'),
		(07, 'Bad Blood', 'John Carreyrou', '02/05/2018', '16/11/2019'),
		(08, 'Midnight in Chernobyl', 'Adam Higginbotham', '12/02/2019', '02/01/2020'),
		(09, 'Talking to Strangers', 'Malcolm Gladwell', '10/09/2019', '28/02/2020'),
		(10, 'I am Nujood, Age 10 and Divorced', 'Nujood Ali, Delphine Minoui', '01/10/2009', '25/11/2018')

SELECT *
FROM nonfictionbooks

INSERT INTO Books.dbo.bookstoread(id, title, author, pub_date, country)
	VALUES (
		01, 'Sonju', 'Wondra Chang', '16/06/2021', 'South Korea'),
		(02, '8 Lives of a Century-Old Trickster', 'Mirinae Lee', '04/05/2023', 'South Korea'),
		(03, 'Baby X', 'Kira Peikoff', '05/03/2024', 'United States'),
		(04, 'Three Apples Fell From the Sky', 'Narine Abgaryan', '16/03/2015', 'Armenia'),
		(05, 'The Island of Missing Trees', 'Elif Shafak', '02/11/2021', 'Cyprus')

SELECT *
FROM bookstoread

--Deleting rows from a table 

DELETE FROM Books.dbo.bestbooks
WHERE title = 'Sonju'

--Deleting multiple rows from a table

DELETE FROM Books.dbo.bestbooks
WHERE title IN ('8 Lives of a Century-Old Trickster', 'Baby X', 'Three Apples Fell From the Sky', 'The Island of Missing Trees')

INSERT INTO Books.dbo.nonfictionmustread(id, title, author, pub_date)
	VALUES (
		01, 'Know My Name', 'Chanel Miller', '24/09/2019'),
		(02, 'American Prometheus', 'Kai Bird', '05/04/2005'),
		(03, 'Into the Wild', 'Jon Krakauer', '13/01/1996'),
		(04, 'Pathogenesis', 'Jonathan Kennedy', '18/04/2023'),
		(05, 'Africa Is Not a Country', 'Dipo Faloyin', '07/04/2022')

SELECT *
FROM nonfictionmustread

-- TO BE CONTINUED
