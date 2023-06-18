{{ config(materialized='view') }}

SELECT id, [name]
FROM dbo.Disabilities
WHERE id IS NOT NULL AND [name] IS NOT NULL