-- Creation of Tables.
CREATE TABLE Wine(
Wine_id INT PRIMARY KEY,
Category VARCHAR(50),
Year INT,
Degree DECIMAL(3,1)
);

CREATE TABLE Producers(
Producer_id INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Region VARCHAR(50)
);

-- Insertion of values into the tables.
INSERT INTO wine(wine_id, category, year, degree)
VALUES
(1, 'Red', 2019, 13.5),
(2, 'White', 2020, 12.0),
(3, 'Rose', 2018, 11.5),
(4, 'Red', 2021, 14.0),
(5, 'Sparkling', 2017, 10.5),
(6, 'White', 2019, 12.5),
(7, 'Red', 2022, 13.0),
(8, 'Rose', 2020, 11.0),
(9, 'Red', 2018, 12.0),
(10, 'Sparkling', 2019, 10.0),
(11, 'White', 2021, 11.5),
(12, 'Red', 2022, 15.0);

INSERT INTO producers(producer_id, first_name, last_name, region)
VALUES
(1, 'John', 'Smith', 'Sousse'),
(2, 'Emma', 'Johnson', 'Tunis'),
(3, 'Michael', 'Williams', 'Sfax'),
(4, 'Emily', 'Brown', 'Sousse'),
(5, 'James', 'Jones', 'Sousse'),
(6, 'Sarah', 'Davis', 'Tunis'),
(7, 'David', 'Miller', 'Sfax'),
(8, 'Olivia', 'Wilson', 'Monastir'),
(9, 'Daniel', 'Moore', 'Sousse'),
(10, 'Sophia', 'Taylor', 'Tunis'),
(11, 'Matthew', 'Anderson', 'Sfax'),
(12, 'Amelia', 'Thomas', 'Sousse');


-- 1. Retrieve a list of all producers.
SELECT * FROM Producers

-- 2. Retrieve a sorted list of producers by name.
SELECT first_name, last_name
FROM producers
ORDER BY producer_id DESC;

-- 3. Retrieve a list of producers from Sousse.
SELECT first_name, last_name
FROM producers
WHERE region = 'Sousse'
ORDER BY producer_id ASC;
-- The order by sythax was a little extra i added to make the list more coherent.

-- 4. Calculate the total quantity of wine produced with the wine number 12.
SELECT
  SUM(wine_id) AS total_quantity
  FROM wine
  WHERE wine_id = 12;

-- 5. Calculate the quantity of wine produced for each category.
-- None of the two tables contain values for quantity, so the question can't be answered.


-- 6. Find producers in the Sousse region who have harvested at least one wine in quantities greater than 300 liters. Display their names and first names, sorted alphabetically.
-- None of the tables given have values for quantity produced so the question can't be answered.

-- 7. List the wine numbers with a degree greater than 12, produced by producer number 24.
SELECT * FROM wine w
INNER JOIN producer p ON w.producer_id = p.producer_id
WHERE degree > 12 AND producer_id = 24;
-- NB: The sythax won't run, because both tables aren't linked via foreign key.


-- 8. Find the producer who has produced the highest quantity of wine.
-- Question can't be answered. 

-- 9. Find the average degree of wine produced.
SELECT
AVG (degree) AS Average_degree
FROM wine

-- 10. Find the oldest wine in the database.
SELECT
MIN (year) AS Oldest_wine
FROM wine

-- 11. Retrieve a list of producers along with the total quantity of wine they have produced.
-- Question can't be answered.

-- 12. Retrieve a list of wines along with their producer details
SELECT * FROM wine w 
INNER JOIN producers p ON w.producer_id = p.producer_id
-- Sythax won't run because the tables aren't linked via a foreign key.
