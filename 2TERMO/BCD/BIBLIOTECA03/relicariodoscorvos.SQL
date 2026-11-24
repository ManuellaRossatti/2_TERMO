-- Active: 1794936279300@@127.0.0.1@3308@relicario_dos_corvos
DROP DATABASE IF EXISTS RELICARIO_DOS_CORVOS;

CREATE DATABASE IF NOT EXISTS RELICARIO_DOS_CORVOS;


USE RELICARIO_DOS_CORVOS;


----------------------------------------------------------------------------------

CREATE TABLE USUARIO (
    ID_USUARIO INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,

    CONSTRAINT PK_ID_USUARIO PRIMARY KEY (ID_USUARIO),
    CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
);

CREATE TABLE IF NOT EXISTS LIVRO (
    ID_LIVRO INT AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    AUTOR VARCHAR(120) NOT NULL,
    ISBN CHAR(13) NOT NULL,
    ANO_PUBLICACAO INT,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0 CHECK (QUANTIDADE_DISPONIVEL >= 0),

    CONSTRAINT PK_LIVRO PRIMARY KEY (ID_LIVRO),
    CONSTRAINT UQ_ISBN UNIQUE (ISBN)
);

CREATE TABLE EMPRESTIMO (
    ID_EMPRESTIMO INT AUTO_INCREMENT,
    DATA_EMPRESTIMO DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE,
    STATUS_EMPRESTIMO VARCHAR(20) DEFAULT 'ABERTO' CHECK (STATUS_EMPRESTIMO IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    ID_USUARIO INT NOT NULL,
    ID_LIVRO INT NOT NULL,

    CONSTRAINT PK_EMPRESTIMO PRIMARY KEY (ID_EMPRESTIMO),
    CONSTRAINT FK_EMPRESTIMO_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
    CONSTRAINT FK_EMPRESTIMO_LIVRO FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID_LIVRO)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    ID_LIVRO INT NOT NULL,

    CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CATEGORIA),
    CONSTRAINT UQ_CATEGORIA_NOME UNIQUE (NOME),
    CONSTRAINT FK_CATEGORIA_LIVRO FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID_LIVRO)
);

CREATE TABLE NIVEL_PLANETA (
    ID_NIVEL INT AUTO_INCREMENT,
    NOME_PLANETA VARCHAR(30) NOT NULL,
    PONTOS_MINIMOS INT NOT NULL CHECK (PONTOS_MINIMOS >= 0),
    PONTOS_MAXIMOS INT NULL,
    BONUS_EMPRESTIMO INT DEFAULT 0 CHECK (BONUS_EMPRESTIMO >= 0),

    CONSTRAINT PK_NIVEL PRIMARY KEY (ID_NIVEL),
    CONSTRAINT UQ_NOME_PLANETA UNIQUE (NOME_PLANETA)
);

CREATE TABLE SCORE (
    ID_SCORE INT AUTO_INCREMENT,
    PONTOS_ATUAIS INT DEFAULT 0 CHECK (PONTOS_ATUAIS >= 0),
    DATA_ATUALIZACAO DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_USUARIO INT NOT NULL,
    ID_NIVEL INT NOT NULL,

    CONSTRAINT PK_SCORE PRIMARY KEY (ID_SCORE),
    CONSTRAINT UQ_SCORE_USUARIO UNIQUE (ID_USUARIO),
    CONSTRAINT FK_SCORE_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
    CONSTRAINT FK_SCORE_NIVEL FOREIGN KEY (ID_NIVEL) REFERENCES NIVEL_PLANETA (ID_NIVEL)
);

-- FASE 2 - DML
INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('Raymond Reddington', 'redd@email.com', '19999990001', TRUE),
('Elizabeth Keen', 'liz.keen@fbi.gov', '19999990016', FALSE),
('Donald Ressler', 'donald.ressler@fbi.gov', '19999990017', TRUE),
('Aram Mojtabai', 'aram.mojtabai@fbi.gov', '19999990019', TRUE),
('Dembe Zuma', 'dembe.zuma@email.com', '19999990020', TRUE),
('Michael Jackson', 'mike@email.com', '19999990002', TRUE),
('Tobias Forge', 'ghostband@email.com', NULL, TRUE),
('Terzo', 'terzo@email.com', '19999990004', TRUE),
('Ana Renault', 'renault@email.com', NULL, TRUE),
('Gerard Way', 'mychemicalromance@email.com', '19999990006', TRUE),
('Vladmir Lenin', 'bolchevique@email.com', '19999990007', TRUE),
('Karl Marx', 'comunista@email.com', NULL, FALSE),
('Manuella Rossatt', 'manurossatt@email.com', '19999990009', TRUE),
('Ana Laura', 'sociologa@email.com', '19999990010', TRUE),
('Patrick Jane', 'patrick.jane@cbi.gov', '19999990011', TRUE),
('Teresa Lisbon', 'teresa.lisbon@cbi.gov', '19999990012', TRUE),
('Kimball Cho', 'kimball.cho@cbi.gov', '19999990013', TRUE),
('Wayne Rigsby', 'wayne.rigsby@cbi.gov', '19999990014', TRUE),
('Grace Van Pelt', 'grace.vanpelt@cbi.gov', '19999990015', TRUE),
('Red John', 'redjohn@email.com', NULL, FALSE),
('Jon Snow', 'jonsnow@patrulha.com', '19999990021', TRUE),
('Daenerys Targaryen', 'khaleesi@dragons.com', '19999990022', FALSE),
('Tyrion Lannister', 'tyrion@casterlyrock.com', '19999990023', TRUE),
('Arya Stark', 'ninguem@braavos.com', '19999990024', TRUE),
('Cersei Lannister', 'cersei@kingslanding.com', '19999990025', FALSE),
('Sansa Stark', 'sansa@winterfell.com', '19999990026', TRUE),
('Jaime Lannister', 'regicida@kingslanding.com', '19999990027', FALSE),
('Eddard Stark', 'ned@winterfell.com', NULL, FALSE),
('Eleven', 'onze@hawkins.com', '19999990028', TRUE),
('Mike Wheeler', 'mike.wheeler@hawkins.com', '19999990029', TRUE),
('Dustin Henderson', 'dustin@hawkins.com', '19999990030', TRUE),
('Lucas Sinclair', 'lucas@hawkins.com', '19999990031', TRUE),
('Will Byers', 'will@mundoinvertido.com', '19999990032', TRUE),
('Max Mayfield', 'madmax@hawkins.com', '19999990033', TRUE),
('Jim Hopper', 'xerife.hopper@hawkins.gov', '19999990034', TRUE),
('Steve Harrington', 'steve.cabelo@scoops.com', '19999990035', TRUE),
('Eddie Munson', 'eddie@hellfireclub.com', NULL, FALSE),
('Viktor Hargreeves', 'viktor@umbrella.com', '19999990036', TRUE),
('Luther Hargreeves', 'numero1@umbrella.com', '19999990037', TRUE),
('Diego Hargreeves', 'numero2@umbrella.com', '19999990038', TRUE),
('Allison Hargreeves', 'numero3@umbrella.com', '19999990039', TRUE),
('Klaus Hargreeves', 'numero4@umbrella.com', '19999990040', TRUE),
('Five Hargreeves', 'numero5@comissao.com', '19999990041', TRUE),
('Ben Hargreeves', 'numero6@umbrella.com', NULL, FALSE),
('Loki Laufeyson', 'deusdatrapaca@asgard.com', '19999990042', TRUE),
('Tony Stark', 'ironman@starkindustries.com', '19999990043', FALSE),
('Sasuke Uchiha', 'sasuke@konoha.com', '19999990044', TRUE),
('Roronoa Zoro', 'zoro@chapeusdepalha.com', '19999990045', TRUE),
('Shiryu de Dragão', 'shiryu@rozan.com', '19999990046', TRUE),
('Hyoga de Cisne', 'hyoga@siberia.com', '19999990047', TRUE),
('Shun de Andrômeda', 'shun@ilhaandro.com', '19999990048', TRUE),
('Ikki de Fênix', 'ikki@ilhadarainha.com', '19999990049', TRUE),
('Mu de Áries', 'mu@jamiel.com', '19999990050', TRUE),
('Aldebaran de Touro', 'aldebaran@santuario.com', '19999990051', TRUE),
('Saga de Gêmeos', 'saga@santuario.com', '19999990052', TRUE),
('Kanon de Gêmeos', 'kanon@dragao-marinho.com', '19999990053', TRUE),
('Máscara da Morte de Câncer', 'deathmask@santuario.com', '19999990054', FALSE),
('Aiolia de Leão', 'aiolia@santuario.com', '19999990055', TRUE),
('Shaka de Virgem', 'shaka@santuario.com', '19999990056', TRUE),
('Dohko de Libra', 'mestreanciao@rozan.com', '19999990057', TRUE),
('Milo de Escorpião', 'milo@santuario.com', '19999990058', TRUE),
('Aiolos de Sagitário', 'aiolos@santuario.com', NULL, FALSE),
('Shura de Capricórnio', 'shura@santuario.com', '19999990059', TRUE),
('Camus de Aquário', 'camus@santuario.com', '19999990060', TRUE),
('Afrodite de Peixes', 'afrodite@santuario.com', '19999990061', FALSE),
('Saori Kido (Atena)', 'atena@santuario.com', '19999990062', TRUE),
('Julian Solo (Poseidon)', 'poseidon@atlantida.com', '19999990063', TRUE),
('Hades', 'hades@submundo.com', NULL, FALSE);

INSERT INTO LIVRO (TITULO, AUTOR, ISBN, ANO_PUBLICACAO, QUANTIDADE_DISPONIVEL) VALUES
('Memórias do Subsolo', 'Fiódor Dostoiévski', '9788573261523', 1864, 18),
('Crime e Castigo', 'Fiódor Dostoiévski', '9788573266467', 1866, 15),
('Os Irmãos Karamázov', 'Fiódor Dostoiévski', '9788573264098', 1880, 10),
('O Idiota', 'Fiódor Dostoiévski', '9788573262360', 1869, 12),
('Os Demônios', 'Fiódor Dostoiévski', '9788573265255', 1872, 9),
('Noites Brancas', 'Fiódor Dostoiévski', '9788573263114', 1848, 22),
('Guerra e Paz', 'Liev Tolstói', '9788535930047', 1869, 8),
('Anna Kariênina', 'Liev Tolstói', '9788535929225', 1877, 14),
('A Morte de Ivan Ilitch', 'Liev Tolstói', '9788573263565', 1886, 20),
('Ressurreição', 'Liev Tolstói', '9788573264791', 1899, 11),
('O Mestre e Margarida', 'Mikhail Bulgákov', '9788535929447', 1967, 13),
('Almas Mortas', 'Nikolai Gógol', '9788573263978', 1842, 10),
('A Dama do Cachorrinho e Outros Contos', 'Anton Tchékhov', '9788573261233', 1899, 16),
('Ideias para Adiar o Fim do Mundo', 'Ailton Krenak', '9788535932416', 2019, 25),
('A Vida Não é Útil', 'Ailton Krenak', '9788535933703', 2020, 20),
('Futuro Ancestral', 'Ailton Krenak', '9786559211548', 2022, 18),
('A Queda do Céu', 'Davi Kopenawa e Bruce Albert', '9788535926200', 2015, 10),
('Meu Avô Apolinário', 'Daniel Munduruku', '9788532266811', 2001, 15),
('Coisas de Índio', 'Daniel Munduruku', '9788574161075', 2000, 14),
('A Terra dos Mil Povos', 'Kaká Werá', '9788575962657', 1998, 12),
('O Karaíba', 'Daniel Munduruku', '9788576669203', 2010, 16),
('Quarto de Despejo: Diário de uma Favelada', 'Carolina Maria de Jesus', '9788508171279', 1960, 30),
('Casa de Alvenaria', 'Carolina Maria de Jesus', '9786556401782', 1961, 15),
('Capão Pecado', 'Ferréz', '9788573026856', 2000, 18),
('Manual Prático do Ódio', 'Ferréz', '9788573025613', 2003, 14),
('Olhos d''Água', 'Conceição Evaristo', '9788534705219', 2014, 22),
('Ponciá Vicêncio', 'Conceição Evaristo', '9788534705158', 2003, 19),
('Becos da Memória', 'Conceição Evaristo', '9788534705165', 2006, 17),
('Torto Arado', 'Itamar Vieira Junior', '9786580309313', 2019, 26),
('Salvar o Fogo', 'Itamar Vieira Junior', '9786580309566', 2023, 20),
('Cidade de Deus', 'Paulo Lins', '9788535902730', 1997, 15),
('Sobrevivendo no Inferno', 'Racionais MC''s', '9788535931730', 2018, 28),
('Úrsula', 'Maria Firmina dos Reis', '9788582850695', 1859, 16),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', '9788535910667', 1881, 24),
('Dom Casmurro', 'Machado de Assis', '9788525406262', 1899, 25),
('Quincas Borba', 'Machado de Assis', '9788525406781', 1891, 18),
('O Alienista', 'Machado de Assis', '9788535910711', 1882, 22),
('Grande Sertão: Veredas', 'João Guimarães Rosa', '9788535931983', 1956, 12),
('Sagarana', 'João Guimarães Rosa', '9788520933343', 1946, 15),
('Vidas Secas', 'Graciliano Ramos', '9788501012074', 1938, 21),
('São Bernardo', 'Graciliano Ramos', '9788501012081', 1934, 16),
('A Hora da Estrela', 'Clarice Lispector', '9788532508126', 1977, 23),
('Perto do Coração Selvagem', 'Clarice Lispector', '9788532508119', 1943, 17),
('Capitães da Areia', 'Jorge Amado', '9788535911695', 1937, 25),
('O Cortiço', 'Aluísio Azevedo', '9788508151172', 1890, 20),
('Triste Fim de Policarpo Quaresma', 'Lima Barreto', '9788582850510', 1915, 19),
('Macunaíma', 'Mário de Andrade', '9788520932216', 1928, 18),
('Homem Invisível', 'Ralph Ellison', '9788503011730', 1952, 14),
('O Homem Invisível', 'H. G. Wells', '9788537806241', 1897, 16),
('1984', 'George Orwell', '9788535914849', 1949, 30),
('A Revolução dos Bichos', 'George Orwell', '9788535909555', 1945, 28),
('Admirável Mundo Novo', 'Aldous Huxley', '9788525056009', 1932, 20),
('Fahrenheit 451', 'Ray Bradbury', '9788525052247', 1953, 22),
('O Conde de Monte Cristo', 'Alexandre Dumas', '9788537808764', 1844, 12),
('Os Miseráveis', 'Victor Hugo', '9788544000014', 1862, 11),
('A Metamorfose', 'Franz Kafka', '9788535914856', 1915, 25),
('O Processo', 'Franz Kafka', '9788535907438', 1925, 16),
('O Estrangeiro', 'Albert Camus', '9788501012098', 1942, 19),
('Cem Anos de Solidão', 'Gabriel García Márquez', '9788501012104', 1967, 21),
('Ensaio sobre a Cegueira', 'José Saramago', '9788535900057', 1995, 18),
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', '9788598078397', 2005, 30),
('Percy Jackson e o Mar de Monstros', 'Rick Riordan', '9788598078410', 2006, 28),
('Percy Jackson e a Maldição do Titã', 'Rick Riordan', '9788598078557', 2007, 26),
('Percy Jackson e a Batalha do Labirinto', 'Rick Riordan', '9788598078724', 2008, 25),
('Percy Jackson e o Último Olimpiano', 'Rick Riordan', '9788580570083', 2009, 27);

ALTER TABLE CATEGORIA DROP INDEX UQ_CATEGORIA_NOME;
INSERT INTO CATEGORIA (NOME, ID_LIVRO) VALUES
-- IDs 1 a 13: Clássicos Russos
('CLÁSSICO RUSSO', 1),  -- Memórias do Subsolo
('CLÁSSICO RUSSO', 2),  -- Crime e Castigo
('CLÁSSICO RUSSO', 3),  -- Os Irmãos Karamázov
('CLÁSSICO RUSSO', 4),  -- O Idiota
('CLÁSSICO RUSSO', 5),  -- Os Demônios
('CLÁSSICO RUSSO', 6),  -- Noites Brancas
('CLÁSSICO RUSSO', 7),  -- Guerra e Paz
('CLÁSSICO RUSSO', 8),  -- Anna Kariênina
('CLÁSSICO RUSSO', 9),  -- A Morte de Ivan Ilitch
('CLÁSSICO RUSSO', 10), -- Ressurreição
('CLÁSSICO RUSSO', 11), -- O Mestre e Margarida
('CLÁSSICO RUSSO', 12), -- Almas Mortas
('CLÁSSICO RUSSO', 13), -- A Dama do Cachorrinho e Outros Contos
-- IDs 14 a 21: Literatura Indígena
('LITERATURA INDÍGENA', 14), -- Ideias para Adiar o Fim do Mundo
('LITERATURA INDÍGENA', 15), -- A Vida Não é Útil
('LITERATURA INDÍGENA', 16), -- Futuro Ancestral
('LITERATURA INDÍGENA', 17), -- A Queda do Céu
('LITERATURA INDÍGENA', 18), -- Meu Avô Apolinário
('LITERATURA INDÍGENA', 19), -- Coisas de Índio
('LITERATURA INDÍGENA', 20), -- A Terra dos Mil Povos
('LITERATURA INDÍGENA', 21), -- O Karaíba
-- IDs 22 a 33: Literatura Periférica & Afro-Brasileira
('LITERATURA PERIFÉRICA', 22), -- Quarto de Despejo: Diário de uma Favelada
('LITERATURA PERIFÉRICA', 23), -- Casa de Alvenaria
('LITERATURA PERIFÉRICA', 24), -- Capão Pecado
('LITERATURA PERIFÉRICA', 25), -- Manual Prático do Ódio
('LITERATURA PERIFÉRICA', 26), -- Olhos d'Água
('LITERATURA PERIFÉRICA', 27), -- Ponciá Vicêncio
('LITERATURA PERIFÉRICA', 28), -- Becos da Memória
('LITERATURA PERIFÉRICA', 29), -- Torto Arado
('LITERATURA PERIFÉRICA', 30), -- Salvar o Fogo
('LITERATURA PERIFÉRICA', 31), -- Cidade de Deus
('LITERATURA PERIFÉRICA', 32), -- Sobrevivendo no Inferno
('LITERATURA PERIFÉRICA', 33), -- Úrsula
-- IDs 34 a 47: Clássicos Brasileiros
('CLÁSSICO BRASILEIRO', 34), -- Memórias Póstumas de Brás Cubas
('CLÁSSICO BRASILEIRO', 35), -- Dom Casmurro
('CLÁSSICO BRASILEIRO', 36), -- Quincas Borba
('CLÁSSICO BRASILEIRO', 37), -- O Alienista
('CLÁSSICO BRASILEIRO', 38), -- Grande Sertão: Veredas
('CLÁSSICO BRASILEIRO', 39), -- Sagarana
('CLÁSSICO BRASILEIRO', 40), -- Vidas Secas
('CLÁSSICO BRASILEIRO', 41), -- São Bernardo
('CLÁSSICO BRASILEIRO', 42), -- A Hora da Estrela
('CLÁSSICO BRASILEIRO', 43), -- Perto do Coração Selvagem
('CLÁSSICO BRASILEIRO', 44), -- Capitães da Areia
('CLÁSSICO BRASILEIRO', 45), -- O Cortiço
('CLÁSSICO BRASILEIRO', 46), -- Triste Fim de Policarpo Quaresma
('CLÁSSICO BRASILEIRO', 47), -- Macunaíma
-- IDs 48 a 60: Clássicos Mundiais, Ficção Científica & Distopia
('CLÁSSICO MUNDIAL', 48),   -- Homem Invisível (Ralph Ellison)
('FICÇÃO CIENTÍFICA', 49),  -- O Homem Invisível (H. G. Wells)
('DISTOPIA', 50),           -- 1984
('DISTOPIA', 51),           -- A Revolução dos Bichos
('DISTOPIA', 52),           -- Admirável Mundo Novo
('DISTOPIA', 53),           -- Fahrenheit 451
('CLÁSSICO MUNDIAL', 54),   -- O Conde de Monte Cristo
('CLÁSSICO MUNDIAL', 55),   -- Os Miseráveis
('CLÁSSICO MUNDIAL', 56),   -- A Metamorfose
('CLÁSSICO MUNDIAL', 57),   -- O Processo
('CLÁSSICO MUNDIAL', 58),   -- O Estrangeiro
('REALISMO MÁGICO', 59),    -- Cem Anos de Solidão
('DISTOPIA', 60),           -- Ensaio sobre a Cegueira
-- IDs 61 a 65: Saga Percy Jackson
('FANTASIA', 61), -- Percy Jackson e o Ladrão de Raios
('FANTASIA', 62), -- Percy Jackson e o Mar de Monstros
('FANTASIA', 63), -- Percy Jackson e a Maldição do Titã
('FANTASIA', 64), -- Percy Jackson e a Batalha do Labirinto
('FANTASIA', 65); -- Percy Jackson e o Último Olimpiano

INSERT INTO NIVEL_PLANETA (NOME_PLANETA, PONTOS_MINIMOS, PONTOS_MAXIMOS, BONUS_EMPRESTIMO) VALUES
('Mercúrio', 0, 99, 0),
('Vênus', 100, 249, 2),
('Terra', 250, 499, 4),
('Marte', 500, 899, 6),
('Júpiter', 900, 1499, 8),
('Saturno', 1500, 2299, 10),
('Urano', 2300, 3499, 12),
('Netuno', 3500, NULL, 15);

INSERT INTO SCORE (PONTOS_ATUAIS, ID_USUARIO, ID_NIVEL) VALUES
(3850, 1, 8),  -- Raymond Reddington -> Netuno (3500+)
(0,    2, 1),  -- Elizabeth Keen -> Mercúrio (bloqueada)
(620,  3, 4),  -- Donald Ressler -> Marte (500 a 899)
(1150, 4, 5),  -- Aram Mojtabai -> Júpiter (900 a 1499)
(2600, 5, 7),  -- Dembe Zuma -> Urano (2300 a 3499)
(1750, 6, 6),  -- Michael Jackson -> Saturno (1500 a 2299)
(480,  7, 3),  -- Tobias Forge -> Terra (250 a 499)
(890,  8, 4),  -- Terzo -> Marte (500 a 899)
(310,  9, 3),  -- Ana Renault -> Terra (250 a 499)
(540,  10, 4), -- Gerard Way -> Marte (500 a 899)
(1950, 11, 6), -- Vladmir Lenin -> Saturno (1500 a 2299)
(0,    12, 1), -- Karl Marx -> Mercúrio (bloqueado)
(1320, 13, 5), -- Manuella Rossatt -> Júpiter (900 a 1499)
(2450, 14, 7), -- Ana Laura -> Urano (2300 a 3499)
(3600, 15, 8), -- Patrick Jane -> Netuno (3500+)
(950,  16, 5), -- Teresa Lisbon -> Júpiter (900 a 1499)
(1600, 17, 6), -- Kimball Cho -> Saturno (1500 a 2299)
(210,  18, 2), -- Wayne Rigsby -> Vênus (100 a 249)
(740,  19, 4), -- Grace Van Pelt -> Marte (500 a 899)
(0,    20, 1), -- Red John -> Mercúrio (bloqueado)
(420,  21, 3), -- Jon Snow -> Terra (250 a 499)
(0,    22, 1), -- Daenerys Targaryen -> Mercúrio (bloqueada)
(3990, 23, 8), -- Tyrion Lannister -> Netuno (3500+)
(810,  24, 4), -- Arya Stark -> Marte (500 a 899)
(0,    25, 1), -- Cersei Lannister -> Mercúrio (bloqueada)
(1050, 26, 5), -- Sansa Stark -> Júpiter (900 a 1499)
(0,    27, 1), -- Jaime Lannister -> Mercúrio (bloqueado)
(0,    28, 1), -- Eddard Stark -> Mercúrio (bloqueado)
(180,  29, 2), -- Eleven -> Vênus (100 a 249)
(340,  30, 3), -- Mike Wheeler -> Terra (250 a 499)
(1420, 31, 5), -- Dustin Henderson -> Júpiter (900 a 1499)
(290,  32, 3), -- Lucas Sinclair -> Terra (250 a 499)
(460,  33, 3), -- Will Byers -> Terra (250 a 499)
(580,  34, 4), -- Max Mayfield -> Marte (500 a 899)
(130,  35, 2), -- Jim Hopper -> Vênus (100 a 249)
(95,   36, 1), -- Steve Harrington -> Mercúrio (0 a 99)
(0,    37, 1), -- Eddie Munson -> Mercúrio (bloqueado)
(1100, 38, 5), -- Viktor Hargreeves -> Júpiter (900 a 1499)
(150,  39, 2), -- Luther Hargreeves -> Vênus (100 a 249)
(230,  40, 2), -- Diego Hargreeves -> Vênus (100 a 249)
(670,  41, 4), -- Allison Hargreeves -> Marte (500 a 899)
(40,   42, 1), -- Klaus Hargreeves -> Mercúrio (0 a 99)
(3700, 43, 8), -- Five Hargreeves -> Netuno (3500+)
(0,    44, 1), -- Ben Hargreeves -> Mercúrio (bloqueado)
(2100, 45, 6), -- Loki Laufeyson -> Saturno (1500 a 2299)
(0,    46, 1), -- Tony Stark -> Mercúrio (bloqueado)
(850,  47, 4), -- Sasuke Uchiha -> Marte (500 a 899)
(15,   48, 1), -- Roronoa Zoro -> Mercúrio (se perdeu indo pra biblioteca!)
(1890, 49, 6), -- Shiryu de Dragão -> Saturno (1500 a 2299)
(1240, 50, 5), -- Hyoga de Cisne -> Júpiter (900 a 1499)
(980,  51, 5), -- Shun de Andrômeda -> Júpiter (900 a 1499)
(710,  52, 4), -- Ikki de Fênix -> Marte (500 a 899)
(2850, 53, 7), -- Mu de Áries -> Urano (2300 a 3499)
(640,  54, 4), -- Aldebaran de Touro -> Marte (500 a 899)
(1720, 55, 6), -- Saga de Gêmeos -> Saturno (1500 a 2299)
(910,  56, 5), -- Kanon de Gêmeos -> Júpiter (900 a 1499)
(0,    57, 1), -- Máscara da Morte de Câncer -> Mercúrio (bloqueado)
(1180, 58, 5), -- Aiolia de Leão -> Júpiter (900 a 1499)
(4100, 59, 8), -- Shaka de Virgem -> Netuno (3500+)
(0,    60, 1), -- Dohko de Libra -> Mercúrio (bloqueado)
(830,  61, 4), -- Milo de Escorpião -> Marte (500 a 899)
(0,    62, 1), -- Aiolos de Sagitário -> Mercúrio (bloqueado)
(1020, 63, 5), -- Shura de Capricórnio -> Júpiter (900 a 1499)
(2500, 64, 7), -- Camus de Aquário -> Urano (2300 a 3499)
(0,    65, 1), -- Afrodite de Peixes -> Mercúrio (bloqueado)
(3550, 66, 8), -- Saori Kido (Atena) -> Netuno (3500+)
(2900, 67, 7), -- Julian Solo (Poseidon) -> Urano (2300 a 3499)
(4500, 68, 8); -- Hades -> Netuno (3500+ - Mestre Ancião!)

INSERT INTO EMPRESTIMO (DATA_EMPRESTIMO, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_EMPRESTIMO, ID_USUARIO, ID_LIVRO) VALUES
('2026-09-10 09:30:00', '2026-10-02', '2026-09-28', 'DEVOLVIDO', 1, 54),  -- Reddington leu O Conde de Monte Cristo
('2026-09-12 14:15:00', '2026-10-04', '2026-10-01', 'DEVOLVIDO', 15, 2),  -- Patrick Jane leu Crime e Castigo
('2026-09-15 11:00:00', '2026-10-07', '2026-10-05', 'DEVOLVIDO', 23, 7),  -- Tyrion leu Guerra e Paz
('2026-09-18 16:40:00', '2026-10-05', '2026-10-02', 'DEVOLVIDO', 11, 51), -- Lenin leu A Revolução dos Bichos
('2026-09-20 10:20:00', '2026-10-09', '2026-10-08', 'DEVOLVIDO', 14, 22), -- Ana Laura leu Quarto de Despejo
('2026-09-22 15:10:00', '2026-10-07', '2026-10-04', 'DEVOLVIDO', 13, 29), -- Manuella leu Torto Arado
('2026-09-25 13:50:00', '2026-10-10', '2026-10-09', 'DEVOLVIDO', 31, 61), -- Dustin leu Percy Jackson: Ladrão de Raios
('2026-09-28 17:05:00', '2026-10-11', '2026-10-10', 'DEVOLVIDO', 33, 62), -- Will leu O Mar de Monstros
('2026-10-01 08:45:00', '2026-10-23', '2026-10-20', 'DEVOLVIDO', 43, 53), -- Five leu Fahrenheit 451
('2026-10-03 12:30:00', '2026-10-20', '2026-10-18', 'DEVOLVIDO', 45, 11), -- Loki leu O Mestre e Margarida
('2026-10-05 14:00:00', '2026-10-27', '2026-10-25', 'DEVOLVIDO', 59, 14), -- Shaka leu Ideias para Adiar o Fim do Mundo
('2026-10-07 10:10:00', '2026-10-29', '2026-10-26', 'DEVOLVIDO', 60, 17), -- Dohko leu A Queda do Céu
('2026-10-09 16:20:00', '2026-10-31', '2026-10-30', 'DEVOLVIDO', 66, 65), -- Saori (Atena) leu O Último Olimpiano
('2026-10-11 09:00:00', '2026-10-30', '2026-10-28', 'DEVOLVIDO', 67, 62), -- Poseidon leu O Mar de Monstros
('2026-10-12 11:40:00', '2026-10-27', '2026-10-24', 'DEVOLVIDO', 4, 50),  -- Aram leu 1984
('2026-10-14 15:30:00', '2026-11-02', '2026-10-31', 'DEVOLVIDO', 5, 48),  -- Dembe leu Homem Invisível
('2026-10-16 14:25:00', '2026-10-27', '2026-10-25', 'DEVOLVIDO', 9, 35),  -- Ana Renault leu Dom Casmurro
('2026-10-18 17:00:00', '2026-10-31', '2026-10-29', 'DEVOLVIDO', 10, 56), -- Gerard Way leu A Metamorfose
('2026-10-20 10:50:00', '2026-11-06', '2026-11-04', 'DEVOLVIDO', 17, 58), -- Kimball Cho leu O Estrangeiro
('2026-10-22 13:15:00', '2026-11-04', '2026-11-03', 'DEVOLVIDO', 24, 34), -- Arya leu Memórias Póstumas de Brás Cubas
('2026-11-18 10:00:00', '2026-12-10', NULL, 'ABERTO', 1, 1),   -- Reddington com Memórias do Subsolo
('2026-11-19 14:20:00', '2026-12-06', NULL, 'ABERTO', 6, 32),  -- Michael Jackson com Sobrevivendo no Inferno
('2026-11-20 09:45:00', '2026-12-03', NULL, 'ABERTO', 8, 5),   -- Terzo com Os Demônios
('2026-11-20 16:10:00', '2026-12-12', NULL, 'ABERTO', 15, 57), -- Patrick Jane com O Processo
('2026-11-21 11:30:00', '2026-12-02', NULL, 'ABERTO', 21, 40), -- Jon Snow com Vidas Secas
('2026-11-22 15:00:00', '2026-12-01', NULL, 'ABERTO', 29, 49), -- Eleven com O Homem Invisível
('2026-11-22 17:30:00', '2026-12-05', NULL, 'ABERTO', 47, 3),  -- Sasuke com Os Irmãos Karamázov
('2026-11-23 08:50:00', '2026-12-08', NULL, 'ABERTO', 50, 64), -- Hyoga com A Batalha do Labirinto
('2026-11-24 09:15:00', '2026-12-13', NULL, 'ABERTO', 64, 15), -- Camus com A Vida Não é Útil
('2026-11-18 10:15:00', '2026-12-15', NULL, 'ABERTO', 68, 9),   -- Hades com A Morte de Ivan Ilitch
('2026-10-05 11:00:00', '2026-10-12', NULL, 'ATRASADO', 2, 16),  -- Elizabeth Keen atrasada com Futuro Ancestral
('2026-10-08 15:20:00', '2026-10-15', NULL, 'ATRASADO', 20, 25), -- Red John atrasado com Manual Prático do Ódio
('2026-10-10 14:00:00', '2026-10-17', NULL, 'ATRASADO', 25, 36), -- Cersei atrasada com Quincas Borba
('2026-10-12 09:30:00', '2026-10-19', NULL, 'ATRASADO', 37, 31), -- Eddie Munson atrasado com Cidade de Deus
('2026-10-15 16:45:00', '2026-10-22', NULL, 'ATRASADO', 46, 52), -- Tony Stark atrasado com Admirável Mundo Novo
('2026-11-01 13:40:00', '2026-11-12', NULL, 'ATRASADO', 55, 4); -- Saga de Gêmeos com O Idiota 

-- Inserindo 10 novos usuários (IDs 69 a 78)
INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('Luke Skywalker', 'luke@aliancarebelde.com', '19999990064', TRUE),
('Leia Organa', 'leia@alderaan.gov', '19999990065', TRUE),
('Han Solo', 'han.solo@millennium.com', '19999990066', TRUE),
('Darth Vader', 'vader@imperio.gov', '19999990067', TRUE),
('Imperador Palpatine', 'sidious@senado.gov', '19999990068', TRUE),
('Obi-Wan Kenobi', 'ben.kenobi@tatooine.com', '19999990069', TRUE),
('Mestre Yoda', 'yoda@dagobah.org', NULL, TRUE),
('R2-D2', 'r2d2@astromech.org', NULL, TRUE),
('C-3PO', 'c3po@protocolo.org', '19999990070', TRUE),
('BB-8', 'bb8@resistencia.org', NULL, TRUE);

-- Criando o SCORE de cada um (Vader e Palpatine no topo de Netuno!)
INSERT INTO SCORE (PONTOS_ATUAIS, ID_USUARIO, ID_NIVEL) VALUES
(450,  69, 3), -- Luke Skywalker -> Terra (250 a 499)
(820,  70, 4), -- Leia Organa -> Marte (500 a 899)
(90,   71, 1), -- Han Solo -> Mercúrio (0 a 99)
(4350, 72, 8), -- Darth Vader -> Netuno (3500+)
(4950, 73, 8), -- Imperador Palpatine -> Netuno (3500+ - Poder Ilimitado!)
(2750, 74, 7), -- Obi-Wan Kenobi -> Urano (2300 a 3499)
(4800, 75, 8), -- Mestre Yoda -> Netuno (3500+)
(1900, 76, 6), -- R2-D2 -> Saturno (1500 a 2299)
(3650, 77, 8), -- C-3PO -> Netuno (3500+ - Fluente em 6 milhões de formas de leitura!)
(310,  78, 3); -- BB-8 -> Terra (250 a 499)

INSERT INTO EMPRESTIMO (DATA_EMPRESTIMO, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_EMPRESTIMO, ID_USUARIO, ID_LIVRO) VALUES
('2026-11-20 09:00:00', '2026-12-12', NULL, 'ABERTO', 72, 5),  -- Darth Vader lendo Os Demônios (Dostoiévski)
('2026-11-21 14:30:00', '2026-12-13', NULL, 'ABERTO', 73, 50), -- Palpatine lendo 1984 (George Orwell)
('2026-11-22 10:15:00', '2026-12-09', NULL, 'ABERTO', 76, 53), -- R2-D2 lendo Fahrenheit 451
('2026-11-23 11:45:00', '2026-12-15', NULL, 'ABERTO', 77, 17), -- C-3PO lendo A Queda do Céu
('2026-11-24 08:20:00', '2026-12-05', NULL, 'ABERTO', 78, 61); -- BB-8 lendo Percy Jackson e o Ladrão de Raios

INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('Vinicius', 'vinicius@email.com', '19999990071', TRUE),
('Vitória', 'vitoria@email.com', '19999990072', TRUE),
('Virgínia', 'virginia@email.com', '19999990073', TRUE),
('Letícia', 'leticia@email.com', '19999990074', TRUE);

INSERT INTO SCORE (PONTOS_ATUAIS, ID_USUARIO, ID_NIVEL) VALUES
(1250, 79, 5), -- Vinicius -> Júpiter (900 a 1499)
(2650, 80, 7), -- Vitória -> Urano (2300 a 3499)
(780,  81, 4), -- Virgínia -> Marte (500 a 899)
(3750, 82, 8); -- Letícia -> Netuno (3500+)
 
INSERT INTO EMPRESTIMO (DATA_EMPRESTIMO, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_EMPRESTIMO, ID_USUARIO, ID_LIVRO) VALUES
('2026-11-24 11:00:00', '2026-12-09', NULL, 'ABERTO', 79, 1),  -- Vinicius pegou Memórias do Subsolo
('2026-11-24 11:10:00', '2026-12-13', NULL, 'ABERTO', 80, 29), -- Vitória pegou Torto Arado
('2026-11-24 11:20:00', '2026-12-07', NULL, 'ABERTO', 81, 42), -- Virgínia pegou A Hora da Estrela
('2026-11-24 11:30:00', '2026-12-16', NULL, 'ABERTO', 82, 14); -- Letícia pegou Ideias para Adiar o Fim do Mundo

-- DQL

SELECT * FROM usuario

SELECT TITULO, AUTOR, QUANTIDADE_DISPONIVEL FROM LIVRO;

SELECT TITULO, AUTOR FROM LIVRO
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;

SELECT TITULO, AUTOR FROM LIVRO
WHERE TITULO LIKE '%IDIOTA%'

SELECT TITULO, AUTOR, ANO_PUBLICACAO FROM LIVRO
WHERE ANO_PUBLICACAO BETWEEN 1990 AND 2025;

SELECT COUNT (*) AS QUANTIDADE, SUM(QUANTIDADE_DISPONIVEL) AS SOMA, AVG(QUANTIDADE_DISPONIVEL) AS MEDIA, MAX(QUANTIDADE_DISPONIVEL) AS MAXIMO, MIN(QUANTIDADE_DISPONIVEL) AS MINIMO FROM LIVRO;

-- RANKING
SELECT 
    U.ID_USUARIO,
    U.NOME AS LEITOR,
    S.PONTOS_ATUAIS,
    N.NOME_PLANETA AS PLANETA,
    N.BONUS_EMPRESTIMO AS DIAS_BONUS,
    U.ATIVO
FROM USUARIO U
INNER JOIN SCORE S ON U.ID_USUARIO = S.ID_USUARIO
INNER JOIN NIVEL_PLANETA N ON S.ID_NIVEL = N.ID_NIVEL
ORDER BY S.PONTOS_ATUAIS DESC;

-- APENAS ATRASADOS
SELECT 
    U.NOME AS LEITOR,
    U.TELEFONE,
    L.TITULO AS LIVRO_ATRASADO,
    E.DATA_PREVISTA,
    N.NOME_PLANETA AS PLANETA_ATUAL
FROM EMPRESTIMO E
INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
INNER JOIN LIVRO L ON E.ID_LIVRO = L.ID_LIVRO
INNER JOIN SCORE S ON U.ID_USUARIO = S.ID_USUARIO
INNER JOIN NIVEL_PLANETA N ON S.ID_NIVEL = N.ID_NIVEL
WHERE E.STATUS_EMPRESTIMO = 'ATRASADO';

-- APENAS EM ABERTO
SELECT 
    U.NOME AS LEITOR,
    U.TELEFONE,
    L.TITULO AS LIVRO_ATRASADO,
    E.DATA_PREVISTA,
    N.NOME_PLANETA AS PLANETA_ATUAL
FROM EMPRESTIMO E
INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
INNER JOIN LIVRO L ON E.ID_LIVRO = L.ID_LIVRO
INNER JOIN SCORE S ON U.ID_USUARIO = S.ID_USUARIO
INNER JOIN NIVEL_PLANETA N ON S.ID_NIVEL = N.ID_NIVEL
WHERE E.STATUS_EMPRESTIMO = 'ABERTO';

-- APENAS DEVOLVIDO
SELECT 
    U.NOME AS LEITOR,
    U.TELEFONE,
    L.TITULO AS LIVRO_ATRASADO,
    E.DATA_PREVISTA,
    N.NOME_PLANETA AS PLANETA_ATUAL
FROM EMPRESTIMO E
INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
INNER JOIN LIVRO L ON E.ID_LIVRO = L.ID_LIVRO
INNER JOIN SCORE S ON U.ID_USUARIO = S.ID_USUARIO
INNER JOIN NIVEL_PLANETA N ON S.ID_NIVEL = N.ID_NIVEL
WHERE E.STATUS_EMPRESTIMO = 'DEVOLVIDO';


