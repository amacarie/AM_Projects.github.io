-- Creating a database with the best books read from 2018 to present day
-- Still in work


CREATE TABLE bestbooks(
	id INT PRIMARY KEY not null,
	title VARCHAR(100),
	author VARCHAR(100),
	pub_date VARCHAR(100),
	read_date VARCHAR(100),
	country VARCHAR(100)
); 

-- Drop the table if it exists

IF IT EXISTS (SELECT * 
			FROM bestbooks)
DROP TABLE bestbooks

CREATE TABLE bookstoread(
	id INT PRIMARY KEY not null,
	title VARCHAR(100),
	author VARCHAR(100),
	pub_date VARCHAR(100),
	country VARCHAR(100)
);

SELECT *
FROM bestbooks


-- Inserting the data into the table

INSERT INTO bestbooks(id, title, author, country)
	VALUES(
	01, 'Animal Farm', 'George Orwell', 'United Kingdom'),
	(02, 'All the Light We Cannot See', 'Anthony Doerr', 'France'),
	(03, 'The Nightingale', 'Kristin Hannah', 'France'),
	(04, 'Homegoing', 'Yaa Gyasi', 'Ghana'),
	(05, 'Pachinko', 'Min Jin Lee', 'South Korea'),
	(06, 'The Travelling Cat Chronicles', 'Hiro Arikawa', 'Japan'),
	(07, 'A Woman Is No Man', 'Etaf Rum',  'United States'),
	(08, 'Almond', 'Sohn Won-Pyung', 'South Korea'),
	(09, 'Yellow Wife', 'Sadeqa Johnson', 'United States'),
	(10, 'The Rose Code', 'Kate Quinn','United Kingdom')

-- TO BE CONTINUED



	
	--(07, 'A Woman Is No Man', 'Etaf Rum', '05/03/2019', '13/03/2021', 'United States'),
	--(08, 'Almond', 'Sohn Won-Pyung', '31/03/2017', '26/03/2021', 'South Korea'),
	--(09, 'Yellow Wife', 'Sadeqa Johnson', '12/01/2021', '20/01/2024', 'United States'),
	--(10, 'The Rose Code', 'Kate Quinn', '09/03/2021', '07/02/2024', 'United Kingdom')
