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
inner join products
on order_items.product_id = products.product_id
inner join orders
on  orders.order_id = order_items.order_id
inner join customers
on customers.customer_id = orders.customer_id
where customers.customer_id = 1;

-- Exercício 3: Calcular o total gasto por cada cliente

-- Escreva uma consulta SQL que calcule o total gasto por cada cliente. O resultado deve incluir o nome completo do cliente e o total gasto. Essa consulta deve usar JOINs para combinar as tabelas Customers, Orders, Order_Items e Products, e deve usar uma função de agregação para calcular o total.

select customers.first_name, customers.last_name, sum(products.price)
from order_items
left join products on products.product_id = order_items.product_id
left join orders on orders.order_id = order_items.order_id
left join customers on customers.customer_id = orders.customer_id
group by customers.customer_id;

-- diff

select customers.first_name, customers.last_name, sum(products.price)
from customers
left join orders on customers.customer_id = orders.order_id
left join order_items on orders.order_id = order_items.order_id
left join products on order_items.product_id = products.product_id
group by customers.customer_id;

-- Exercício 4: Encontrar os clientes que nunca fizeram um pedido

-- Escreva uma consulta SQL que retorne os nomes dos clientes que nunca fizeram um pedido. Para isso, use um LEFT JOIN entre as tabelas Customers e Orders e filtre os resultados para encontrar clientes sem pedidos.

select first_name, last_name, orders.order_id
from customers
left join orders on orders.customer_id = customers.customer_id;

-- Exercício 5: Listar os produtos mais vendidos

-- nome do produto e a quantidade total vendida, ordenando os resultados pelos produtos mais vendidos. Combine as tabelas Order_Items e Products, e utilize uma função de agregação para somar a quantidade vendida de cada produto.

select products.product_name, sum(quantity) from order_items
inner join products on products.product_id = order_items.product_id
group by product_name
order by sum(quantity) desc;