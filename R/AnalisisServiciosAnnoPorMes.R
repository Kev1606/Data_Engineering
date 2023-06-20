library(RODBC)

# Establecer una conexión con la base de datos utilizando autenticación de Windows
con <- odbcConnect("sqlconnect")

# Ejecutar la consulta SQL para obtener los datos
consulta <- "SELECT	DATENAME(MONTH, DATEADD(MONTH, (MONTH([useDate])) - 1, '2018-01-01')) AS [month],     
		COUNT(*) AS usageTotal 
FROM    dbo.recurrenceServicesOn 
WHERE YEAR(useDate) = 2023
GROUP BY MONTH(useDate)"
datos <- sqlQuery(con, consulta)

# Cerrar la conexión con la base de datos
odbcClose(con)

# Escribir los datos en un archivo CSV
write.csv(datos, file = "prediccion.csv", row.names = FALSE)