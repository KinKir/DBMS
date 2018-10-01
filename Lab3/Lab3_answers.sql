CREATE TABLE employee(employee_name VARCHAR(10) PRIMARY KEY, street VARCHAR(10), city VARCHAR(10));

CREATE TABLE works(employee_name VARCHAR(10), company_name VARCHAR(10) PRIMARY KEY, salary INT(8), CONSTRAINT FK_empname FOREIGN KEY (employee_name) REFERENCES employee(employee_name));

CREATE TABLE company(company_name VARCHAR(10) PRIMARY KEY, city VARCHAR(10));

CREATE TABLE works(employee_name VARCHAR(10), company_name VARCHAR(10), salary INT(8), CONSTRAINT FK_empname FOREIGN KEY (employee_name) REFERENCES employee(employee_name), CONSTRAINT FK_compname FOREIGN KEY (company_name) REFERENCES company(company_name));

SELECT * FROM employee;
+---------------+-----------+------+
| employee_name | street    | city |
+---------------+-----------+------+
| alice         | st.agua   | alma |
| bob           | st.blue   | bane |
| chan          | st.claire | chow |
| derek         | st.agua   | alma |
| edgar         | st.blue   | bane |
+---------------+-----------+------+

SELECT * FROM works;
+---------------+--------------+--------+
| employee_name | company_name | salary |
+---------------+--------------+--------+
| alice         | acro         |  10100 |
| bob           | SBI          |  10150 |
| chan          | SBI          |    101 |
| derek         | dean         |  50000 |
| edgar         | elem         |    500 |
+---------------+--------------+--------+

SELECT * FROM company;
+--------------+------+
| company_name | city |
+--------------+------+
| acro         | alma |
| SBI          | bane |
| dean         | chow |
| elem         | chow |
+--------------+------+

SELECT * FROM manages;
+---------------+--------------+
| employee_name | manager_name |
+---------------+--------------+
| alice         | bob          |
| alice         | derek        |
| derek         | chan         |
| chan          | edgar        |
| edgar         | alice        |
+---------------+--------------+

SELECT employee.employee_name, employee.street, employee.city 
	FROM employee , works 
	WHERE works.employee_name=employee.employee_name AND works.company_name='SBI' AND works.salary>10000;

+---------------+---------+------+
| employee_name | street  | city |
+---------------+---------+------+
| bob           | st.blue | bane |
+---------------+---------+------+


SELECT employee.employee_name 
	FROM ((employee 
	INNER JOIN works ON employee.employee_name=works.employee_name) 
	INNER JOIN company ON works.company_name=company.company_name) 
	WHERE employee.city=company.city;

+---------------+
| employee_name |
+---------------+
| alice         |
| bob           |
+---------------+

SELECT e.employee_name from employee e, employee r, manages as m WHERE e.employee_name= m.employee_name AND m.manager_name=r.employee_name AND e.city=r.city AND e.street=r.street;

+---------------+
| employee_name |
+---------------+
| alice         |
+---------------+

SELECT e.employee_name from employee e, works w  WHERE e.employee_name= w.employee_name AND w.company_name!='SBI';

+---------------+
| employee_name |
+---------------+
| alice         |
| derek         |
| edgar         |
+---------------+

SELECT e.employee_name FROM employee e, works w WHERE e.employee_name=w.employee_name AND w.salary > (SELECT MAX(w.salary) FROM employee e, works w WHERE e.employee_name=w.employee_name AND w.company_name='SBI');

+---------------+
| employee_name |
+---------------+
| derek         |
+---------------+

SELECT e1.employee_name FROM employee e1, works w1 WHERE e1.employee_name=w1.employee_name AND w1.salary > (SELECT AVG(w2.salary) FROM employee e2, works w2 WHERE e2.employee_name=w2.employee_name AND w2.company_name=w1.company_name);

+---------------+
| employee_name |
+---------------+
| bob           |
+---------------+

SELECT b.company_name FROM company AS a INNER JOIN company AS b ON a.city=b.city WHERE a.company_name="ICICI" AND b.company_name!="ICICI";

SELECT company_name FROM(SELECT w.company_name, SUM(w.salary) AS payroll FROM employee e, works w WHERE e.employee_name=w.employee_name GROUP BY(w.company_name)) as tb WHERE payroll=(SELECT MIN(payroll) FROM(SELECT w.company_name, SUM(w.salary) AS payroll FROM employee e, works w WHERE e.employee_name=w.employee_name GROUP BY(w.company_name)) as tb1);

+--------------+
| company_name |
+--------------+
| elem         |
+--------------+




