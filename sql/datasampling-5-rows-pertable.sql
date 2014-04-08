SELECT * FROM test.City LIMIT 5;
SELECT * FROM test.Province LIMIT 5;
SELECT * FROM test.Store LIMIT 5;
SELECT * FROM test.Manager LIMIT 5;
SELECT * FROM test.Product LIMIT 5;
SELECT * FROM test.ProductGroup LIMIT 5;
SELECT * FROM test.Sales LIMIT 5;
SELECT * FROM test.Customer LIMIT 5;
SELECT * FROM test.AgeGroup LIMIT 5;
SELECT * FROM test.PopulationByYearByProvince LIMIT 5;
SELECT * FROM test.OntarioTopBabyNames LIMIT 5;
SELECT * FROM test.LifeExpectency LIMIT 5;

/*

OUTPUT

mysql> SELECT * FROM test.City LIMIT 5;
+---------+-----------+
| city_id | name      |
+---------+-----------+
|       1 | Toronto   |
|       2 | Vancouver |
|       3 | Ottawa    |
|       4 | Victoria  |
|       5 | Ottawa    |
+---------+-----------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM test.Province LIMIT 5;
+-------------+---------+---------+
| province_id | city_id | name    |
+-------------+---------+---------+
|           1 |       1 | Ontario |
|           2 |       2 | Ontario |
|           3 |       3 | Ontario |
|           4 |       4 | Ontario |
|           5 |       5 | Ontario |
+-------------+---------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.Store LIMIT 5;
+----------+------------+-------------+
| store_id | manager_id | province_id |
+----------+------------+-------------+
|        1 |          1 |           1 |
|        2 |          2 |           1 |
|        3 |          2 |           1 |
|        4 |          3 |           1 |
|        5 |          1 |           1 |
+----------+------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.Manager LIMIT 5;
+-----------+----------------+
| idManager | name           |
+-----------+----------------+
|         1 | Bob Young      |
|         2 | Jim Carey      |
|         3 | Mark Ewing     |
|         4 | George Freeman |
|         5 | Dorthy Tailer  |
+-----------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.Product LIMIT 5;
+------------+------------------------+-------+-------------+
| product_id | product_name           | price | initialcost |
+------------+------------------------+-------+-------------+
|          1 | Bayers Hockey Puck     | 49.99 |       23.99 |
|          2 | York Graduation Plaque | 29.99 |        4.89 |
|          3 | Raptors Jersey         | 59.99 |       14.99 |
|          4 | Maple Leaf Jersey      | 22.99 |       12.99 |
|          5 | Fridge Magnet          |  1.11 |        0.05 |
+------------+------------------------+-------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.ProductGroup LIMIT 5;
+-----------------+-------------------------+------------+
| productGroup_id | product_name            | product_id |
+-----------------+-------------------------+------------+
|               1 | Personalized Golf Clubs |          1 |
|               2 | Magnets                 |          2 |
|               3 | Bedroom Door Signs      |          3 |
|               4 | Graduation Plaques      |          4 |
|               5 | Bedroom Door Signs      |          5 |
+-----------------+-------------------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.Sales LIMIT 5;
+---------+----------+-------------+-----------------+-----+------+
| sale_id | store_id | customer_id | productgroup_id | qty | year |
+---------+----------+-------------+-----------------+-----+------+
|       1 |        1 |           5 |               3 |   7 | 2014 |
|       2 |        1 |           3 |               4 |   1 | 2014 |
|       3 |        1 |           2 |               5 |   4 | 2014 |
|       4 |        1 |           1 |               1 |   4 | 2014 |
|       5 |        1 |           4 |               2 |   2 | 2014 |
+---------+----------+-------------+-----------------+-----+------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.Customer LIMIT 5;
+-------------+-----------------+------------+-----+
| customer_id | customer_name   | dob        | sex |
+-------------+-----------------+------------+-----+
|           1 | Fred Gilton     | 0000-00-00 |     |
|           2 | Jim Carey       | 0000-00-00 |     |
|           3 | Tina Hawks      | 0000-00-00 |    |
|           4 | Sarah Rodrigues | 0000-00-00 |    |
|           5 | Ivan Penny      | 0000-00-00 |     |
+-------------+-----------------+------------+-----+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.AgeGroup LIMIT 5;
+-------------+--------------------------+-------+------+
| ageGroup_id | name                     | begin | end  |
+-------------+--------------------------+-------+------+
|           1 | Infant/ Young Children   |     0 |   12 |
|           2 | Teenagers / Young Adults |    13 |   25 |
|           3 | Adults                   |    26 |   59 |
|           4 | Elderly                  |    60 |  999 |
+-------------+--------------------------+-------+------+
4 rows in set (0.00 sec)

mysql> DESCRIBE  test.LifeExpectency;
+------------------+-------------+------+-----+---------+----------------+
| Field            | Type        | Null | Key | Default | Extra          |
+------------------+-------------+------+-----+---------+----------------+
| idLifeExpectency | int(11)     | NO   | PRI | NULL    | auto_increment |
| year_from        | int(11)     | NO   |     | NULL    |                |
| year_to          | int(11)     | NO   |     | NULL    |                |
| province         | varchar(45) | NO   |     | NULL    |                |
| male_count       | int(11)     | NO   |     | NULL    |                |
| female_count     | int(11)     | NO   |     | NULL    |                |
+------------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM test.PopulationByYearByProvince LIMIT 5;
Empty set (0.00 sec)

mysql> SELECT * FROM test.OntarioTopBabyNames LIMIT 5;
+-----------------------+------+-------+-----------+--------+
| idOntarioTopBabyNames | year | name  | frequency | gender |
+-----------------------+------+-------+-----------+--------+
|                     1 | 1999 | AADAM |         5 |       |
|                     2 | 2005 | AADAM |         6 |       |
|                     3 | 2007 | AADEN |        10 |       |
|                     4 | 2008 | AADEN |        34 |       |
|                     5 | 2009 | AADEN |        38 |       |
+-----------------------+------+-------+-----------+--------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test.LifeExpectency LIMIT 5;
+------------------+-----------+---------+----------+------------+--------------+
| idLifeExpectency | year_from | year_to | province | male_count | female_count |
+------------------+-----------+---------+----------+------------+--------------+
|                1 |      1920 |    1922 |          |         59 |           61 |
|                2 |      1930 |    1932 |          |         60 |           62 |
|                3 |      1940 |    1942 |          |         63 |           66 |
|                4 |      1950 |    1952 |          |         66 |           71 |
|                5 |      1960 |    1962 |          |         68 |           74 |
+------------------+-----------+---------+----------+------------+--------------+
5 rows in set (0.00 sec)




*/
