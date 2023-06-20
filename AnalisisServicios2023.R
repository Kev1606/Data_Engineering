library(RODBC)

# Establecer una conexión con la base de datos utilizando autenticación de Windows
con <- odbcConnect("sqlconnect")

# Ejecutar la consulta SQL para obtener los datos
consulta <- "SELECT [service] AS serviceName, COUNT(*) as usageTotal
FROM dbo.recurrenceServicesOn
WHERE YEAR(useDate) = 2023
GROUP BY [service]
ORDER BY usageTotal DESC;"
datos <- sqlQuery(con, consulta)

# Cerrar la conexión con la base de datos
odbcClose(con)

# Escribir los datos en un archivo CSV
write.csv(datos, file = "prediccion.csv", row.names = FALSE)