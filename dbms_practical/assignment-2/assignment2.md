# SQL Assignment

1. Create a table named `salesman` under your previously created database with the following attributes:  
`student_id`, `name`, `city`, and `commission`.  
    - Make `salesman_id` the primary key of the table.

2. Insert Data into `salesman` and Display

    - Table: `salesman`

| salesman_id | name        | city      | commission |
|-------------|-------------|-----------|------------|
| 5001        | James Hoog  | New York  | 0.15       |
| 5002        | Nail Knite  | Paris     | 0.13       |
| 5005        | Pit Alex    | London    | 0.11       |
| 5006        | Mc Lyon     | Paris     | 0.14       |
| 5007        | Paul Adam   | Rome      | 0.13       |
| 5003        | Lauson Hen  | San Jose  | 0.12       |

3. Create another table named `customer` under your previously created database with the following attributes:  
`customer_id`, `cust_name`, `city`, `grade`, and `salesman_id`.  
    - Make `customer_id` the primary key of the table.

4. Insert Data into `customer` and Display

    - Table: `customer`

| customer_id | cust_name       | city        | grade | salesman_id |
|-------------|------------------|-------------|-------|--------------|
| 3002        | Nick Rimando     | New York    | 100   | 5001         |
| 3007        | Brad Davis       | New York    | 200   | 5001         |
| 3005        | Graham Zusi      | California  | 200   | 5002         |
| 3008        | Julian Green     | London      | 300   | 5002         |
| 3004        | Fabian Johnson   | Paris       | 300   | 5006         |
| 3009        | Geoff Cameron    | Berlin      | 100   | 5003         |
| 3003        | Jozy Altidor     | Moscow      | 200   | 5007         |
| 3001        | Brad Guzan       | London      |       | 5005         |

 5. From the given tables write a SQL query to find the salesperson and customer who reside in the same city. 
    - Return: `Salesman`, `cust_name`, and `city`.

 6. Create another table named `orders` with `ord_no` as the primary key.

    - Table: `orders`

| ord_no | purch_amt | ord_date   | customer_id | salesman_id |
|--------|-----------|------------|-------------|-------------|
| 70001  | 150.5     | 2012-10-05 | 3005        | 5002        |
| 70009  | 270.65    | 2012-09-10 | 3001        | 5005        |
| 70002  | 65.26     | 2012-10-05 | 3002        | 5001        |
| 70004  | 110.5     | 2012-08-17 | 3009        | 5003        |
| 70007  | 948.5     | 2012-09-10 | 3005        | 5002        |
| 70005  | 2400.6    | 2012-07-27 | 3007        | 5001        |
| 70008  | 5760.0    | 2012-09-10 | 3002        | 5001        |
| 70010  | 1983.43   | 2012-10-10 | 3004        | 5006        |
| 70003  | 2480.4    | 2012-10-10 | 3009        | 5003        |
| 70012  | 250.45    | 2012-06-27 | 3008        | 5002        |
| 70011  | 75.29     | 2012-08-17 | 3003        | 5007        |
| 70013  | 3045.6    | 2012-04-25 | 3002        | 5001        |

 7. From the given tables write a SQL query to find those orders where the order amount exists between 500 and 2000.  
    - Return: `ord_no`, `purch_amt`, `cust_name`, `city`.

 8. From the given tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company.  
    - Return: `Customer Name`, `customer city`, `Salesman`, `commission`.

 9. From the given tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company.  
    - Return: `Customer Name`, `customer city`, `Salesman`, `salesman city`, `commission`.

 10. From the given tables write a SQL query to find the details of an order.  
    - Return: `ord_no`, `ord_date`, `purch_amt`, `Customer Name`, `grade`, `Salesman`, `commission`.

 11. Write a SQL statement to join the tables `salesman`, `customer` and `orders` so that the same column of each table appears once and only the relational rows are returned. 

 12. From the given tables write a SQL query to display the `customer name`, `customer city`, `grade`, `salesman`, `salesman city`. The results should be sorted by ascending `customer_id`. 

 13. From the given tables write a SQL query to find those customers with a grade less than 300. Return `cust_name`, `customer city`, `grade`, `Salesman`, `salesmancity`. The result should be ordered by ascending `customer_id`. 

 14. Write a SQL statement to make a report with `customer name`, `city`, `order number`, `order date`, and `order amount` in ascending order according to the `order date` to determine whether any of the existing customers have placed an order or not.