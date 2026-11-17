-- Active: 1794936279300@@127.0.0.1@3308@smartcoffee_manu
-- Active: 1794936279300@@127.0.0.1@3308@mysql
DROP DATABASE IF EXISTS smartcoffee_manu;
CREATE DATABASE smartcoffee_manu;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria 
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);



INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Raymond Reddington', 'redd@email.com', '19999990001', 'São Paulo', TRUE),
('Michael Jackson', 'mike@email.com', '19999990002', 'São Paulo', TRUE),
('Tobias Forge', 'ghostband@email.com', NULL, 'São Paulo', TRUE),
('Terzo', 'terzo@email.com', '19999990004', 'Campinas', TRUE),
('Ana Renault', 'renault@email.com', NULL, 'Limeira', TRUE),
('Gerard Way', 'mychemicalromance@email.com', '19999990006', 'Americana', TRUE),
('Vladmir Lenin', 'bolchevique@email.com', '19999990007', 'São Paulo', TRUE),
('Karl Marx', 'comunista@email.com', NULL, 'Limeira', FALSE),
('Manuella Rossatt', 'manurossatt@email.com', '19999990009', 'São Paulo', TRUE),
('Ana Laura', 'sociologa@email.com', '19999990010', 'São Paulo', TRUE);

INSERT INTO categoria (nome) VALUES
('Café'), ('Bebida Gelada'), ('Doce'), ('Salgado'), ('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Espresso', 7.00, TRUE, 1), 
('Café Duplo', 10.00, TRUE, 1),
('Café com Leite', 9.50, TRUE, 1), 
('Cappuccino', 13.00, TRUE, 1),
('Mocha Chocolate', 15.50, TRUE, 1), 
('Cold Brew', 14.00, TRUE, 2),
('Frappé de Chocolate', 18.00, TRUE, 2), 
('Suco de Laranja', 11.00, TRUE, 2),
('Brownie', 9.00, TRUE, 3), 
('Cheesecake', 14.50, TRUE, 3),
('Cookie de Chocolate', 7.50, TRUE, 3), 
('Pão de Queijo', 6.50, TRUE, 4),
('Croissant', 12.00, TRUE, 4), 
('Sanduíche', 16.00, TRUE, 4),
('Combo Café + Pão de Queijo', 12.50, TRUE, 5),
('Combo Cappuccino + Brownie', 20.00, TRUE, 5), 
('Torta Especial', 22.00, FALSE, 3);

SELECT 'Base smartcoffee_dml criada com sucesso.' AS mensagem;