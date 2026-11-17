-- Active: 1794936279300@@127.0.0.1@3308@smartcoffee_manu
-- BLOCO 4:
SELECT id_produto, nome, preco 
FROM produto;

SELECT nome, preco 
FROM produto
WHERE preco > 15.00 
ORDER BY preco ASC;

SELECT p.nome AS produto, p.preco, c.nome AS categoria
FROM produto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria;

SELECT c.nome AS categoria, COUNT(p.id_produto) AS total_produtos
FROM categoria c
LEFT JOIN produto p ON c.id_categoria = p.id_categoria
GROUP BY c.nome;

SELECT cl.id_cliente, cl.nome, cl.email
FROM cliente cl
LEFT JOIN pedido pe ON cl.id_cliente = pe.id_cliente
WHERE pe.id_pedido IS NULL;

INSERT INTO produto (nome, preco, id_categoria)
VALUES ('Cappuccino Cremoso', 14.50, 1);

UPDATE produto
SET preco = 16.00
WHERE id_produto = 5;
