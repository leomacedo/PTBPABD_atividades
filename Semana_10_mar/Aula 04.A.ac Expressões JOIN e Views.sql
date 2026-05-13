-- Questão 01. Crie uma relação a partir da união das tabelas student e takes. 
SELECT * from student JOIN takes on student.ID = takes.ID ;

-- Questão 2. Contar a quantidade de cursos realizados pelos alunos do departamento de Civil Eng. Ordenar de maneira descendente a quantidade de cursos associada aos alunos.
SELECT student.ID, student.name, count(*) as 'Quantidade de cursos' 
FROM student JOIN takes ON student.ID = takes.ID 
WHERE student.dept_name = 'Civil Eng.' 
GROUP BY student.ID, student.name  ORDER BY 'Quantidade de cursos' DESC;

-- Questão 3. Criar uma view chamada 'civil_eng_students' a partir da relação construída na Questão 2.
CREATE VIEW civil_eng_students AS (SELECT student.ID, student.name, count(*) as 'Quantidade de cursos' 
FROM student JOIN takes ON student.ID = takes.ID 
WHERE student.dept_name = 'Civil Eng.' 
GROUP BY student.ID, student.name);

SELECT * FROM civil_eng_students ORDER BY 'Quantidade de cursos' DESC;



