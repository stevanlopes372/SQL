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
    (6, 5, '1996-07-09')
    ;

CREATE TABLE qq.Products (
    ProductID int PRIMARY KEY,
    ProductName varchar(255),
    SupplierID int,
    CategoryID int,
    Unit varchar(255),
    Price decimal
);

INSERT INTO qq.Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES 
    (1, 'Chai', 1, 1, '10 boxes x 20 bags', 18),
    (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19),
    (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
    (4, 'Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22),
    (5, 'Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', 21.35);


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
    (10, 5, 2, 5);


-- 1. Quais são os nomes dos clientes que fizeram um pedido?
select 
	customers.CustomerID
    , customers.customername
    , orders.OrderID
from qq.customers
inner join qq.orders
on customers.customerID = orders.customerid;



-- 2. Para cada pedido, qual é o nome do cliente e a data do pedido?
select
	customers.customername
    , customers.customerid
    , orders.OrderDate
    , orders.orderid
from qq.orders
left join qq.customers
on orders.customerid = customers.customerid;


-- 3. Quais são os produtos fornecidos pelo fornecedor 1?
select
	products.ProductID
    , products.ProductName
    , products.SupplierID
    , suppliers.suppliername
from qq.products
left join qq.suppliers
on products.supplierid = suppliers.supplierid
where products.supplierid = 1;



-- 4. Quais são os nomes dos clientes que fizeram um pedido após a data '1996-07-06'?
select
	orders.OrderID
    , orders.CustomerID
    , customers.customername
    , orders.OrderDate
from qq.orders
left join qq.customers
on orders.customerid = customers.customerid
where orders.orderdate > '1996-07-06';


-- 5. Para cada pedido feito por clientes do 'Mexico', qual é o nome do cliente, a data do pedido e o nome do produto?
select
	orders.CustomerID
    , customers.customername
    , orders.OrderDate
    , products.productname
from qq.orders

left join qq.customers
on orders.customerid = customers.customerid

left join qq.products
on orders.customerid = products.
FALTA TERMINAR
;



-- 6. Quantos pedidos cada cliente fez? Liste os clientes e o número de pedidos.
select
	distinct orders.CustomerID
    , customers.customername
    , count(*) as Qty_orders
from qq.orders
left join qq.customers
on orders.customerid = customers.customerid
group by 1;


-- 7. Qual é o valor total de todos os pedidos de cada cliente?
with a as (
	select
    orders.customerid
    , customers.customername
    , orderdetails.orderid
    , orderdetails.productid
    , quantity
    , products.price
    , quantity * products.price as total
    from qq.orderdetails
    left join qq.products
    on orderdetails.productid = products.ProductID
    left join qq.orders
    on orderdetails.orderid = orders.orderid
    left join qq.customers
    on orders.customerid = customers.customerid
)

select
	distinct customerid
    , customername
    , sum(total)
from a
group by customerid



-- 8. Quais fornecedores fornecem produtos para pedidos feitos por clientes no 'UK'?