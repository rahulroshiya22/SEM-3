USE CSE_3B_409

CREATE TABLE STU_INFO (
	RNO INT,
	SNAME VARCHAR(50),
	BRANCH VARCHAR(50)
)

INSERT INTO STU_INFO(RNO,SNAME,BRANCH)
VALUES
(101,'RAJU','CE'),
(102,'AMIT','CE'),
(103,'SANJAY','ME'),
(104,'NEHA','EC'),
(105,'MEERA','EE'),
(106,'MAHESH','ME')

CREATE TABLE RESULT(
	RNO INT,
	SPI DECIMAL(2,1)
)

INSERT INTO RESULT(RNO,SPI)
VALUES
(101,8.8),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(107,8.9)

CREATE TABLE EMPLOYEE_MASTER(
	EMP_NO VARCHAR(50),
	ENAME VARCHAR(50),
	MANAGER_NO VARCHAR(50)
)

INSERT INTO EMPLOYEE_MASTER(EMP_NO,ENAME,MANAGER_NO)
VALUES
('E01','TARUN',''),
('E02','ROHAN','E02'),
('E03','PRIYA','E01'),
('E04','MILAN','E03'),
('E05','JAY','E01'),
('E06','ANJANA','E04')


-->  Part – A:

--1. Combine information from student and result table using 
--cross join or Cartesian product. 
SELECT *
FROM STU_INFO CROSS JOIN RESULT

	
--2. Perform inner join on Student and Result tables. 
SELECT * 
FROM STU_INFO INNER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--3. Perform the left outer join on Student and Result tables. 
SELECT * 
FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--4. Perform the right outer join on Student and Result tables. 
SELECT * 
FROM STU_INFO RIGHT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--5. Perform the full outer join on Student and Result tables.  
SELECT * 
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO


--6. Display Rno, Name, Branch and SPI of all students. 
SELECT STU_INFO.RNO,STU_INFO.SNAME,STU_INFO.BRANCH,RESULT.SPI
FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--7. Display Rno, Name, Branch and SPI of 
--CE branch’s student only. 
SELECT STU_INFO.RNO,STU_INFO.SNAME,STU_INFO.BRANCH,RESULT.SPI
FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH = 'CE'

--8. Display Rno, Name, Branch and SPI of 
--other than EC branch’s student only. 
SELECT STU_INFO.RNO,STU_INFO.SNAME,STU_INFO.BRANCH,RESULT.SPI
FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH <> 'EC'

--9. Display average result of each branch. 
SELECT STU_INFO.BRANCH,AVG(RESULT.SPI) AS AVERAGE_RESULT
FROM STU_INFO INNER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH

--10. Display average result of CE and ME branch.
SELECT S.BRANCH,AVG(R.SPI) AS AVERAGE_RESULT
FROM STU_INFO AS S
LEFT OUTER JOIN RESULT AS R
ON S.RNO = R.RNO
WHERE S.BRANCH IN('CE','ME') 
GROUP BY S.BRANCH

--> Part – B: 

--1. Display average result of each branch and 
--sort them in ascending order by SPI. 
SELECT STU_INFO.BRANCH,AVG(RESULT.SPI) AS AVERAGE_RESULT
FROM STU_INFO INNER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
ORDER BY AVG(RESULT.SPI)

--2. Display highest SPI from each branch and 
--sort them in descending order. 
SELECT STU_INFO.BRANCH,MAX(RESULT.SPI) AS AVERAGE_RESULT
FROM STU_INFO INNER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
ORDER BY MAX(RESULT.SPI) DESC

--> Part – C: 

--1. Retrieve the names of employee along with 
--their manager’s name from the Employee table. 
SELECT E1.ENAME
FROM EMPLOYEE_MASTER E1
INNER JOIN EMPLOYEE_MASTER AS E2 
ON E1.EMP_NO = E2.MANAGER_NO
