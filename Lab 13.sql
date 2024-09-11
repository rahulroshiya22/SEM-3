USE CSE_3B_409

CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

--PART : A

--1. Display all the villages of Rajkot city.  
SELECT City.Name, Village.Name
FROM City
JOIN Village
ON City.CityID = Village.CityID
WHERE City.Name = 'Rajkot'

--2. Display city along with their villages & pin code. 
SELECT City.Name, City.Pincode ,Village.Name
FROM City
JOIN Village
ON City.CityID = Village.CityID

--3. Display the city having more than one village. 
SELECT City.Name
FROM City
JOIN Village
ON City.CityID = Village.CityID
GROUP BY City.Name
HAVING COUNT(Village.CityID) > 1

--4. Display the city having no village. 
SELECT City.Name
FROM City
FULL OUTER JOIN Village
ON City.CityID = Village.CityID
GROUP BY City.Name
HAVING COUNT(Village.CityID) = 0

--5. Count the total number of villages in each city. 
SELECT City.Name, COUNT(Village.VID)
FROM City
JOIN Village
ON City.CityID = Village.CityID
GROUP BY City.Name

--6. Count the number of cities having more than one village.
SELECT City.Name, COUNT(City.CityID)
FROM City
JOIN Village
ON City.CityID = Village.CityID
GROUP BY City.Name
HAVING COUNT(Village.CityID) > 1

--4. Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER
SET SPI = 12
WHERE NAME = 'RAJU'

--5. Try to update Bklog of Neha from 0 to -1. 
UPDATE STU_MASTER
SET BKLOG = -1
WHERE NAME = 'NEHA'




