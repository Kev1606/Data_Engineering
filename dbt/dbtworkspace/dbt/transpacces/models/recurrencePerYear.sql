{{ config (materialized='view') }}

<<<<<<< HEAD
SELECT YEAR(useDate) AS Year, COUNT(*) AS Registers
FROM dbo.RecurrenceServices
GROUP BY YEAR(useDate)
=======
SELECT 
    YEAR(useDate) AS Year, -- Obtener el año de la columna "useDate"
    MONTH(useDate) AS Month, -- Obtener el mes de la columna "useDate"
    COUNT(*) AS Registers -- Contar el número de registros en cada grupo
FROM dbo.RecurrenceServices -- Tabla de origen
GROUP BY YEAR(useDate), MONTH(useDate) -- Agrupar por año y mes de "useDate"
>>>>>>> 56f6a23d82bdaa470480e4c23e19a3ec2f478f35
