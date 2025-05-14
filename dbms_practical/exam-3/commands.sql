CREATE DATABASE shopping_cart;
USE shopping_cart;

CREATE TABLE agent (
    agent_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO agent (agent_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14);

SELECT * FROM agent
ORDER BY commission DESC
LIMIT 1;

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT,
    quantity INT,
    agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES agent(agent_id)
);

INSERT INTO product (product_id, name, price, quantity, agent_id) VALUES
(3002, 'Soap', 100, 10, 5001),
(3007, 'Tooth Paste', 200, 30, 5001),
(3005, 'Tooth Brush', 150, 20, 5002),
(3008, 'Cooking Oil', 120, 10, 5005),
(3004, 'Honey', 200, 25, 5006);

SELECT COUNT(*) AS product_count FROM product;

SELECT a.agent_id, a.name, a.city, a.commission
FROM agent a
JOIN product p ON a.agent_id = p.agent_id
WHERE p.name = 'Cooking Oil';

SELECT a.agent_id, a.name
FROM agent a
JOIN product p ON a.agent_id = p.agent_id
WHERE a.city = 'Paris' AND p.name = 'Honey';

SELECT a.agent_id, a.name, a.city, p.name AS product_name
FROM agent a
JOIN product p ON a.agent_id = p.agent_id
WHERE a.commission > 0.12;

SELECT name, city
FROM agent
WHERE agent_id = 5006;

SELECT * FROM product
WHERE price > 100 AND quantity <= 10;