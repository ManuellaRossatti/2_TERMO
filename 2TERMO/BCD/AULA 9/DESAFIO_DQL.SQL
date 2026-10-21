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
FROM produto 
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco
FROM produto
ORDER BY preco DESC LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome_produto
FROM produto
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, cidade, email
FROM cliente
WHERE telefone IS NULL OR telefone = '';

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status = 'FINALIZADO' AND valor_total > 20.00
ORDER BY valor_total DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS quantidade_produto FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    AVG(preco) AS preco_medio
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS quantidade_cliente
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS quantidade_cliente
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT nome,
COALESCE(SUM(valor_total), 0) AS faturamento_total
FROM pedido
WHERE status = 'FINALIZADO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE
WHERE P.STATUS = 'FINALIZADO' 

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA, PR.PRECO 
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA 
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA 
ORDER BY CA.NOME, PR.NOME;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C 
LEFT JOIN PEDIDO AS P
ON P.id_cliente = C.id_cliente
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME 
FROM CLIENTE AS C 
LEFT JOIN PEDIDO AS P
ON P.id_cliente = C.id_cliente
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C 
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.id_cliente
WHERE P.STATUS = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.nome
ORDER BY TOTAL_COMPRADO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT NOME, PRECO 
FROM PRODUTO 
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO)
ORDER BY PRECO DESC;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT NOME, PRECO 
FROM PRODUTO 
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO)
ORDER BY PRECO DESC;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT NOME, PRECO,
CASE 
WHEN PRECO < 8.00 THEN  'ECONÔMICO'
WHEN PRECO <= 15.00 THEN  'INTERMEDIÁRIO'
ELSE 'PREMIUM'
END AS CLASSIFICAÇÃO_PREÇOS
FROM PRODUTO 
ORDER BY PRECO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
-- QUAL TOTAL PAGO POR CLIENTE E SEUS PEDIDOS FAVORITOS
-- Por que essa informação é útil?
-- PARA SABER QUAIS OS CLIENTES MAIS FIÉIS E QUANTO GANHAMOS COM CADA UM. ALÉM DISSO, SABER QUAIS OS PRODUTOS MAIS PEDIDOS É IMPORTANTE PARA FAZER O PEDIDO DE FORNECIMENTO DAQUELE PRODUTO PARA QUE NUNCA FALTE. 
-- Consulta: 
SELECT C.NOME AS CLIENTE, COUNT(DISTINCT P.ID_PEDIDO) AS QTDE_PEDIDOS, PR.NOME AS PRODUTO,  SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO 
FROM CLIENTE AS C 
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.id_cliente 
INNER JOIN ITEM_PEDIDO AS IP 
ON IP.ID_PEDIDO = P.ID_PEDIDO 
INNER JOIN PRODUTO AS PR 
ON PR.NOME = PR.NOME
WHERE P.STATUS = 'FINALIZADO' 
GROUP BY C.ID_CLIENTE, C.NOME, PR.NOME
ORDER BY TOTAL_COMPRADO DESC;
