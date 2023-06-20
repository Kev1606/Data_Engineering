-- DATA WAREHOUSE --
-- FACT TABLE
-- COLUMNS: id, serviceName, month, year, KMs, tripQuantity, fee, %disabilities

-- GROUP BY serviceName
-- Agrupada por el servicio

SELECT 
    ROW_NUMBER() OVER (ORDER BY YEAR(rs.[useDate])) AS id,
    rs.[service] AS serviceName,
	YEAR(rs.[useDate]) AS [year],
    DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
    SUM(rs.[kilometers]) AS totalKilometers,
    COUNT(*) AS tripQuantity,
	sv.fee * COUNT(*) AS X --tripQuantity por el fee de cada servicio
	-- porcentaje del fee, (será añadido a la tabla de Services)
	-- porcentaje de discapacitados (sacar un porcentaje con base a si el Users tiene relacion con DisabilitiesByUser)
FROM [dbo].[recurrenceServicesOn] rs
INNER JOIN [dbo].[Services] sv ON sv.[tipoViaje] = rs.[service]
GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate]), sv.fee
ORDER BY YEAR(rs.[useDate]), MONTH(rs.[useDate])

-- (Ganancia) / SUM(CantidadServiciosCompletados)





SELECT
    [month],
    serviceName,
    SUM(X) / SUM(tripQuantity) AS averageX
FROM
    (SELECT
        ROW_NUMBER() OVER (ORDER BY YEAR(rs.[useDate])) AS id,
        rs.[service] AS serviceName,
        YEAR(rs.[useDate]) AS [year],
        DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
        SUM(rs.[kilometers]) AS totalKilometers,
        COUNT(*) AS tripQuantity,
        sv.fee * COUNT(*) AS X
    FROM
        [dbo].[recurrenceServicesOn] rs
    INNER JOIN
        [dbo].[Services] sv ON sv.[tipoViaje] = rs.[service]
    GROUP BY
        rs.[service],
        YEAR(rs.[useDate]),
        MONTH(rs.[useDate]),
        sv.fee) AS subquery
GROUP BY
    [month],
    serviceName



-- parece funcionar
SELECT 
    ROW_NUMBER() OVER (ORDER BY [year], [month]) AS id,
    serviceName,
    [year],
    [month],
    totalKilometers,
    tripQuantity,
    fee * tripQuantity AS X,
    (fee * tripQuantity) / SUM(tripQuantity) OVER (PARTITION BY [year], [month]) AS feePercentage
FROM
(
    SELECT 
        rs.[service] AS serviceName,
        YEAR(rs.[useDate]) AS [year],
        DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
        SUM(rs.[kilometers]) AS totalKilometers,
        COUNT(*) AS tripQuantity,
        sv.fee
    FROM [dbo].[recurrenceServicesOn] rs
    INNER JOIN [dbo].[Services] sv ON sv.[tipoViaje] = rs.[service]
    GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate]), sv.fee
) AS subquery;
