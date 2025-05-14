CREATE DATABASE temp2;
SHOW DATABASES;
USE temp2;

CREATE TABLE customer (
ID int not null primary key auto_increment,
NAME VARCHAR(255) unique,
AGE int unsigned
);

INSERT INTO customer (ID, NAME, AGE) VALUES
 (001,"a",19);
 
INSERT INTO customer (ID, NAME, AGE) VALUES
 (002,"b",19);
 
INSERT INTO customer (ID, NAME, AGE) VALUES
 (003,"c",19),
 (004,"d",26),
 (005,"e",17),
 (006,"f",32),
 (007,"g",49),
 (008,"h",15),
 (009,"i",14),
 (0010,"j",13);
 
INSERT INTO customer (ID) VALUES
 (0011);
 
-- this will not work for the uniqueness
INSERT INTO customer (ID, NAME, AGE) VALUES
 (00100,"a",20);
 
UPDATE customer SET NAME = "TUNG SAHUR" WHERE ID = 004;

ALTER TABLE customer ADD random boolean;

SET SQL_SAFE_UPDATES = 0;
UPDATE customer SET random = false;
UPDATE customer SET age = age+1;

REPLACE INTO customer (ID) values
 (005);
 
REPLACE INTO customer (ID,NAME,AGE) values
 (006,"tumbartiro",69);

REPLACE INTO customer SET ID=007, NAME = "BAKTA";

REPLACE INTO customer (ID)
	SELECT ID
    FROM customer WHere ID = 0010;
 
SELECT * FROM customer;

CREATE TABLE orders (
ORDER_ID int primary key auto_increment,
CUST_ID INT, 
FOREIGN KEY (CUST_ID) REFERENCES customer(ID)
);

ALTER TABLE orders ADD order_status boolean default true;

INSERT INTO orders (ORDER_ID, CUST_ID) VALUES
 (001,002);
 
INSERT INTO orders (ORDER_ID, CUST_ID) VALUES
 (002,001),
 (003,001),
 (004,001),
 (005,001);

-- this delete will not gonna happen because we havent used the on delete cascade ruleon the orders table
DELETE FROM customer WHERE id = 001;

-- now we have to update the table
SHOW CREATE TABLE orders;
# Look for something like: CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`ID`)
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CUST_ID) REFERENCES customer(ID) ON DELETE CASCADE;

-- now run the delete command and see both the tables
DELETE FROM customer WHERE id = 001;

-- for null reference we have to do another thing
SHOW CREATE TABLE orders;
ALTER TABLE orders DROP FOREIGN KEY fk_orders_customer;
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CUST_ID) REFERENCES customer(ID) ON delete SET NUll;
DELETE FROM customer WHERE id = 001; # ORDERS WILL remains but there will be no customers


SELECT * FROM orders;