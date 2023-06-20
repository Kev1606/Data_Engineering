{{ config(materialized='view') }}

SELECT 
    id, -- Selección de la columna "id"
    [name] -- Selección de la columna "name" (entre corchetes debido a que "name" es una palabra reservada en SQL Server)
FROM dbo.Disabilities -- Tabla de origen
WHERE 
    id IS NOT NULL -- Filtrar los registros donde el id no sea nulo
    AND [name] IS NOT NULL -- Filtrar los registros donde el nombre no sea nulo