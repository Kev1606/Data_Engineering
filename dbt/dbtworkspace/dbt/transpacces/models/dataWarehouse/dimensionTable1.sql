{{ config(schema='Dim') }}

-- Dimension table
SELECT 
    ROW_NUMBER() OVER (ORDER BY [year], [month]) AS id,
    [month],
    [year],
    SUM(feePercentage) AS monthlyFeePercentage
FROM
(
    SELECT 
        rs.[service] AS serviceName,
        YEAR(rs.[useDate]) AS [year],
        DATENAME(MONTH, DATEADD(MONTH, (MONTH(rs.[useDate])) - 1, '2018-01-01')) AS [month],
        SUM(rs.[kilometers]) AS totalKilometers,
        COUNT(*) AS tripQuantity,
        (sv.fee * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY YEAR(rs.[useDate]), MONTH(rs.[useDate]))) AS feePercentage
    FROM [dbo].[recurrenceServicesOn] rs
    INNER JOIN [dbo].[Services] sv ON sv.[tipoViaje] = rs.[service]
    GROUP BY rs.[service], YEAR(rs.[useDate]), MONTH(rs.[useDate]), sv.fee
) AS subquery
GROUP BY [month], [year];