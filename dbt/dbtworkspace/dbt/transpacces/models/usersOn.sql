{{ config (materialized='view') }}

SELECT
    id AS userId,
    firstName AS firstName,
    lastName AS lastName,
    email AS email,
    telephone AS phoneNumber
FROM dbo.Users
WHERE lastName IS NOT NULL