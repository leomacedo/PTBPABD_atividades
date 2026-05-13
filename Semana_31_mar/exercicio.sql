-- questão 1
CREATE SCHEMA avaliacaocontinua;
GO

-- questão 2
CREATE TABLE avaliacaocontinua.company(
    company_name VARCHAR(255) PRIMARY KEY,
    city VARCHAR(255)
);

-- questão 3
CREATE TABLE avaliacaocontinua.employee(
    person_name VARCHAR(255) PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255)
);

-- questão 4
CREATE TABLE avaliacaocontinua.manages(
    person_name VARCHAR(255) PRIMARY KEY,
    manager_name VARCHAR(255)
);

-- questão 5
CREATE TABLE avaliacaocontinua.works(
    person_name VARCHAR(255) PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2)
);

-- questão 6 
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_employee
FOREIGN KEY (person_name) 
REFERENCES avaliacaocontinua.employee (person_name)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- questão 7
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_company
FOREIGN KEY (company_name) 
REFERENCES avaliacaocontinua.company (company_name)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- questão 8
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT fk_manages_employee
FOREIGN KEY (person_name) 
REFERENCES avaliacaocontinua.employee (person_name)
ON DELETE CASCADE
ON UPDATE CASCADE;
