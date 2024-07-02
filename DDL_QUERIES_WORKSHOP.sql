-- DDL
CREATE DATABASE MyDataBase;
DROP DATABASE MyDataBase;

-- CREATED DATABASE
CREATE DATABASE plumbing;
USE plumbing;

-- TABLES
CREATE TABLE people(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE services(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(20,2) NOT NULL
);

CREATE TABLE customers(
	id INT PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE plumbers(
	id INT PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE bills(
	id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    service_id INT NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(id),
    plumber_id INT NOT NULL,
    FOREIGN KEY (plumber_id) REFERENCES plumbers(id),
    date DATE not null,
    total DECIMAL(20,2) NOT NULL
);

CREATE TABLE discounts(
	id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bills(id),
    amount DECIMAL(20,2) NOT NULL
);

CREATE TABLE payments(
	id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bills(id),
    date DATE NOT NULL
);

CREATE TABLE audits(
	id INT PRIMARY KEY AUTO_INCREMENT,
	board VARCHAR(50) NOT NULL,
    action VARCHAR(50) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE service_plumber(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    service_id INT NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(id),
    plumber_id INT NOT NULL,
    FOREIGN KEY (plumber_id) REFERENCES plumbers(id)
);

-- ALTER TABLES

ALTER TABLE services
ADD COLUMN customer_id INT NOT NULL,
ADD FOREIGN KEY (customer_id) REFERENCES customers(id);

ALTER TABLE audits
ADD register_id INT NOT NULL;

ALTER TABLE people
ADD address VARCHAR(255) NOT NULL;

ALTER TABLE services
ADD date DATE NOT NULL;

ALTER TABLE bills
ADD address VARCHAR(255) NOT NULL;

DESC payments;

ALTER TABLE payments
MODIFY bill_id INT NOT NULL;

ALTER TABLE discounts
DROP FOREIGN KEY discounts_ibfk_1;

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'payments' AND COLUMN_NAME = 'bill_id';

ALTER TABLE discounts
DROP COLUMN bill_id;







