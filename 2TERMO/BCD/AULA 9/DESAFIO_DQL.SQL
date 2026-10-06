-- Active: 1791283836970@@127.0.0.1@3308@smartcoffee_dml_manu

-- AULA_09_-_DQL_CONSULTAS_ATIVIDADE_SQL.sql

-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: _______________________________________________
-- Turma: ______________________ Data: _________________
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dml_manu;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT nome
FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email 
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade 
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco
FROM produtos 
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco
FROM produtos 
ORDER BY preco DESC LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produtos 
WHERE preco BETWEEN 8.00 AND 15.00

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM clientes 
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome_produto
FROM produtos 
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, cidade, email
FROM clientes 
WHERE telefone IS NULL OR telefone = '';

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT id_pedido, data_pedido, valor_total
FROM pedidos
WHERE status = 'FINALIZADO' AND valor_total > 20.00
ORDER BY valor_total DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS quantidade_produtos FROM produtos;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    AVG(preco) AS preco_medio
FROM produtos;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT nome,
COALESCE(SUM(valor_total), 0) AS faturamento_total
FROM pedidos
WHERE status = 'FINALIZADO';


