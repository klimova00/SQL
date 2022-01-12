mysql> SHOW DATABASES
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| my_sql             |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0,00 sec)

mysql> CREATE DATABASE example;
Query OK, 1 row affected (0,05 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| my_sql             |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0,00 sec)

mysql> USE example;
Database changed
mysql> CREATE TABLE IF NOT EXIST users (
    -> id SERIAL,
    -> name VARCHAR(255) NOT NULL UNIQUE
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'EXIST users (
id SERIAL,
name VARCHAR(255) NOT NULL UNIQUE
)' at line 1
mysql> CREATE TABLE IF NOT EXISTS users ( id SERIAL, name VARCHAR(255) NOT NULL
 UNIQUE );
Query OK, 0 rows affected (0,07 sec)

mysql> CREATE DATABASE sample;
Query OK, 1 row affected (0,04 sec)

mysql> exit
Bye

nna@anna-VirtualBox:~$ mysqldump example > example.sql
anna@anna-VirtualBox:~$ ls
Desktop    Downloads    Music     Public     Videos
Documents  example.sql  Pictures  Templates
anna@anna-VirtualBox:~$ mysql sample < example.sql 
anna@anna-VirtualBox:~$ SHOW DATABASES
SHOW: command not found
anna@anna-VirtualBox:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.27-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE sample;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0,01 sec)

mysql> exit
Bye

anna@anna-VirtualBox:~$ mysqldump mysql help_keyword --where='TRUE ORDER BY help_keyword_id LIMIT 100' > help_keyword_100.sql
