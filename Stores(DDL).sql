-- Entities Creation
CREATE TABLE users
(
    id INT PRIMARY KEY,
    full_name VARCHAR(25),
    email VARCHAR(25),
    gender VARCHAR(10),
    date_of_birth VARCHAR(15),
    country_code INT,
    created_at VARCHAR(25)
);

CREATE TABLE countries
(
    code INT PRIMARY KEY,
    name VARCHAR(25),
    continent_name VARCHAR(25)
);

CREATE TABLE orders
(
    id INT PRIMARY KEY,
    user_id INT,
    status VARCHAR(25),
    created_at VARCHAR(25)
);

CREATE TABLE merchants
(
    id INT PRIMARY KEY,
    merchant_name VARCHAR(25),
    admin_id INT,
    country_code INT,
    created_at VARCHAR(25)
);

CREATE TABLE products
(
    id INT PRIMARY KEY,
    merchant_id INT,
    name VARCHAR(25),
    price INT,
    status VARCHAR(25),
    created_at VARCHAR(25)
);

CREATE TABLE order_items
(
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- Entities Relations

ALTER TABLE users
ADD CONSTRAINT country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(code) ;

ALTER TABLE orders
ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE merchants
ADD CONSTRAINT admin_id_fkey FOREIGN KEY (admin_id) REFERENCES users(id),
ADD CONSTRAINT country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(code);

ALTER TABLE products
ADD CONSTRAINT merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES merchants(id);

ALTER TABLE order_items
ADD CONSTRAINT order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id),
ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);