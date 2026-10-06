 -- Active: 1791283836970@@127.0.0.1@3308@smartcoffee_dml_manu
 INSERT INTO cliente (nome,email,telefone.cidade,ativo) VALUES
    ('Manuella Rossatt', 'manuella@email.com','1999812131','Limeira',TRUE);
    -- CONSULTAS COM SELECT
    -- ESTRUTURA DE CONSTRUÇÃO DO SELECT
    -- SLEECT coluna
    -- FROM tabela;

    --EX 1: SELECT PARA TODAS AS COLUNAS
    SELECT * FROM cliente;

    -- EX 2: SELECT PRO COLUNAS
    SELECT nome AS Cliente,
    telefone AS Contato
    FROM cliente;

SELECT nome AS Cliente,
    ativo AS Status
    FROM cliente;

SELECT nome, preco, preco * 0.80 AS preco_promocao
    FROM produto; 4ms
    