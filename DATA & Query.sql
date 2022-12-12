-- DATA
INSERT INTO countries VALUES(1,'1st country name','1st continent');
INSERT INTO countries VALUES(2,'2nd country name','2nd continent');
INSERT INTO countries VALUES(3,'3rd country name','3rd continent');

INSERT INTO users VALUES(1,'1st usr name','1st email','1st gender','1st birthdate',1,'1st usr creation place');
INSERT INTO users VALUES(2,'2nd usr name','2nd email','2nd gender','2nd birthdate',2,'2nd usr creation place');
INSERT INTO users VALUES(3,'3rd usr name','3rd email','3rd gender','3rd birthdate',2,'3rd usr creation place');
INSERT INTO users VALUES(4,'4th usr name','4th email','4th gender','4th birthdate',3,'4th usr creation place');

INSERT INTO orders VALUES(1,1,'1st status','1st order creation place');
INSERT INTO orders VALUES(2,1,'2nd status','2nd order creation place');
INSERT INTO orders VALUES(3,1,'3rd status','3rd order creation place');
INSERT INTO orders VALUES(4,2,'4th status','4th order creation place');

INSERT INTO merchants VALUES(1,'1st merch name',4,1,'1st merch creation place');
INSERT INTO merchants VALUES(2,'2nd merch name',4,3,'2nd merch creation place');
INSERT INTO merchants VALUES(3,'3rd merch name',4,3,'3rd merch creation place');

INSERT INTO products VALUES(1,1,'1st prod name',2, '1st status','1st prod creation place');
INSERT INTO products VALUES(2,1,'2nd prod name',10,'2nd status','2nd prod creation place');
INSERT INTO products VALUES(3,2,'3rd prod name',5, '3rd status','3rd prod creation place');
INSERT INTO products VALUES(4,3,'4th prod name',3, '4th status','4th prod creation place');

INSERT INTO order_items VALUES(1,1,5);
INSERT INTO order_items VALUES(2,1,6);
INSERT INTO order_items VALUES(2,2,7);
INSERT INTO order_items VALUES(2,3,8);
INSERT INTO order_items VALUES(3,1,3);
INSERT INTO order_items VALUES(3,2,2);

-- VIEW
SELECT * FROM countries;
SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM merchants;
SELECT * FROM products;
SELECT * FROM order_items;

-- QUERY
SELECT full_name ,order_id, SUM(quantity * price) AS Total_Price
FROM products p INNER JOIN order_items oi ON p.id = oi.product_id 
				INNER JOIN orders o ON oi.order_id = o.id
				INNER JOIN users u ON o.user_id = u.id
GROUP BY u.id ,order_id;


