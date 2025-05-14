1. Create a database named `shopping_cart`.

2. Create a table named `agent` under `shopping_cart` database with the following attributes:
   `agent_id`, `name`, `city`, and `commission`. Make `agent_id` as the primary key of the table.

3. Insert the given data in the table and display.

```
agent_id | name        | city     | commission
---------+-------------+----------+------------
5001     | James Hoog  | New York | 0.15
5002     | Nail Knite  | Paris    | 0.13
5005     | Pit Alex    | London   | 0.11
5006     | Mc Lyon     | Paris    | 0.14
```

4. Find the agent details who gets maximum commission.

5. Create another table named `product` under the same database with the following attributes:
   `product_id`, `name`, `price`, `quantity`, and `agent_id`.
   Make `product_id` as the primary key of the table.

6. Insert the given data in the table and display.

```
product_id | name        | price | quantity | agent_id
-----------+-------------+-------+----------+----------
3002       | Soap        | 100   | 10       | 5001
3007       | Tooth Paste | 200   | 30       | 5001
3005       | Tooth Brush | 150   | 20       | 5002
3008       | Cooking Oil | 120   | 10       | 5005
3004       | Honey       | 200   | 25       | 5006
```

7. Count the number of products in the product table.

8. From the given tables, write a SQL query to find the agent details who sells **Cooking Oil**.
   Return `agent_id`, `agent name`, `agent city`, and `commission`.

9. From the given tables, write a SQL query to find the agent’s name and ID who lives in Paris as well as sells **Honey**.

10. From the given tables, write a SQL query to find the agent who received commissions of more than 12 percent from the company.
    Return agent’s name, ID, city, and the products’ names he/she sells.

11. Write a query to get the name and city of the agent with ID 5006 from Paris to Athens.

12. Write a query to delete the product which has a price of 100 or less and quantity is 10 or less.