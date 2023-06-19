{{ config (materialized='view') }}

SELECT YEAR(useDate) AS Year, MONTH(useDate) AS Month, COUNT(*) AS Registers
FROM dbo.RecurrenceServices
GROUP BY YEAR(useDate), MONTH(useDate)
