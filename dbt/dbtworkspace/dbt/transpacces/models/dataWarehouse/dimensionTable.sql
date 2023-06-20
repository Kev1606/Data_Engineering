{{ config(schema='Dim') }}

-- Dimension table
SELECT month, year, SUM(feePercentage) AS monthly_fee
FROM Fact.factTable
GROUP BY month, year;