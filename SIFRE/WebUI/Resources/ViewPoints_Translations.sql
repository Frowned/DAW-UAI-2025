-- =============================================
-- Script de Traducciones para ViewPoints (Consultar Puntos)
-- Sistema de Idiomas - SIFRE WebUI
-- =============================================

-- Variables para los IDs de idiomas
DECLARE @SpanishId INT = (SELECT Id FROM Languages WHERE Name = 'Español');
DECLARE @EnglishId INT = (SELECT Id FROM Languages WHERE Name = 'English');

-- =============================================
-- LABELS PARA VIEWPOINTS
-- =============================================

-- Título y encabezados
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_TITLE')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_TITLE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_TOTAL_POINTS')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_TOTAL_POINTS');

-- Columnas de la tabla
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_COL_ID')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_COL_ID');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_COL_USER')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_COL_USER');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_COL_PRODUCT')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_COL_PRODUCT');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_COL_POINTS')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_COL_POINTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_COL_DATE')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_COL_DATE');

-- Botones y mensajes
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_BTN_EXPORT')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_BTN_EXPORT');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'VIEWPOINTS_NO_TRANSACTIONS')
    INSERT INTO Labels (Name) VALUES ('VIEWPOINTS_NO_TRANSACTIONS');

-- =============================================
-- TRADUCCIONES EN ESPAÑOL
-- =============================================

MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_TITLE'), 'Historial de puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_TOTAL_POINTS'), 'Puntos:'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_ID'), 'ID'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_USER'), 'Usuario'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_PRODUCT'), 'Producto'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_POINTS'), 'Puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_DATE'), 'Fecha de transacción'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_BTN_EXPORT'), 'Exportar'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_NO_TRANSACTIONS'), 'No hay transacciones para exportar.')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- =============================================
-- TRADUCCIONES EN INGLÉS
-- =============================================

MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_TITLE'), 'Points History'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_TOTAL_POINTS'), 'Points:'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_ID'), 'ID'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_USER'), 'User'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_PRODUCT'), 'Product'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_POINTS'), 'Points'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_COL_DATE'), 'Transaction Date'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_BTN_EXPORT'), 'Export'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'VIEWPOINTS_NO_TRANSACTIONS'), 'No transactions to export.')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- =============================================
-- VERIFICACIÓN
-- =============================================

PRINT '=============================================';
PRINT 'Traducciones de ViewPoints instaladas correctamente';
PRINT '=============================================';
PRINT 'Total de etiquetas de ViewPoints:';
SELECT COUNT(*) AS TotalLabels FROM Labels WHERE Name LIKE 'VIEWPOINTS_%';
PRINT '';
PRINT 'Total de traducciones de ViewPoints por idioma:';
SELECT L.Name AS Language, COUNT(*) AS TotalTranslations
FROM Translations T
INNER JOIN Languages L ON T.LanguageId = L.Id
INNER JOIN Labels La ON T.LabelId = La.Id
WHERE La.Name LIKE 'VIEWPOINTS_%'
GROUP BY L.Name;
