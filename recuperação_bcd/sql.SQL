/*SmartCoffee
Criação da tabela PRODUTO com integridade referencial e regras*/

-- Garante que a tabela anterior seja removida caso já exista (opcional para testes)
-- DROP TABLE IF EXISTS PRODUTO;

CREATE TABLE PRODUTO (
-- Chave Primária (PK): Identifica unicamente cada registro na tabela
id_produto INT AUTO_INCREMENT PRIMARY KEY,

-- Chave Estrangeira (FK): Relaciona o produto a uma categoria existente
id_categoria INT NOT NULL,

-- Nome obrigatório do produto no cardápio
nome VARCHAR(100) NOT NULL,

-- Descrição detalhada (campo opcional, aceita valores nulos)
descricao TEXT,

-- Preço com 2 casas decimais; não pode ser nulo e deve ser maior que zero
preco_venda DECIMAL(10, 2) NOT NULL,

-- Quantidade em estoque; começa em 0 por padrão e não aceita saldo negativo
estoque_atual INT NOT NULL DEFAULT 0,

-- Define se o item aparece ativo no totem/sistema (TRUE = ativo, FALSE = inativo)
ativo BOOLEAN NOT NULL DEFAULT TRUE,

-- Chave Primária (PK): Identifica unicamente cada produto
PRIMARY KEY (id_produto),

-- Chave Estrangeira (FK): Liga esta tabela à tabela CATEGORIA
FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)

