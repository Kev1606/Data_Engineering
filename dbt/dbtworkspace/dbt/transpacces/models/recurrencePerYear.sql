{{ config (materialized='view') }}

SELECT YEAR(useDate) AS Year, COUNT(*) AS Registers
FROM dbo.RecurrenceServices
GROUP BY YEAR(useDate)
