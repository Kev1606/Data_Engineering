library(RODBC)
library(DBI)

setwd("C:/Users/axelc/OneDrive/Escritorio")

# Conexión a la base de datos
connection <- odbcConnect("sqlconnect")

# Leer el archivo CSV con punto y coma como delimitador y encabezados
data <- read.csv('Uber Precios.csv', sep = ";", header = TRUE)

# Guardar los datos en la base de datos
sqlSave(connection, data, tablename = "Services", rownames = FALSE, append = TRUE)

# Cerrar la conexión
odbcClose(connection)



