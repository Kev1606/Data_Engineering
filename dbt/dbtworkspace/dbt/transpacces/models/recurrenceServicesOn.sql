{{ config(materialized='view') }}

SELECT rs.id, rs.useDate, rs.idUser, sv.tipoViaje AS [service], rs.kilometers
FROM dbo.RecurrenceServices rs
INNER JOIN dbo.[Services] sv ON sv.id = rs.idService