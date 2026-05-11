CREATE PROCEDURE salaryHistogram 
    @numIntervalos INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Obter os valores globais de salário
    DECLARE @minSal DECIMAL(10,2), @maxSal DECIMAL(10,2), @rangeSal DECIMAL(10,2);
    
    SELECT @minSal = MIN(salary), @maxSal = MAX(salary) 
    FROM instructor;

    -- 2. Calcular o tamanho de cada degrau
    -- Usamos @numIntervalos para dividir a diferença
    SET @rangeSal = (@maxSal - @minSal) / @numIntervalos;

    -- 3. Gerar os intervalos e contar
    WITH Faixas AS (
        -- Gerador de números para os intervalos (de 1 até @numIntervalos)
        SELECT 1 AS n
        UNION ALL
        SELECT n + 1 FROM Faixas WHERE n < @numIntervalos
    ),
    IntervalosCalculados AS (
        -- Define o valor mínimo e máximo de cada linha do histograma
        SELECT 
            n,
            (@minSal + (n - 1) * @rangeSal) AS valorMinimo,
            CASE 
                WHEN n = @numIntervalos THEN @maxSal -- Garante que o último pegue o valor máximo exato
                ELSE (@minSal + n * @rangeSal) - 0.01 -- Evita sobreposição de intervalos
            END AS valorMaximo
        FROM Faixas
    )
    SELECT 
        CAST(valorMinimo AS INT) AS valorMinimo, 
        CAST(valorMaximo AS INT) AS valorMaximo,
        (SELECT COUNT(*) FROM instructor i 
         WHERE i.salary >= ic.valorMinimo AND i.salary <= ic.valorMaximo) AS total
    FROM IntervalosCalculados ic;
END;