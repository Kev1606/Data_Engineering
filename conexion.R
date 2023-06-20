library(forecast)
library(tidyverse)
library(ggplot2)
library(RODBC)
library(DBI)

setwd("C:/Users/axelc/OneDrive/Escritorio")

# Conexión a la base de datos
connection <- odbcConnect("sqlconnect")
"""
# Leer el archivo CSV con punto y coma como delimitador y encabezados
data <- read.csv('Uber Precios.csv', sep = ";", header = TRUE)

# Guardar los datos en la base de datos
sqlSave(connection, data, tablename = "Services", rownames = FALSE, append = TRUE)
"""
# Paso 2: Ejecutar una consulta SQL para obtener los datos
consulta <- "SELECT año, mes, ganancia FROM tabla_de_hechos"  # Reemplaza "tabla_de_hechos" con el nombre de tu tabla
datos <- dbGetQuery(con, consulta)

# Paso 3: Preparar los datos para el análisis
datos <- datos %>%
  mutate(fecha = as.Date(paste0(año, "-", mes, "-01"))) %>%
  select(-mes) %>%
  group_by(año) %>%
  summarize(ganancias = sum(ganancia))

# Paso 4: Crear un objeto de serie de tiempo
serie_tiempo <- ts(datos$ganancias, start = min(datos$año), frequency = 1)

# Paso 5: Realizar la predicción
modelo <- HoltWinters(serie_tiempo)
prediccion <- forecast(modelo, h = 5)  # Predice 5 años hacia el futuro

# Paso 6: Crear un gráfico de la predicción
autoplot(modelo) + 
  autolayer(prediccion, series = "Predicción") +
  xlab("Año") +
  ylab("Ganancias") +
  ggtitle("Predicción de ganancias en años futuros")
# Cerrar la conexión
odbcClose(connection)