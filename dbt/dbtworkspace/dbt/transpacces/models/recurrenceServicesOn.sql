{{ config(materialized='view') }}

SELECT
    rs.id,
    rs.useDate,
    rs.idUser,
    sv.tipoViaje AS [service],
    rs.kilometers,
    sv.tarifaMinima + (rs.kilometers * sv.precioKM) AS price,
    (sv.tarifaMinima + (rs.kilometers * sv.precioKM)) * (sv.fee / 100) AS earnings
FROM dbo.RecurrenceServices rs
INNER JOIN dbo.[Services] sv ON sv.id = rs.idService
