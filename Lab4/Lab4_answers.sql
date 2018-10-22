PART B

1. create table employee1 (fname varchar(15), lname varchar(15), eid int(6), start_date date, city varchar(20), salary int(9), dno int(2), supervisor_id int(5),email varchar(20));
2.  insert into employee1 values( "john", "taylor", 1777, "2007-04-13", "sydney", 20000, 4, 1945, "jtaylor@yahoo.com");
3. alter table employee1 modify column email varchar(30);

4.  insert into employee1 values( "mark", "williams", 1945, "2012-06-23", "london", 55055, 4, 8888, "mark_william@gmail.com");
5.  insert into employee1 values( "zoe", "jhonson", 2050, "2015-06-23", "oslo", 55055, 5, 2534, "zoe777@msn.com");
6. insert into employee1 values( "kathy", "franklin", 2051, "2013-06-29", "sydney", 20000, 5, 2534, "kathyfrank@yahoo.com");
7. insert into employee1 values( "trevor", "jacob", 2398, "2012-06-23", "london", 55055, 4, 1945, "trevorJ235@xyz.com");
8.  insert into employee1 values( "mike", "law", 5523, "2009-12-04", "london", 70000, 4, 7777, "mlaw9@gmail.com");
9.  insert into employee1 values( "jude", "owens", 7777, "2004-12-04", "london", 130000, 4, NULL, "mailjude@xyz.com");
10. insert into employee1 values( "alice", "bright", 8888, "1999-12-19", "london", 1111143, 7, NULL,

11. select salary from employee1 e1 where 1= ( select count(distinct(e2. salary)) from employee1 e2 where e1.salary>e2.salary);
+--------+
| salary |
+--------+
|  55055 |
|  55055 |
|  55055 |
+--------+

12.  select email, substring_index(email,'@',1) from employee1;

PART A

1. select a.office,a.eid,concat(a.salary, ' ',b.currency_code) from EMPLOYEE a inner join currency_table as b on a.office=b.location;
+---------+------+---------------------------------------+
| office  | eid  | concat(a.salary, ' ',b.currency_code) |
+---------+------+---------------------------------------+
| chicago | 1777 | 20000 USD                             |
| london  | 1945 | 55055 GBP                             |
| paris   | 2050 | 55055 EUR                             |
| chicago | 2051 | 20000 USD                             |
| london  | 2398 | 55055 GBP                             |
| london  | 7777 | 130000 GBP                            |
| london  | 8888 | 111114 GBP                            |
+---------+------+---------------------------------------+
7 rows in set (0.05 sec)

2. select a.fname, a.eid from EMPLOYEE a, EMPLOYEE b where a.fname=b.fname and a.eid!=b.eid;
+--------+------+
| fname  | eid  |
+--------+------+
| john   | 7777 |
| trevor | 2398 |
| trevor | 1945 |
| John   | 1777 |
+--------+------+

3.  select count(*) ,substring_index(email,'@',-1) as a from EMPLOYEE group by a having count(*)>1;
+----------+-----------+
| count(*) | a         |
+----------+-----------+
|        3 | gmail.com |
|        2 | yahoo.com |
+----------+-----------+

4. select (.05*salary) as deducted, (salary - .05*salary + bonus) as Final_salary from EMPLOYEE;
+----------+--------------+
| deducted | Final_salary |
+----------+--------------+
|  1000.00 |     19400.00 |
|  2752.75 |     53302.25 |
|  2752.75 |     54302.25 |
|  1000.00 |     19000.00 |
|  2752.75 |     52302.25 |
|  6500.00 |    127000.00 |
|  5555.70 |    108558.30 |
+----------+--------------+

5.select * from EMPLOYEE order by salary desc, lname asc;
+--------+----------+------+------------+---------+--------+------+-------+------------------------+
| fname  | lname    | eid  | start_date | office  | salary | dno  | bonus | email                  |
+--------+----------+------+------------+---------+--------+------+-------+------------------------+
| john   | owens    | 7777 | 2004-12-04 | london  | 130000 |    4 |  3500 | mailjude@yahoo.com     |
| alice  | bright   | 8888 | 1973-12-19 | london  | 111114 |    7 |  3000 | ab23@gmail.com         |
| trevor | jacob    | 2398 | 1999-06-23 | london  |  55055 |    4 |     0 | trevorJ235@aol.com     |
| zoe    | jhonson  | 2050 | 1992-06-23 | paris   |  55055 |    5 |  2000 | zoe777@msn.com         |
| trevor | williams | 1945 | 1980-06-23 | london  |  55055 |    4 |  1000 | trev_william@gmail.com |
| kathy  | franklin | 2051 | 2013-06-29 | chicago |  20000 |    5 |     0 | kathyfrank@gmail.com   |
| John   | Taylor   | 1777 | 2012-04-13 | chicago |  20000 |    4 |   400 | jtaylor@yahoo.com      |
+--------+----------+------+------------+---------+--------+------+-------+------------------------+
7 rows in set (0.00 sec)

6.  select dno from EMPLOYEE where bonus>0 group by dno having count(bonus)>1;
+------+
| dno  |
+------+
|    4 |
+------+

