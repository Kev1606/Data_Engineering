-- DATA WAREHOUSE --
-- FACT TABLE
-- COLUMNS: id, serviceName, month, year, KMs, tripQuantity, fee, %disabilities

-- GROUP BY serviceName
-- Agrupada por el servicio

SELECT 
    ROW_NUMBER() OVER (ORDER BY YEAR(rs.[useDate])) AS id,
    rs.[service] AS serviceName,
    DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
    YEAR(rs.[useDate]) AS [year],
    SUM(rs.[kilometers]) AS totalKilometers,
    COUNT(*) AS tripQuantity
	-- porcentaje del fee, (será añadido a la tabla de Services)
	-- porcentaje de discapacitados (sacar un porcentaje con base a si el Users tiene relacion con DisabilitiesByUser)
FROM [dbo].[recurrenceServicesOn] rs
GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate])
ORDER BY YEAR(rs.[useDate]), MONTH(rs.[useDate])

