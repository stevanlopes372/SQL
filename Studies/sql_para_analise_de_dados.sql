-- Estudos baseados no livro 'SQL para Análise de Dados' de Cathy Tanimura
-- A base de dados usado nesse estudo pode ser encontrado no arquivo 'database example.sql'

-- Discretização (Binning)
-- Binning na coluna Price da tabela products

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
	distinct bin,
    count(*) as zzz
from
(select
	case
		when price <= 10 then '00 to 10'
		when price <= 20 then '11 to 20'
        when price <= 30 then '21 to 30'
        else 'above 30'
	end as bin
from qq.products) a
group by 1
order by 1;

-- Fazendo bin por arredondamento


-- Fazendo bin po log