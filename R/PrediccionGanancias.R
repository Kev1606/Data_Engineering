library(forecast)
library(tidyverse)
library(RODBC)
library(DBI)

setwd("C:/Users/axelc/OneDrive/Escritorio")

# Paso 1: Establecer una conexión con la base de datos utilizando autenticación de Windows
con <- odbcConnect("sqlconnect")

# Paso 2: Ejecutar una consulta SQL para obtener los datos
consulta <- "SELECT month, year, SUM(earnings) as monthly_earnings FROM Fact.factTable GROUP BY month, year"
datos <- sqlQuery(con, consulta)

# Paso 3: Preparar los datos para el análisis
datos <- datos %>%
  mutate(fecha = paste(year, month, sep = "-")) %>%
  select(-month) %>%
  group_by(year) %>%
  summarize(ganancias = sum(monthly_earnings))

# Paso 4: Crear un objeto de serie de tiempo
serie_tiempo <- ts(datos$ganancias, start = min(datos$year), frequency = 2)

# Paso 5: Realizar la predicción
modelo <- HoltWinters(serie_tiempo)
prediccion <- forecast(modelo, h = 5)

# Paso 6: Obtener el contenido de la predicción en un data frame
prediccion_df <- as.data.frame(prediccion$mean)

# Paso 7: Agregar la columna "Year" al data frame de predicción
prediccion_df$Year <- seq(max(datos$year) + 1, length.out = nrow(prediccion_df), by = 1)

# Paso 8: Separar los datos en filas y columnas correspondientes
prediccion_df <- prediccion_df %>%
  pivot_longer(cols = -Year, names_to = "Month", values_to = "Earnings")

# Paso 9: Guardar la predicción en un archivo CSV
write.csv(prediccion_df, file = "prediccion.csv", row.names = FALSE)

# Paso 10: Cerrar la conexión con la base de datos
odbcClose(con)