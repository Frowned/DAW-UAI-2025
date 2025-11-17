-- =============================================
-- Script de Traducciones para NavMenu
-- Sistema de Idiomas - SIFRE WebUI
-- =============================================

-- Insertar Idiomas (si no existen)
IF NOT EXISTS (SELECT 1 FROM Languages WHERE Name = 'Español')
BEGIN
    INSERT INTO Languages (Name, isDefault) VALUES ('Español', 1);
END

IF NOT EXISTS (SELECT 1 FROM Languages WHERE Name = 'English')
BEGIN
    INSERT INTO Languages (Name, isDefault) VALUES ('English', 0);
END

-- Variables para los IDs de idiomas
DECLARE @SpanishId INT = (SELECT Id FROM Languages WHERE Name = 'Español');
DECLARE @EnglishId INT = (SELECT Id FROM Languages WHERE Name = 'English');

-- =============================================
-- LABELS PARA NAVMENU
-- =============================================

-- Menús principales
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_POINTS')
    INSERT INTO Labels (Name) VALUES ('MENU_POINTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_CATALOG')
    INSERT INTO Labels (Name) VALUES ('MENU_CATALOG');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_REPORTS')
    INSERT INTO Labels (Name) VALUES ('MENU_REPORTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_CONFIG')
    INSERT INTO Labels (Name) VALUES ('MENU_CONFIG');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_LOGOUT')
    INSERT INTO Labels (Name) VALUES ('MENU_LOGOUT');

-- Submenú de Puntos
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_CONSULT_POINTS')
    INSERT INTO Labels (Name) VALUES ('MENU_CONSULT_POINTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_REDEEM_POINTS')
    INSERT INTO Labels (Name) VALUES ('MENU_REDEEM_POINTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_TRANSFER_POINTS')
    INSERT INTO Labels (Name) VALUES ('MENU_TRANSFER_POINTS');

-- Submenú de Catálogo
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_VIEW_PRODUCTS')
    INSERT INTO Labels (Name) VALUES ('MENU_VIEW_PRODUCTS');

-- Submenú de Reporterías
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_EVENT_LOG')
    INSERT INTO Labels (Name) VALUES ('MENU_EVENT_LOG');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_PRODUCT_LOG')
    INSERT INTO Labels (Name) VALUES ('MENU_PRODUCT_LOG');

-- Submenú de Configuración
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_MANAGE_PRODUCTS')
    INSERT INTO Labels (Name) VALUES ('MENU_MANAGE_PRODUCTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_MANAGE_LANGUAGES')
    INSERT INTO Labels (Name) VALUES ('MENU_MANAGE_LANGUAGES');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_MANAGE_BACKUP')
    INSERT INTO Labels (Name) VALUES ('MENU_MANAGE_BACKUP');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'MENU_IMPORT_EXPORT')
    INSERT INTO Labels (Name) VALUES ('MENU_IMPORT_EXPORT');

-- Modal de Logout
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'LOGOUT_CONFIRM_TITLE')
    INSERT INTO Labels (Name) VALUES ('LOGOUT_CONFIRM_TITLE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'LOGOUT_CONFIRM_MESSAGE')
    INSERT INTO Labels (Name) VALUES ('LOGOUT_CONFIRM_MESSAGE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'BTN_CANCEL')
    INSERT INTO Labels (Name) VALUES ('BTN_CANCEL');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'BTN_LOGOUT')
    INSERT INTO Labels (Name) VALUES ('BTN_LOGOUT');

-- =============================================
-- TRADUCCIONES EN ESPAÑOL
-- =============================================

-- Menús principales - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_POINTS'), 'Puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CATALOG'), 'Catálogo'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_REPORTS'), 'Reporterías'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CONFIG'), 'Configuración'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_LOGOUT'), 'Cerrar sesión')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Puntos - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CONSULT_POINTS'), 'Consultar puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_REDEEM_POINTS'), 'Canjear puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_TRANSFER_POINTS'), 'Transferir puntos')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Catálogo - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_VIEW_PRODUCTS'), 'Ver productos')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Reporterías - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_EVENT_LOG'), 'Bitácora eventos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_PRODUCT_LOG'), 'Bitácora productos')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Configuración - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_PRODUCTS'), 'Gestionar productos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_LANGUAGES'), 'Gestionar idiomas'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_BACKUP'), 'Gestionar Backup'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'MENU_IMPORT_EXPORT'), 'Importar/Exportar JSON/XML')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Modal de Logout - Español
MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'LOGOUT_CONFIRM_TITLE'), '¿Confirmar cierre de sesión?'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'LOGOUT_CONFIRM_MESSAGE'), '¿Estás seguro de que querés cerrar sesión?'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'BTN_CANCEL'), 'Cancelar'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'BTN_LOGOUT'), 'Cerrar sesión')
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

-- Menús principales - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_POINTS'), 'Points'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CATALOG'), 'Catalog'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_REPORTS'), 'Reports'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CONFIG'), 'Settings'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_LOGOUT'), 'Logout')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Puntos - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_CONSULT_POINTS'), 'Check Points'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_REDEEM_POINTS'), 'Redeem Points'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_TRANSFER_POINTS'), 'Transfer Points')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Catálogo - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_VIEW_PRODUCTS'), 'View Products')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Reporterías - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_EVENT_LOG'), 'Event Log'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_PRODUCT_LOG'), 'Product Log')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Submenú de Configuración - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_PRODUCTS'), 'Manage Products'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_LANGUAGES'), 'Manage Languages'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_MANAGE_BACKUP'), 'Manage Backup'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'MENU_IMPORT_EXPORT'), 'Import/Export JSON/XML')
) AS Source (LanguageId, LabelId, Translation)
ON Target.LanguageId = Source.LanguageId AND Target.LabelId = Source.LabelId
WHEN MATCHED THEN
    UPDATE SET Translation = Source.Translation
WHEN NOT MATCHED THEN
    INSERT (LanguageId, LabelId, Translation)
    VALUES (Source.LanguageId, Source.LabelId, Source.Translation);

-- Modal de Logout - English
MERGE INTO Translations AS Target
USING (VALUES
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'LOGOUT_CONFIRM_TITLE'), 'Confirm Logout?'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'LOGOUT_CONFIRM_MESSAGE'), 'Are you sure you want to log out?'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'BTN_CANCEL'), 'Cancel'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'BTN_LOGOUT'), 'Logout')
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

PRINT '============================================='
PRINT 'Traducciones del NavMenu instaladas correctamente'
PRINT '============================================='
PRINT 'Idiomas configurados:'
SELECT Id, Name, isDefault FROM Languages;
PRINT ''
PRINT 'Total de etiquetas creadas:'
SELECT COUNT(*) AS TotalLabels FROM Labels WHERE Name LIKE 'MENU_%' OR Name LIKE 'LOGOUT_%' OR Name = 'BTN_CANCEL' OR Name = 'BTN_LOGOUT';
PRINT ''
PRINT 'Total de traducciones creadas:'
SELECT L.Name AS Language, COUNT(*) AS TotalTranslations
FROM Translations T
INNER JOIN Languages L ON T.LanguageId = L.Id
GROUP BY L.Name;
