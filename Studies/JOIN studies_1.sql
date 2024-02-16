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
		orders.orderid
        , customers.country
        , Customers.CustomerName
        , orders.OrderDate
        , products.ProductName
from qq.orders
left join qq.customers
on orders.customerid = customers.customerid
inner join qq.orderdetails
on orders.orderid = orderdetails.orderid
left join qq.products
on orderdetails.productid = products.productid
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
group by customerid;



-- 8. Quais fornecedores fornecem produtos para pedidos feitos por clientes no 'UK'?
select
	distinct suppliers.SupplierName
from qq.orders

left join qq.customers
on orders.customerid = customers.customerid

left join qq.orderdetails
on orders.orderid = orderdetails.orderid

inner join qq.products
on orderdetails.productid = products.productid

left join qq.suppliers
on products.supplierid = suppliers.supplierid

where customers.country = 'UK';

-- 9. Quanto cada cliente gastou?

select
	distinct customers.customername
    , sum(orderdetails.Quantity * products.price) as total_NR
from qq.orders
left join qq.customers
on orders.customerid = customers.customerid
left join qq.orderdetails
on orders.orderid = orderdetails.orderid
left join qq.products
on orderdetails.productid = products.productid
group by 1
order by 1