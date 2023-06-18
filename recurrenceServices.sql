{{ config (materialized='table') }}

    -- Declarar las variables necesarias
    DECLARE @counter INT = 1
    DECLARE @startDate DATETIME = '2018-01-01'
    DECLARE @endDate DATETIME = '2023-12-31'

    -- Iniciar el bucle WHILE
    WHILE @counter <= 218000
BEGIN
        -- Generar valores aleatorios para idUsuario y idServicio
        DECLARE @randomUsuario INT
        SET @randomUsuario = ABS(CHECKSUM(NEWID())) % 10601
        -- Rango: 0-10600

        DECLARE @randomServicio INT
        SET @randomServicio = ABS(CHECKSUM(NEWID())) % 16
        -- Rango: 0-15

        -- Generar un valor datetime aleatorio entre @startDate y @endDate
        DECLARE @randomDate DATETIME
        SET @randomDate = DATEADD(SECOND, ABS(CHECKSUM(NEWID())) % DATEDIFF(SECOND, @startDate, @endDate), @startDate)

        -- Insertar los valores en la tabla
        INSERT INTO [dbo].[tablaRecurrencia]
            ([useDate],[idUser] ,[idService] )
        VALUES
            (@randomDate, @randomUsuario, @randomServicio)

        -- Incrementar el contador
        SET @counter = @counter + 1
    END