library(forecast)
library(tidyverse)
library(ggplot2)
library(RODBC)
library(writexl)


# Paso 1: Establecer una conexión con la base de datos utilizando autenticación de Windows
con <- odbcConnect("sqlconnect")
# Reemplaza "nombre_servidor" con el nombre de tu servidor SQL Server
# Reemplaza "nombre_base_datos" con el nombre de tu base de datos

# Paso 2: Ejecutar una consulta SQL para obtener los datos
consulta <- "SELECT year, month, feePercentage FROM Fact.factTable"  # Reemplaza "tabla_de_hechos" con el nombre de tu tabla
datos <- sqlQuery(con, consulta)

# Paso 3: Preparar los datos para el análisis
meses <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

datos <- datos %>%
  mutate(month = tolower(month),  # Convertir a minúsculas
         month = paste0(toupper(substring(month, 1, 1)), substring(month, 2)),  # Primera letra mayúscula
         month_number = match(month, meses),  # Obtener el número de mes correspondiente
         fecha = as.Date(paste0(year, "-", sprintf("%02d", month_number), "-01"))) %>%
  select(-month, -month_number) %>%
  group_by(year) %>%
  summarize(ganancias = sum(feePercentage))

# Paso 4: Crear un objeto de serie de tiempo
serie_tiempo <- ts(datos$ganancias, start = min(datos$year), frequency = 2)

# Paso 5: Realizar la predicción
modelo <- HoltWinters(serie_tiempo)
prediccion <- forecast(modelo, h = 5)  # Predice 5 años hacia el futuro

# Paso adicional: Convertir la predicción en un dataframe
prediccion_df <- as.data.frame(prediccion)

# Paso adicional: Agregar una columna con el año
prediccion_df$year <- seq(max(datos$year) + 1, length.out = nrow(prediccion_df))

# Paso adicional: Guardar la predicción en un archivo XLSX
write_xlsx(prediccion_df, path = "prediccion.xlsx")

# Paso 7: Cerrar la conexión con la base de datos
odbcClose(con)