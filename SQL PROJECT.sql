###--------------CREATING DATABASE--------###
CREATE DATABASE PROJECT;
USE PROJECT;
###--------------CREATING TABLE-----------###
CREATE TABLE WORKER(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(50)
);	

###--------INSERTING VALUS INTO TABLE-------------###

INSERT INTO WORKER(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
VALUES(001,"Monika","Arora",100000,"2014-02-20 09:00:00","HR"),
(002,"Niharika","Verma",80000,"2014-06-11 09:00:00","Admin"),
(003,"Vishal","Singhal",300000,"2014-02-20 09:00:00","HR"),
(004,"Amitabh","Singh",500000,"2014-02-20 09:00:00","Admin"),
(005,"Vivek","Bhati",500000,"2014-06-11 09:00:00","Admin"),
(006,"Vipul","Diwan",200000,"2014-06-11 09:00:00","Account"),
(007,"Satish","Kumar",75000,"2014-01-20 09:00:00","Account"),
(008,"Geetika","Chauhan",90000,"2014-04-11 09:00:00","Admin")
;
###------------CREATING BONUS TABLE-------------###

CREATE TABLE BONUS(
WORKER_REF_ID INT,
BONUS_DATE DATETIME,
BONUS_AMOUNT INT,
FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

INSERT INTO BONUS(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
VALUES
(1,"2016-02-20 00:00:00",5000),
(2,"2016-06-11 00:00:00",3000),
(3,"2016-02-20 00:00:00",4000),
(1,"2016-02-20 00:00:00",4500),
(2,"2016-06-11 00:00:00",3500)
;

###-----------CREATING TABLE TITLE--------------###

CREATE TABLE TITLE(
WORKER_REF_ID INT,
WORKER_TITLE VARCHAR(100),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

INSERT INTO TITLE(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
VALUES
(1,"Manager","2016-02-20 00:00:00"),
(2,"Executive","2016-06-11 00:00:00"),
(8,"Executive","2016-06-11 00:00:00"),
(5,"Manager","2016-06-11 00:00:00"),
(4,"Asst.Manager","2016-06-11 00:00:00"),
(7,"Executive","2016-06-11 00:00:00"),
(6,"Lead","2016-06-11 00:00:00"),
(3,"Lead","2016-06-11 00:00:00");

###-------------------------------------------queries-----------------------------------------###

#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM WORKER ;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

SELECT upper(FIRST_NAME) FROM WORKER;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT FROM WORKER;

#Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

#Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
 
 SELECT POSITION("a" IN "Amitabh") FROM WORKER;
 
 #Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
 
 SELECT RTRIM(FIRST_NAME) FROM WORKER;
 
 #Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
  SELECT LTRIM(FIRST_NAME) FROM WORKER;
  
 #Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length
 
 SELECT DISTINCT  LENGTH(DEPARTMENT),DEPARTMENT FROM WORKER;
 
 #Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
 
 SELECT REPLACE(FIRST_NAME,"a","A") FROM WORKER;

#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS COMPLETE_NAME FROM WORKER;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM WORKER ORDER BY FIRST_NAME ;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM WORKER ORDER BY FIRST_NAME ASC,DEPARTMENT DESC;

#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

SELECT * FROM WORKER 
WHERE FIRST_NAME IN ("Vipul","Satish");

#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ("Vipul","Satish");

#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

SELECT * FROM WORKER WHERE DEPARTMENT="Admin";

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME  LIKE "%A%";

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A";

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%H" AND LENGTH(FIRST_NAME)=6;

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2

##Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’

SELECT COUNT(WORKER_ID) FROM WORKER WHERE DEPARTMENT="Admin";

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT FIRST_NAME,SALARY FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT COUNT(1) AS NO_OF_WORKERS,DEPARTMENT FROM WORKER GROUP BY DEPARTMENT ORDER BY DEPARTMENT DESC;

#Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT * 
FROM WORKER 
WHERE WORKER_ID 
IN(SELECT WORKER_REF_ID FROM TITLE WHERE WORKER_TITLE="Manager");

#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table. Q-

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(1)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(1) > 1;

#Q-26. Write an SQL query to show only odd rows from a table.

SELECT * FROM WORKER WHERE WORKER_ID%2!=0;

#Q-27. Write an SQL query to show only even rows from a table.

SELECT * FROM WORKER WHERE WORKER_ID%2=0;

#Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WORKER1 LIKE WORKER;
INSERT INTO WORKER1 SELECT * FROM WORKER;
SELECT * FROM WORKER;

#Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT * 
FROM WORKER 
JOIN
TITLE 
ON 
WORKER.WORKER_ID=TITLE.WORKER_REF_ID;

#Q-30. Write an SQL query to show records from one table that another table does not have.
##----PEOPLE WHO DOES NOT GET BONUS-----###
SELECT * FROM WORKER WHERE WORKER_ID NOT IN(SELECT WORKER_REF_ID FROM BONUS);



#Q-31. Write an SQL query to show the current date and time.

SELECT current_timestamp();

#Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT * FROM WORKER LIMIT 3;

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT DISTINCT SALARY,WORKER_ID,FIRST_NAME FROM WORKER ORDER BY SALARY DESC LIMIT 1,1;

#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT SALARY FROM WORKER W1 WHERE 4 = ( SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY > W1.SALARY);

#Q-35. Write an SQL query to fetch the list of employees with the same salary.

SELECT * FROM WORKER WHERE SALARY IN(SELECT SALARY FROM WORKER GROUP BY SALARY HAVING COUNT(1)>1);

#Q-36. Write an SQL query to show the second highest salary from a table.

SELECT DISTINCT SALARY,FIRST_NAME FROM WORKER ORDER BY SALARY DESC LIMIT 2,1;

#-37. Write an SQL query to show one row twice in results from a table.

SELECT * FROM WORKER
UNION ALL
SELECT * FROM WORKER;

#Q-38. Write an SQL query to fetch intersecting records of two tables.

SELECT * 
FROM WORKER 
JOIN
TITLE 
ON 
WORKER.WORKER_ID=TITLE.WORKER_REF_ID;

#Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM WORKER WHERE WORKER_ID<=(SELECT COUNT(WORKER_ID)/2 FROM WORKER);


#Q-40. Write an SQL query to fetch the departments that have less than five people in it.

SELECT 5>COUNT(1),DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

#Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT COUNT(1),DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

#Q-42. Write an SQL query to show the last record from a table.

SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 1;

#Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM WORKER ORDER BY WORKER_ID LIMIT 1;

#Q-44. Write an SQL query to fetch the last five records from a table.

SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5;

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT * FROM WORKER WHERE SALARY IN (SELECT MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT);

#Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 3;

#Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY LIMIT 3;

#Q-48. Write an SQL query to fetch nth max salaries from a table.


SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY ;


#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

SELECT DEPARTMENT,SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT * FROM WORKER WHERE SALARY IN(SELECT MAX(SALARY) FROM WORKER);