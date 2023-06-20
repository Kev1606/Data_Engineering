-- Seleccionar las columnas necesarias de las tablas dbo.RecurrenceServices y dbo.[Services].
SELECT
    rs.id, -- Identificador del servicio recurrente
    rs.useDate, -- Fecha de uso del servicio recurrente
    rs.idUser, -- Identificador del usuario asociado al servicio recurrente
    sv.tipoViaje AS [service], -- Tipo de servicio (alias "service")
    rs.kilometers, -- Kilómetros recorridos en el servicio recurrente
    sv.tarifaMinima + (rs.kilometers * sv.precioKM) AS price, -- Precio calculado según la tarifa mínima y el precio por kilómetro
    (sv.tarifaMinima + (rs.kilometers * sv.precioKM)) * (sv.fee / 100) AS earnings -- Ganancias calculadas multiplicando el precio por la comisión (porcentaje) del servicio
FROM dbo.RecurrenceServices rs
INNER JOIN dbo.[Services] sv ON sv.id = rs.idService