# Unit-Two-Topic-1
This readme file includes my learning on the topic Introduction to RDBMS and Normalization.

### Modes of storing data
- Flat File Model
- Hierarchical Model
- Relational Model
- Network Model
- Object-Oriented Model

### RDBMS
RDBMS stands for Relational Database Management System. The software used to store, manage, query, and retrieve data stored in a relational database is called a relational database management system (RDBMS). The RDBMS provides an interface between users and applications and the database, as well as administrative functions for managing data storage, access, and performance.

### Names of RDBMS
- Oracle
- MySQL
- SQL Server
- PostgreSQL
- SQLite
- MariaDB

### Database Objects
A database object is any defined object in a database that is used to **store or reference data**. Anything we make from **CREATE COMMAND** is known as Database Object.
Types of Database Ojects -
- **Table** – Basic unit of storage; composed rows and columns
- **View **– Logically represents subsets of data from one or more tables
- **Sequence** – Generates primary key values
- **Index** – Improves the performance of some queries
- **Synonym** – Alternative name for an object

### DDL - Data Defination Language
DDL is a set of SQL commands used to create, modify, and delete database structures but not data. 

- CREATE: This command is used to create the database or its objects (like table, index, function, views, store procedure, and triggers).
- DROP: This command is used to delete objects from the database.
- ALTER: This is used to alter the structure of the database.
- TRUNCATE: This is used to remove all records from a table, including all spaces allocated for the records are removed.
- COMMENT: This is used to add comments to the data dictionary.
- RENAME: This is used to rename an object existing in the database.

### DML - Data Manipulation Language
The SQL commands that deals with the manipulation of data present in the database belong to DML or Data Manipulation Language
- INSERT : It is used to insert data into a table.
- UPDATE: It is used to update existing data within a table.
- DELETE : It is used to delete records from a database table.
- LOCK: Table control concurrency.
- CALL: Call a PL/SQL or JAVA subprogram.
- EXPLAIN PLAN: It describes the access path to data.

### DCL - Data Control Language
DCL includes commands such as GRANT and REVOKE which mainly deal with the rights, permissions, and other controls of the database system. 
- GRANT: This command gives users access privileges to the database.
- REVOKE: This command withdraws the user’s access privileges given by using the GRANT command.

### DQL - Data Query language
DQL statements are used for performing queries on the data within schema objects. The purpose of the DQL Command is to get some schema relation based on the query passed to it. 
- SELECT: It is used to retrieve data from the database.
- 
### TCL - Transaction Control Language
TCL commands deal with the transaction within the database. 
- COMMIT: Commits a Transaction.
- ROLLBACK: Rollbacks a transaction in case of any error occurs.
- SAVEPOINT:Sets a savepoint within a transaction.
- SET TRANSACTION: Specify characteristics for the transaction.

## Operators in SQL
### Arithmetic Operators
+,-,*,/,%

### Bitwise Operators
&,|,^

### Comparison Operators
=,>,<,>=,<=,<>(not euqal to)

### Compound Operators
+=,-=,*=

### Logical Operators
ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT, OR, SOME

### Certification Link
https://olympus1.greatlearning.in/course_certificate/IJHSZCOF

### References
https://www.geeksforgeeks.org/database-objects-in-dbms/

https://drive.google.com/drive/folders/11-4BppTJugz_h297KKcvce2G0ZuUDewJ

https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/

w3schools.com/sql/sql_operators.asp


