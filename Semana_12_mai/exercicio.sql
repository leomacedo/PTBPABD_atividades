CREATE TRIGGER dbo.lost_credits
ON dbo.takes
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE s
    SET s.tot_cred = s.tot_cred - descontos.creditos_removidos
    FROM dbo.student s
    INNER JOIN (
        SELECT d.ID, SUM(c.credits) AS creditos_removidos
        FROM deleted d
        INNER JOIN dbo.course c ON d.course_id = c.course_id
        GROUP BY d.ID
    ) descontos ON s.ID = descontos.ID;
END;
GO