{{ config (materialized='view') }}

SELECT
    id AS userId, -- Alias de la columna "id" como "userId"
    firstName AS firstName, -- Alias de la columna "firstName" como "firstName"
    lastName AS lastName, -- Alias de la columna "lastName" como "lastName"
    email AS email, -- Alias de la columna "email" como "email"
    telephone AS phoneNumber -- Alias de la columna "telephone" como "phoneNumber"
FROM dbo.Users -- Tabla de origen
WHERE lastName IS NOT NULL; -- Filtrar solo las filas donde lastName no es nulo