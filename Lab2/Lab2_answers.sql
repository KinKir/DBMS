
use 16co140;

CREATE TABLE Customers(cid INT(4), cname VARCHAR(10), address VARCHAR(10), city VARCHAR(10), postalcode INT(6), gender VARCHAR(6), country VARCHAR(10), age INT(4));

ALTER TABLE Customers ADD PRIMARY KEY(cid);

ALTER TABLE Customers ADD CONSTRAINT Check_gender CHECK (gender='Male' OR gender='Female');

ALTER TABLE Customers MODIFY postalcode INT NOT NULL;

ALTER TABLE Customers ADD CONSTRAINT Check_age CHECK (age>=18);

INSERT INTO Customers VALUES(101, 'sharanya', 'house', 'mumbai', 400705, 'Female', 'India', 21);
INSERT INTO Customers VALUES(102, 'sharon', 'hut', 'jersey', 670070, 'Female', 'USA', 20);
INSERT INTO Customers VALUES(103, 'chang', 'hole', 'tokyo', 100070, 'Male', 'Japan', 22);
INSERT INTO Customers VALUES(104, 'fang', 'jail', 'mount', 890701, 'Male', 'Fiji', 19);
INSERT INTO Customers VALUES(105, 'xeno', 'tree', 'doha', 324567, 'Female', 'Qatar', 21);
INSERT INTO Customers VALUES(106, 'mehnaz', 'zoo', 'bangalore', 200300, 'Female', 'India', 20);
INSERT INTO Customers VALUES(107, 'pikachu', 'pokeball', 'hyderabad', 390001, 'Male', 'India', 15);
INSERT INTO Customers VALUES(108, 'jon', 'snow', 'mangalore', 575025, 'Male', 'India', 28);
INSERT INTO Customers VALUES(109, 'goku', 'hill', 'mangalore', 575025, 'Male', 'India', 28);
INSERT INTO Customers VALUES(110, 'kamath', 'tower', 'mangalore', 575025, 'Male', 'India', 25);

+-----+----------+----------+-----------+------------+--------+---------+------+
| cid | cname    | address  | city      | postalcode | gender | country | age  |
+-----+----------+----------+-----------+------------+--------+---------+------+
| 101 | sharanya | house    | mumbai    |     400705 | Female | India   |   21 |
| 102 | sharon   | hut      | jersey    |     670070 | Female | USA     |   20 |
| 103 | chang    | hole     | tokyo     |     100070 | Male   | Japan   |   22 |
| 104 | fang     | jail     | mount     |     890701 | Male   | Fiji    |   19 |
| 105 | xeno     | tree     | doha      |     324567 | Female | Qatar   |   21 |
| 106 | mehnaz   | zoo      | bangalore |     200300 | Female | India   |   20 |
| 107 | pikachu  | pokeball | hyderabad |     390001 | Male   | India   |   15 |
| 108 | jon      | snow     | mangalore |     575025 | Male   | India   |   28 |
| 109 | goku     | hill     | mangalore |     575025 | Male   | India   |   28 |
| 110 | kamath   | tower    | mangalore |     575025 | Male   | India   |   25 |
+-----+----------+----------+-----------+------------+--------+---------+------+

SELECT * FROM Customers WHERE address IS NULL;

Empty set (0.00 sec)

SELECT * FROM Customers WHERE (city='bangalore' OR city='hyderabad') AND country='India';

+-----+---------+----------+-----------+------------+--------+---------+------+
| cid | cname   | address  | city      | postalcode | gender | country | age  |
+-----+---------+----------+-----------+------------+--------+---------+------+
| 106 | mehnaz  | zoo      | bangalore |     200300 | Female | India   |   20 |
| 107 | pikachu | pokeball | hyderabad |     390001 | Male   | India   |   15 |
+-----+---------+----------+-----------+------------+--------+---------+------+

SELECT COUNT(gender) FROM Customers WHERE gender='Female';

+---------------+
| COUNT(gender) |
+---------------+
|             4 |
+---------------+

SELECT * FROM Customers WHERE city='mangalore' LIMIT 3;

+-----+--------+---------+-----------+------------+--------+---------+------+
| cid | cname  | address | city      | postalcode | gender | country | age  |
+-----+--------+---------+-----------+------------+--------+---------+------+
| 108 | jon    | snow    | mangalore |     575025 | Male   | India   |   28 |
| 109 | goku   | hill    | mangalore |     575025 | Male   | India   |   28 |
| 110 | kamath | tower   | mangalore |     575025 | Male   | India   |   25 |
+-----+--------+---------+-----------+------------+--------+---------+------+

SELECT * FROM Customers ORDER BY age DESC;

+-----+----------+----------+-----------+------------+--------+---------+------+
| cid | cname    | address  | city      | postalcode | gender | country | age  |
+-----+----------+----------+-----------+------------+--------+---------+------+
| 109 | goku     | hill     | mangalore |     575025 | Male   | India   |   28 |
| 108 | jon      | snow     | mangalore |     575025 | Male   | India   |   28 |
| 110 | kamath   | tower    | mangalore |     575025 | Male   | India   |   25 |
| 103 | chang    | hole     | tokyo     |     100070 | Male   | Japan   |   22 |
| 101 | sharanya | house    | mumbai    |     400705 | Female | India   |   21 |
| 105 | xeno     | tree     | doha      |     324567 | Female | Qatar   |   21 |
| 102 | sharon   | hut      | jersey    |     670070 | Female | USA     |   20 |
| 106 | mehnaz   | zoo      | bangalore |     200300 | Female | India   |   20 |
| 104 | fang     | jail     | mount     |     890701 | Male   | Fiji    |   19 |
| 107 | pikachu  | pokeball | hyderabad |     390001 | Male   | India   |   15 |
+-----+----------+----------+-----------+------------+--------+---------+------+

SELECT COUNT(cname) FROM Customers WHERE cname LIKE '%a' OR cname LIKE '%h';

+--------------+
| COUNT(cname) |
+--------------+
|            2 |
+--------------+

SELECT * FROM Customers WHERE postalcode LIKE '5_____' AND (cname LIKE 's%' OR cname LIKE 't%' OR cname LIKE 'p%');

Empty set (0.00 sec)

SELECT * FROM Customers WHERE city='bangalore' OR city='pune' OR city='chennai';
+-----+--------+---------+-----------+------------+--------+---------+------+
| cid | cname  | address | city      | postalcode | gender | country | age  |
+-----+--------+---------+-----------+------------+--------+---------+------+
| 106 | mehnaz | zoo     | bangalore |     200300 | Female | India   |   20 |
+-----+--------+---------+-----------+------------+--------+---------+------+

_______________________________________________________________________________________________________________________________________________

CREATE TABLE Emp(eno INT(4), ename VARCHAR(10), phone_no INT(10), desg VARCHAR(10), salary INT(10), age INT(3), country VARCHAR(10));

INSERT INTO Emp VALUES(110, 'aakash', 9876890782, 'manager', 20000, 28, 'India');
INSERT INTO Emp VALUES(111, 'aditi', 9980706050, 'maid', 100, 21, 'India');
INSERT INTO Emp VALUES(112, 'marty', 1000901050, 'person', 5000000, 35, 'India');
INSERT INTO Emp VALUES(113, 'lokesh', 9090909050, 'datasci', 50400, 30, 'India');
INSERT INTO Emp VALUES(114, 'john', 1000000000, 'chair', 4, 50, 'Thai');
INSERT INTO Emp VALUES(115, 'jane', 1000000004, 'recep', 2500000, 92, 'Goa');
INSERT INTO Emp VALUES(116, 'masi', 1000034564, 'worker', 200000, 14, 'Pak');
INSERT INTO Emp VALUES(117, 'asin', 1234034564, 'person', 2000, 18, 'Srilanka');
INSERT INTO Emp VALUES(118, 'aje', 1233334564, 'submanager', 20900, 38, 'India');

+------+--------+------------+------------+---------+------+----------+
| eno  | ename  | phone_no   | desg       | salary  | age  | country  |
+------+--------+------------+------------+---------+------+----------+
|  110 | aakash | 2147483647 | manager    |   20000 |   28 | India    |
|  111 | aditi  | 2147483647 | maid       |     100 |   21 | India    |
|  112 | marty  | 1000901050 | person     | 5000000 |   35 | India    |
|  113 | lokesh | 2147483647 | datasci    |   50400 |   30 | India    |
|  114 | john   | 1000000000 | chair      |       4 |   50 | Thai     |
|  115 | jane   | 1000000004 | recep      | 2500000 |   92 | Goa      |
|  116 | masi   | 1000034564 | worker     |  200000 |   14 | Pak      |
|  117 | asin   | 1234034564 | person     |    2000 |   18 | Srilanka |
|  118 | aje    | 1233334564 | submanager |   20900 |   38 | India    |
+------+--------+------------+------------+---------+------+----------+

CREATE TABLE EmpBackup LIKE Emp;
INSERT EmpBackup SELECT * FROM Emp;

 SELECT * FROM Emp WHERE salary<100000;

+------+--------+------------+------------+--------+------+----------+
| eno  | ename  | phone_no   | desg       | salary | age  | country  |
+------+--------+------------+------------+--------+------+----------+
|  110 | aakash | 2147483647 | manager    |  20000 |   28 | India    |
|  111 | aditi  | 2147483647 | maid       |    100 |   21 | India    |
|  113 | lokesh | 2147483647 | datasci    |  50400 |   30 | India    |
|  114 | john   | 1000000000 | chair      |      4 |   50 | Thai     |
|  117 | asin   | 1234034564 | person     |   2000 |   18 | Srilanka |
|  118 | aje    | 1233334564 | submanager |  20900 |   38 | India    |
+------+--------+------------+------------+--------+------+----------+

SELECT eno AS eid, ename as emp_name FROM Emp;

+------+----------+
| eid  | emp_name |
+------+----------+
|  110 | aakash   |
|  111 | aditi    |
|  112 | marty    |
|  113 | lokesh   |
|  114 | john     |
|  115 | jane     |
|  116 | masi     |
|  117 | asin     |
|  118 | aje      |
+------+----------+

SELECT * FROM Emp WHERE (salary>=20000 AND salary <=50000 AND eno!=111 AND eno!=112);

+------+--------+------------+------------+--------+------+---------+
| eno  | ename  | phone_no   | desg       | salary | age  | country |
+------+--------+------------+------------+--------+------+---------+
|  110 | aakash | 2147483647 | manager    |  20000 |   28 | India   |
|  118 | aje    | 1233334564 | submanager |  20900 |   38 | India   |
+------+--------+------------+------------+--------+------+---------+

SELECT desg FROM Emp WHERE ename LIKE 'a___%';

+---------+
| desg    |
+---------+
| manager |
| maid    |
| person  |
+---------+

SELECT COUNT(DISTINCT country) FROM Emp;

+-------------------------+
| COUNT(DISTINCT country) |
+-------------------------+
|                       5 |
+-------------------------+

SELECT * FROM Emp ORDER BY salary ASC LIMIT 1;

+------+-------+------------+-------+--------+------+---------+
| eno  | ename | phone_no   | desg  | salary | age  | country |
+------+-------+------------+-------+--------+------+---------+
|  114 | john  | 1000000000 | chair |      4 |   50 | Thai    |
+------+-------+------------+-------+--------+------+---------+

UPDATE Emp SET salary=salary*0.25 WHERE salary<=18000;

SELECT ename FROM Emp;

+--------+
| ename  |
+--------+
| aakash |
| aditi  |
| marty  |
| lokesh |
| john   |
| jane   |
| masi   |
| asin   |
| aje    |
+--------+



