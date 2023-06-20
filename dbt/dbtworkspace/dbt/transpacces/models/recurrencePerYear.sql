{{ config (materialized='view') }}

SELECT 
    YEAR(useDate) AS Year, -- Obtener el año de la columna "useDate"
    MONTH(useDate) AS Month, -- Obtener el mes de la columna "useDate"
    COUNT(*) AS Registers -- Contar el número de registros en cada grupo
FROM dbo.RecurrenceServices -- Tabla de origen
GROUP BY YEAR(useDate), MONTH(useDate) -- Agrupar por año y mes de "useDate"