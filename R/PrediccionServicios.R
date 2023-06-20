library(forecast)
library(tidyverse)
library(RODBC)
library(writexl)
library(DBI)

setwd("C:/Users/axelc/OneDrive/Escritorio")

# Paso 1: Establecer una conexión con la base de datos utilizando autenticación de Windows
con <- odbcConnect("sqlconnect")

# Paso 2: Ejecutar una consulta SQL para obtener los datos
consulta <- "SELECT YEAR(useDate) AS Year, COUNT(*) AS Registers FROM dbo.RecurrenceServices GROUP BY YEAR(useDate)"
datos <- sqlQuery(con, consulta)

# Paso 3: Preparar los datos para el análisis
datos <- datos %>%
  mutate(Year = as.numeric(as.character(Year))) %>%
  arrange(Year)

# Paso 4: Crear un objeto de serie de tiempo
serie_tiempo <- ts(datos$Registers, start = min(datos$Year), frequency = 2)

# Paso 5: Realizar la predicción
modelo <- HoltWinters(serie_tiempo)
prediccion <- forecast(modelo, h = 5)

# Paso 6: Obtener el contenido de la predicción en un data frame
prediccion_df <- as.data.frame(prediccion$mean)

# Paso 7: Agregar la columna "Year" al data frame de predicción
ultimo_anio <- max(datos$Year)
anios_prediccion <- seq(ultimo_anio + 1, length.out = nrow(prediccion_df))
prediccion_df <- cbind(Year = anios_prediccion, prediccion_df)

# Paso 8: Guardar la predicción en un archivo CSV
write.csv(prediccion_df, file = "prediccion.csv", row.names = FALSE)

# Paso 9: Cerrar la conexión con la base de datos
odbcClose(con)