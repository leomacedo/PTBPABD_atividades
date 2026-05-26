
-- Questão 01. Crie uma Trigger denominada dbo.trigger_prevent_assignment_teaches
-- Objetivo: Impedir que aulas sejam atribuídas a um instrutor que já possui 2 
--           ou mais atribuições no mesmo ano.

CREATE TRIGGER dbo.trigger_prevent_assignment_teaches
ON dbo.teaches
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT t.ID, t.year
        FROM dbo.teaches t
        JOIN inserted i 
            ON t.ID = i.ID AND t.year = i.year
        GROUP BY t.ID, t.year
        HAVING COUNT(*) > 2 
    )
    BEGIN
        RAISERROR('Operação bloqueada: O instrutor não pode ter mais de 2 atribuições de aulas no mesmo ano.', 16, 1);
        
        ROLLBACK TRANSACTION;
    END
END;