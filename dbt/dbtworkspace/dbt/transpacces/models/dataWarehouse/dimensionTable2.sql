{{ config(schema='Dim') }}

SELECT 
    ROW_NUMBER() OVER (ORDER BY [year], [month]) AS id,
    tripQuantity,
    totalKilometers,
    disabilityPercentage
FROM
(
    SELECT 
        rs.[service] AS serviceName,
        YEAR(rs.[useDate]) AS [year],
        DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
        SUM(rs.[kilometers]) AS totalKilometers,
        COUNT(*) AS tripQuantity,
        SUM(CASE WHEN d.[usersId] IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) OVER (PARTITION BY YEAR(rs.[useDate]), DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01'))) AS disabilityPercentage
    FROM [dbo].[recurrenceServicesOn] rs
    INNER JOIN [dbo].[Services] sv ON sv.[tipoViaje] = rs.[service]
    LEFT JOIN [dbo].[DisabilitiesByUser] d ON d.[usersId] = rs.[idUser]
    GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate])
) AS subquery;
