insert into supplier values(4, "Papazzi", "Dhyan", "Mumbai", "India", 0098343678, 1114512190);
insert into supplier values(3, "Telecom", "Chandu", "Tokyo", "Japan", 0098343434, 8934512190);
insert into supplier values(2, "Nokia", "Bala", "London", "UK", 9898343434, 1234512190);
insert into supplier values(1, "Blackberry", "Amit", "New York", "USA", 9898989898, 1234567890);

insert into customer values(1, 'tom', 'jerry', 'Delhi', 'India', 12345);
insert into customer values(2, 'Jake', 'Peralta', 'Brooklyn', 'USA', 123456);
insert into customer values(3, 'Alice', 'Bob', 'Mumbai', 'India', 123456);
INSERT INTO customer VALUES(4, 'Alicia', 'Souza', 'Bangalore', 'India', 456789);

INSERT INTO orders VALUES(1, '2018-12-10', 12, 1, 1000);
INSERT INTO orders VALUES(2, '2018-12-10', 123, 2, 1000);
INSERT INTO orders VALUES(3, '2018-12-10', 3, 3, 500);
INSERT INTO orders VALUES(4, '2015-12-10', 34, 4, 1500);

insert into product values (1,'sugar', 1, 150, 1, false);
insert into product values (2,'tea', 3, 10, 2, false);
insert into product values (3,'coffee', 4, 50, 3, false);
insert into product values (4,'rice', 2, 80, 4, false);
insert into product values (5,'wheat', 2, 180, 5, true);

INSERT INTO order_item VALUES(1, 1, 1, 13, 5);
INSERT INTO order_item VALUES(2, 2, 3, 10, 2);
INSERT INTO order_item VALUES(3, 4, 2, 5, 4);
INSERT INTO order_item VALUES(4, 2, 1, 20, 1);

CREATE TABLE orders(id int PRIMARY KEY, order_date date, order_number int, customer_id int, total_amount int, FOREIGN KEY(customer_id) REFERENCES customer(id));

CREATE TABLE customer(id int PRIMARY KEY, fname varchar(10), lname varchar(10), city varchar(10), country varchar(10), phone int(10));

CREATE TABLE product(id int PRIMARY KEY, productname varchar(10), supplierid int, unitprice int, package int, isDiscontinued bool, FOREIGN KEY(supplierid) REFERENCES supplier(id));

CREATE TABLE supplier(id int PRIMARY KEY, companyname varchar(20), contactname varchar(20), city varchar(15), country varchar(15), phone int(10), fax int(10));

CREATE TABLE order_item(id int PRIMARY KEY, order_id int, product_id int, unitprice int, quantity int, FOREIGN KEY(product_id) REFERENCES product(id), FOREIGN KEY(order_id) REFERENCES orders(id));

1.SELECT * FROM supplier WHERE country IN('USA','UK','Japan');

+----+-------------+-------------+----------+---------+------------+------------+
| id | companyname | contactname | city     | country | phone      | fax        |
+----+-------------+-------------+----------+---------+------------+------------+
|  1 | Blackberry  | Amit        | New York | USA     | 2147483647 | 1234567890 |
|  2 | Nokia       | Bala        | London   | UK      | 2147483647 | 1234512190 |
|  3 | Telecom     | Chandu      | Tokyo    | Japan   |   98343434 | 2147483647 |
+----+-------------+-------------+----------+---------+------------+------------+

2.SELECT productname FROM product WHERE unitprice NOT IN(10, 20, 30, 40, 50);

+-------------+
| productname |
+-------------+
| sugar       |
| rice        |
| wheat       |
+-------------+


3.Select * from customer where country in (select country from supplier);
+----+--------+---------+-----------+---------+--------+
| id | fname  | lname   | city      | country | phone  |
+----+--------+---------+-----------+---------+--------+
|  1 | tom    | jerry   | Delhi     | India   |  12345 |
|  2 | Jake   | Peralta | Brooklyn  | USA     | 123456 |
|  3 | Alice  | Bob     | Mumbai    | India   | 123456 |
|  4 | Alicia | Souza   | Bangalore | India   | 456789 |
+----+--------+---------+-----------+---------+--------+

4.SELECT * FROM orders o, customer c WHERE o.customer_id=c.id;

+----+------------+--------------+-------------+--------------+----+--------+---------+-----------+---------+--------+
| id | order_date | order_number | customer_id | total_amount | id | fname  | lname   | city      | country | phone  |
+----+------------+--------------+-------------+--------------+----+--------+---------+-----------+---------+--------+
|  1 | 2018-12-10 |           12 |           1 |         1000 |  1 | tom    | jerry   | Delhi     | India   |  12345 |
|  2 | 2018-12-10 |          123 |           2 |         1000 |  2 | Jake   | Peralta | Brooklyn  | USA     | 123456 |
|  3 | 2018-12-10 |            3 |           3 |          500 |  3 | Alice  | Bob     | Mumbai    | India   | 123456 |
|  4 | 2015-12-10 |           34 |           4 |         1500 |  4 | Alicia | Souza   | Bangalore | India   | 456789 |
+----+------------+--------------+-------------+--------------+----+--------+---------+-----------+---------+--------+

5.select oi.order_id, p.productname, oi.quantity, oi.unitprice from product as p, order_item as oi where oi.product_id=p.id;

+----------+-------------+----------+-----------+
| order_id | productname | quantity | unitprice |
+----------+-------------+----------+-----------+
|        1 | sugar       |        5 |        13 |
|        2 | coffee      |        2 |        10 |
|        4 | tea         |        4 |         5 |
|        2 | sugar       |        1 |        20 |
+----------+-------------+----------+-----------+

6.SELECT fname, lname FROM customer c LEFT OUTER JOIN orders o ON c.id=o.id WHERE o.id IS NULL;

7. SELECT fname, lname FROM customer c, supplier s, orders o, order_item oi, product p WHERE o.id=oi.order_id AND oi.product_id=p.id AND p.supplierid=s.id AND o.customer_id=c.id AND c.country=s.country;
+-------+---------+
| fname | lname   |
+-------+---------+
| Jake  | Peralta |
+-------+---------+

8. select c1.fname, c2.fname from customer as c1, customer as c2 where c1.city=c2.city and c1.country=c2.country and c1.id!=c2.id;

Empty set (0.00 sec)

9. select c.phone from customer as c;
+--------+
| phone  |
+--------+
|  12345 |
| 123456 |
| 123456 |
| 456789 |
+--------+
select s.phone from supplier as s;
+------------+
| phone      |
+------------+
| 2147483647 |
| 2147483647 |
|   98343434 |
|   98343678 |
+------------+

10. select p.productname from product as p, order_item as oi where p.id=oi.product_id and oi.quantity>100;

Empty set (0.00 sec)

11. select c.fname, count(*) from customer as c, orders as o where c.id=o.customer_id group by c.id;
+--------+----------+
| fname  | count(*) |
+--------+----------+
| tom    |        1 |
| Jake   |        1 |
| Alice  |        1 |
| Alicia |        1 |
+--------+----------+

12. select p.productname from product as p, order_item as oi where p.id=oi.product_id and oi.quantity=1;
+-------------+
| productname |
+-------------+
| sugar       |
+-------------+


