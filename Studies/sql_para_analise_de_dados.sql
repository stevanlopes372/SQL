/*markdown
Estudos baseados no livro 'SQL para Análise de Dados' de Cathy Tanimura <br>
A base de dados usado nesse estudo pode ser encontrado no arquivo 'database example.sql' <br>
Estudo feito usando VS Code + extensão SQL Notebook (https://marketplace.visualstudio.com/items?itemName=cmoog.sqlnotebook) 
*/

/*markdown
# Discretização (Binning)
Binning na coluna Price da tabela products
*/

-- etapa 1 - entendendo os dados
SELECT 
   COUNT(price) as total_rows,
   AVG(price) as average,
   MIN(price) as min,
   MAX(price) as max,
   SUM(price) as sum
FROM 
   qq.Products;

-- Fazendo a discretização com um bin de tamanho fixo 10
select
	distinct bin_price,
    count(*) as zzz
from
(select
	case
		when price <= 10 then '00 to 10'
		when price <= 20 then '11 to 20'
        when price <= 30 then '21 to 30'
        else 'above 30'
	end as bin_price
from qq.products) a
group by 1
order by 1;

-- Fazendo bin por arredondamento
	-- útil para bins da mesma largura
    -- testando round(value, number_of_decimals_place)
    select round(number,-3) from qq.random_numbers;
    
    -- testando bin com round
    select round(number, -8) as bin_number
		, count(number)
    from qq.random_numbers
    group by 1
    order by 1;

-- Fazendo bin por log
	-- testando log(argument)
    select number, log(number) from qq.random_numbers;

	-- testando bin com log
    select log(number)
		, count(number)
	from qq.random_numbers
    group by 1
    order by 1
    -- log não é numero inteiro, por isso ficou zuadão
    ;
    
    -- testando arredondando os números da tabela
    select log(number)
		, count(number)
	from(
		select round(number) from qq.random_numbers
    )
    group by 1
    order by 1
    -- o que não adiantou bosta nenhuma
    ;

	-- testando arredondando o log
    select round(log(number))
		, count(number)
    from qq.random_numbers
    group by 1
    order by 1
    -- resultado de demonstrou satisfatório
;

-- Detectando duplicidades
select customer_id, address, city, country, count(*) as records
from qq.customer_address
group by 1,2,3,4;


-- no exemplo acima são poucos dados. Se vc tiver muitos dados pode-se usar:
select customer_id, address, city, country, count(*) as records
from qq.customer_address
group by 1,2,3,4
having records > 1;

-- para exibir o total de registros duplicados:
select count(*) as records_with_more_than_one_register
from (
select customer_id, address, city, country, count(*) as records
from qq.customer_address
group by 1,2,3,4
having records > 1
) a;


-- Windows Function
-- sobre o total vendido
SELECT 
	*
	, sum(total) over(partition by productname) as total_por_produto
	, sum(total) over() as total_geral
    , (sum(total) over(partition by productname) / sum(total) over())*100 as participação_por_produto
    , (sum(total) over(partition by orderID) / sum(total) over())*100 as participação_por_order
from produtos_vendidos
;