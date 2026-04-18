-- Questão 01
GRANT SELECT (ID, name, dept_name) ON INSTRUCTOR TO User_B;
GRANT SELECT (ID, course_id, sec_id, semester, year) ON TAKES TO User_B;

-- Questão 02
GRANT SELECT, UPDATE (course_id, sec_id, semester, year) ON SECTION TO User_C;

-- Questão 03
GRANT SELECT ON INSTRUCTOR TO User_D;
GRANT SELECT ON STUDENT TO User_D;
GRANT SELECT ON grade_points TO User_D;

-- Questão 04
CREATE VIEW student_civil_eng AS
SELECT * FROM STUDENT
WHERE dept_name = 'Civil Eng.';

GRANT SELECT ON student_civil_eng TO User_E;

-- Questão 05
REVOKE ALL PRIVILEGES FROM User_E;

-- Mostrando os privilégios atuais concedidos aos usuários solicitados (Consulta em metadados)
SELECT 
    grantee AS Usuario, 
    table_name AS Tabela, 
    privilege_type AS Privilegio, 
    is_grantable AS Pode_Conceder
FROM information_schema.role_table_grants 
WHERE grantee IN ('User_A', 'User_B', 'User_C', 'User_D', 'User_E');