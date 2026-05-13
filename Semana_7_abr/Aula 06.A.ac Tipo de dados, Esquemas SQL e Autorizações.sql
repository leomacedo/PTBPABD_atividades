

/*
Questão 01. Crie as contas de usuário User_A, User_B, User_C, User_D e User_E.
 */
-- Criar usuários
CREATE USER User_A WITH PASSWORD = 'PT23820x';
CREATE USER User_B WITH PASSWORD = 'PT23820x';
CREATE USER User_C WITH PASSWORD = 'PT23820x';
CREATE USER User_D WITH PASSWORD = 'PT23820x';
CREATE USER User_E WITH PASSWORD = 'PT23820x';

/*
Questão 02. Considere o esquema de banco de dados relacional university. 
O User_A poderá selecionar ou modificar qualquer relação, exceto CLASSROOM, e pode conceder qualquer um desses privilégios a outros usuários.
*/
GRANT select, update ON advisor TO User_A WITH GRANT OPTION;
GRANT select, update ON course TO User_A WITH GRANT OPTION;
GRANT select, update ON department TO User_A WITH GRANT OPTION;
GRANT select, update ON departments_total_salary TO User_A WITH GRANT OPTION;
GRANT select, update ON faculty TO User_A WITH GRANT OPTION;
GRANT select, update ON grade_points TO User_A WITH GRANT OPTION;
GRANT select, update ON instructor TO User_A WITH GRANT OPTION;
GRANT select, update ON prereq TO User_A WITH GRANT OPTION;
GRANT select, update ON [section] TO User_A WITH GRANT OPTION;
GRANT select, update ON student TO User_A WITH GRANT OPTION;
GRANT select, update ON takes TO User_A WITH GRANT OPTION;
GRANT select, update ON teaches TO User_A WITH GRANT OPTION;
GRANT select, update ON time_slot TO User_A WITH GRANT OPTION;

/*
Questão 03. Liste as permissões do User_A
 */
select  princ.name
,       princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id)
from    sys.database_principals princ
left join
        sys.database_permissions perm
on      perm.grantee_principal_id = princ.principal_id
where princ.type_desc = 'SQL_USER' AND princ.name = 'User_A'
