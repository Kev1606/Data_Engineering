{{ config(materialized='view', schema='facts') }}

SELECT 
    ROW_NUMBER() OVER (ORDER BY YEAR(rs.[useDate])) AS id,
    rs.[service] AS serviceName,
	YEAR(rs.[useDate]) AS [year],
    DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
    SUM(rs.[kilometers]) AS totalKilometers,
    COUNT(*) AS tripQuantity

	-- porcentaje del fee, (será añadido a la tabla de Services)
	-- porcentaje de discapacitados (sacar un porcentaje con base a si el Users tiene relacion con DisabilitiesByUser)
FROM [dbo].[recurrenceServicesOn] rs
GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate])
ORDER BY YEAR(rs.[useDate]), MONTH(rs.[useDate])