-- Nome e preço de todos os produtos
select ProductName, UnitPrice from Product;

select ProductName, UnitPrice 
from Product
order by UnitPrice desc;

-- Produtos com mais de 20 unidades no estoque e custam mais de 50 reais
select ProductName, UnitPrice, UnitsInStock 
from Product p
where UnitsInStock > 20
and UnitPrice > 50;

-- Valor total vendido por produto
select ProductId, sum(UnitPrice * Quantity) as valorTotal
from OrderDetail
group by ProductId
order by valorTotal;

-- Valor médio dos pedidos
select avg(UnitPrice * Quantity) as valorMedio
from OrderDetail;

-- Conectar Product com Categoria
select * from Product;

select Product.ProductName, Product.CategoryId, Category.CategoryName
from Product
inner join Category
	on Product.CategoryId = Category.Id
order by Category.CategoryName;

-- Três categorias de produtos que mais geraram receitas
select c.CategoryName, sum(od.UnitPrice * od.Quantity) as valorTotal
from OrderDetail od
inner join Product p
    on od.ProductId = p.Id
inner join Category c
    on p.CategoryId = c.Id
group by c.CategoryName
order by valorTotal desc
limit 3;
