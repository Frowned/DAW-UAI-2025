-- =============================================
-- Script de actualización: Tabla IntegrityControl
-- Propósito: Crear o actualizar la tabla IntegrityControl
--            para almacenar los CheckDigitVertical (DVV)
-- Fecha: 17/11/2024
-- =============================================

USE [DB_SIFRE]
GO

-- Verificar si la tabla existe
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IntegrityControl]') AND type in (N'U'))
BEGIN
    PRINT 'Creando tabla IntegrityControl...'

    CREATE TABLE [dbo].[IntegrityControl](
        [TableName] [VARCHAR](100) NOT NULL,
        [CheckDigitVertical] [VARCHAR](64) NOT NULL,
        [FechaCalculo] [DATETIME] NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY CLUSTERED
    (
        [TableName] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
           ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
    ON [PRIMARY]
    ) ON [PRIMARY]

    PRINT 'Tabla IntegrityControl creada exitosamente.'
END
ELSE
BEGIN
    PRINT 'La tabla IntegrityControl ya existe.'

    -- Verificar si el campo CheckDigitVertical tiene el tamaño correcto
    DECLARE @CurrentSize INT

    SELECT @CurrentSize = CHARACTER_MAXIMUM_LENGTH
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'IntegrityControl'
    AND COLUMN_NAME = 'CheckDigitVertical'

    IF @CurrentSize IS NOT NULL AND @CurrentSize < 64
    BEGIN
        PRINT 'El campo CheckDigitVertical tiene un tamaño insuficiente (' + CAST(@CurrentSize AS VARCHAR) + '). Actualizando a VARCHAR(64)...'

        -- Alterar el tamaño del campo
        ALTER TABLE [dbo].[IntegrityControl]
        ALTER COLUMN [CheckDigitVertical] [VARCHAR](64) NOT NULL

        PRINT 'Campo CheckDigitVertical actualizado a VARCHAR(64).'
    END
    ELSE IF @CurrentSize IS NOT NULL
    BEGIN
        PRINT 'El campo CheckDigitVertical ya tiene el tamaño correcto (VARCHAR(' + CAST(@CurrentSize AS VARCHAR) + ')).'
    END
END
GO

-- Verificar las tablas monitoreadas y crear registros iniciales si es necesario
PRINT 'Verificando registros para tablas monitoreadas...'

-- Productos
IF NOT EXISTS (SELECT 1 FROM [dbo].[IntegrityControl] WHERE TableName = 'Products')
BEGIN
    PRINT 'Inicializando control de integridad para tabla Products...'
    -- El CheckDigitVertical será calculado por la aplicación
END

-- Transacciones
IF NOT EXISTS (SELECT 1 FROM [dbo].[IntegrityControl] WHERE TableName = 'Transactions')
BEGIN
    PRINT 'Inicializando control de integridad para tabla Transactions...'
    -- El CheckDigitVertical será calculado por la aplicación
END

-- Transferencias de puntos
IF NOT EXISTS (SELECT 1 FROM [dbo].[IntegrityControl] WHERE TableName = 'PointTransfers')
BEGIN
    PRINT 'Inicializando control de integridad para tabla PointTransfers...'
    -- El CheckDigitVertical será calculado por la aplicación
END

PRINT ''
PRINT '============================================='
PRINT 'Script completado.'
PRINT 'IMPORTANTE: Ejecute la aplicación para generar'
PRINT 'los CheckDigitVertical iniciales para cada tabla.'
PRINT '============================================='
GO
