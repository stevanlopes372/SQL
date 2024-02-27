CREATE SCHEMA qq;

CREATE TABLE qq.Customers (
    CustomerID int PRIMARY KEY,
    CustomerName varchar(255),
    ContactName varchar(255),
    Country varchar(255),
    City varchar(255)
);

INSERT INTO qq.Customers (CustomerID, CustomerName, ContactName, Country, City)
VALUES 
    (1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany', 'Berlin'),
    (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico', 'Mexico D.F.'),
    (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico', 'Mexico D.F.'),
    (4, 'Around the Horn', 'Thomas Hardy', 'UK', 'London'),
    (5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden', 'Luleå');

CREATE TABLE qq.Orders (
    OrderID int PRIMARY KEY,
    CustomerID int,
    OrderDate date
);

INSERT INTO qq.Orders (OrderID, CustomerID, OrderDate)
VALUES 
    (1, 3, '1996-07-04'),
    (2, 1, '1996-07-05'),
    (3, 2, '1996-07-06'),
    (4, 4, '1996-07-07'),
    (5, 5, '1996-07-08'),
    (6, 5, '1996-07-09'),
    (7, 4, '2000-07-04')
    ;


CREATE TABLE qq.Products (
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName varchar(255),
    SupplierID int,
    CategoryID int,
    Unit varchar(255),
    Price decimal
);

INSERT INTO qq.Products (ProductName, SupplierID, CategoryID, Unit, Price)
VALUES 
    ('Chai', 1, 1, '10 boxes x 20 bags', 18),
    ('Chang', 1, 1, '24 - 12 oz bottles', 19),
    ('Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
    ('Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22),
    ('Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', 21.35),
	('Macarrão Instantâneo', 1, 5, '10 caixas x 20 pacotes', 15.00),
	('Molho de Tomate', 2, 3, '12 - 16 oz jars', 10.50),
	('Batata Chips', 3, 1, '24 - 1 oz pacotes', 7.99),
	('Cereal de Milho', 2, 6, '16 - 1.5 oz caixas', 5.50),
	('Feijão Preto', 5, 2, '12 - 15 oz latas', 1.99),
	('Azeite Extra Virgem', 4, 8, '6 - 500 ml garrafas', 10.99),
	('Suco de Laranja', 1, 4, '24 - 250 ml caixas', 6.49),
	('Papel Toalha', 5, 10, '6 rolos x 80 folhas', 9.99),
	('Arroz Integral', 3, 7, '10 sacos x 1 kg', 21.00),
	('Vinho Tinto', 4, 9, '12 - 750 ml garrafas', 12.49),
	('Granola', 2, 9, '10 pacotes x 500 g', 10.00),
	('Leite Integral', 1, 8, '12 - 1 L caixas', 12.00),
	('Maionese', 3, 7, '6 - 500 g potes', 4.99),
	('Biscoito Recheado', 4, 6, '24 - 130 g pacotes', 3.50),
	('Café em grãos', 5, 5, '5 sacos x 1 kg', 20.00),
	('Sardinha enlatada', 1, 4, '12 - 100 g latas', 8.99),
	('Manteiga sem sal', 3, 3, '10 - 200 g tabletes', 7.50),
	('Farinha de trigo', 4, 2, '10 sacos x 1 kg', 5.00),
	('Presunto fatiado', 1, 10, '48 - 50 g pacotes', 18.00),
	('Champanhe', 3, 1, '6 - 750 ml garrafas', 25.99);

CREATE TABLE qq.Suppliers (
    SupplierID int PRIMARY KEY,
    SupplierName varchar(255),
    ContactName varchar(255),
    Country varchar(255),
    City varchar(255)
);

INSERT INTO qq.Suppliers (SupplierID, SupplierName, ContactName, Country, City)
VALUES 
    (1, 'Exotic Liquid', 'Charlotte Cooper', 'USA', 'New York'),
    (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'USA', 'New Orleans'),
    (3, 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'USA', 'Ann Arbor'),
    (4, 'Tokyo Traders', 'Yoshi Nagase', 'Japan', 'Tokyo'),
    (5, 'Cooperativa de Quesos \'Las Cabras\'', 'Antonio del Valle Saavedra', 'Spain', 'Oviedo');


CREATE TABLE qq.OrderDetails (
    OrderDetailID int PRIMARY KEY,
    OrderID int,
    ProductID int,
    Quantity int
);

INSERT INTO qq.OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
    (1, 1, 1, 10),
    (2, 1, 2, 5),
    (3, 2, 2, 7),
    (4, 2, 3, 5),
    (5, 3, 3, 3),
    (6, 4, 4, 2),
    (7, 4, 5, 2),
    (8, 5, 5, 5),
    (9, 5, 1, 10),
    (10, 5, 2, 5),
    (11, 7, 1, 10),
    (12, 7, 5, 10);


CREATE TABLE qq.employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

CREATE TABLE qq.departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO qq.departments (department_id, department_name)
VALUES (1, 'Marketing'), (2, 'Sales'), (3, 'HR'), (6, 'Engineering');

INSERT INTO qq.employees (employee_id, first_name, last_name, department_id)
VALUES 
    (1, 'John', 'Doe', 1),
    (2, 'Jane', 'Smith', 2),
    (3, 'Mary', 'Johnson', 3),
    (4, 'James', 'Brown', 4),
    (5, 'Emily', 'Davis', 1),
    (6, 'Michael', 'Miller', 2),
    (7, 'Sarah', 'Wilson', 3),
    (8, 'David', 'Moore', 4);


CREATE TABLE qq.random_numbers(
rdn_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
number double(16,7)
);

INSERT INTO qq.random_numbers(number)
VALUES
	( rand() * 1000000000 );


CREATE TABLE qq.customer_address(
ca_id int not null auto_increment primary key,
customer_id varchar(50),
address varchar(50),
city varchar(50),
country varchar(50)
);

-- item ca_id=6 duplicado propositalmente
insert into qq.customer_address (ca_id, customer_id, address, country, city)
values
	(1, 1, 'Rua João Felipe, 555', 'Berlin', 'Germany'),
	(2, 2, 'Rua Marquês de Sapucaí, 222', 'Mexico', 'Mexico D.F.'),
	(3, 3, 'Avenida Coisa Nehuma da Silva, 15', 'Mexico', 'Mexico D.F.'),
	(4, 4, 'Rua Benjamim Constant, 57', 'UK', 'London'),
	(5, 5, 'Rua da Conceição, 1522', 'Sweden',  'Luleå'),
    (6, 1, 'Rua João Felipe, 555', 'Berlin', 'Germany')