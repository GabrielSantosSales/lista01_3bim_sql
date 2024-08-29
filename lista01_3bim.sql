-- Escreva uma consulta SQL que retorne o ID do pedido, a data do pedido, o nome completo do cliente e o email para todos os pedidos. Use um JOIN para combinar as tabelas Orders e Customers.

select 
	order_id,
    order_date,
    first_name,
    last_name,
    email
from customers
inner join orders
on customers.customer_id = orders.customer_id;


-- nome do produto e a quantidade pedida para todos os produtos pedidos por um cliente com um customer_id específico (por exemplo, customer_id = 1). Essa consulta deve combinar as tabelas Order_Items, Orders e Products.

select 
	product_name,
    quantity
from order_items
inner join order_items
on order_items.product_id = products.product_id
inner join orders
on  orders.order_id = order_items.order_id
inner join customers
on customers.customer_id = orders.customer_id
where costumer_id = 1;

SELECT products.product_name, order_items.quantity
FROM order_items
INNER JOIN order_items
ON products.product_id = order_items.product_id
INNER JOIN orders
ON order_items.order_id = orders.order_id
WHERE order_items.customer_id = customers.customer_id