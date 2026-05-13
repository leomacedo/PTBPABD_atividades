-- Questão 01: 
CREATE TABLE pessoa (
    ID INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    idade INT,
    CONSTRAINT chk_idade CHECK (idade >= 0)
);

-- Questão 02: 
ALTER TABLE pessoa
ADD CONSTRAINT uq_pessoa_identificacao UNIQUE (ID, nome, sobrenome);

-- Questão 03: 
ALTER TABLE pessoa
MODIFY idade INT NOT NULL;

-- Questão 04: 
CREATE TABLE endereco (
    ID INT PRIMARY KEY,
    rua VARCHAR(100)
);

ALTER TABLE pessoa
ADD COLUMN id_endereco INT;

ALTER TABLE pessoa
ADD CONSTRAINT fk_pessoa_endereco
FOREIGN KEY (id_endereco) REFERENCES endereco(ID);