-- =============================================
-- Script de Traducciones para Home (Dashboard)
-- Sistema de Idiomas - SIFRE WebUI
-- =============================================

-- Variables para los IDs de idiomas
DECLARE @SpanishId INT = (SELECT Id FROM Languages WHERE Name = 'Español');
DECLARE @EnglishId INT = (SELECT Id FROM Languages WHERE Name = 'English');

-- =============================================
-- LABELS PARA HOME/DASHBOARD
-- =============================================

-- Encabezado y saludos
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_WELCOME')
    INSERT INTO Labels (Name) VALUES ('HOME_WELCOME');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_GREETING_MORNING')
    INSERT INTO Labels (Name) VALUES ('HOME_GREETING_MORNING');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_GREETING_AFTERNOON')
    INSERT INTO Labels (Name) VALUES ('HOME_GREETING_AFTERNOON');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_GREETING_EVENING')
    INSERT INTO Labels (Name) VALUES ('HOME_GREETING_EVENING');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_REDIRECTING')
    INSERT INTO Labels (Name) VALUES ('HOME_REDIRECTING');

-- Panel de Puntos
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_MY_POINTS')
    INSERT INTO Labels (Name) VALUES ('HOME_MY_POINTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_POINTS_AVAILABLE')
    INSERT INTO Labels (Name) VALUES ('HOME_POINTS_AVAILABLE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_POINTS_TO_REDEEM')
    INSERT INTO Labels (Name) VALUES ('HOME_POINTS_TO_REDEEM');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_ACCUMULATE_POINTS')
    INSERT INTO Labels (Name) VALUES ('HOME_ACCUMULATE_POINTS');

-- Panel de Catálogo
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_PRODUCT_CATALOG')
    INSERT INTO Labels (Name) VALUES ('HOME_PRODUCT_CATALOG');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_PRODUCTS_AVAILABLE')
    INSERT INTO Labels (Name) VALUES ('HOME_PRODUCTS_AVAILABLE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_CHECK_CATALOG')
    INSERT INTO Labels (Name) VALUES ('HOME_CHECK_CATALOG');

-- Panel de Administración
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_ADMINISTRATION')
    INSERT INTO Labels (Name) VALUES ('HOME_ADMINISTRATION');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_CONTROL_PANEL')
    INSERT INTO Labels (Name) VALUES ('HOME_CONTROL_PANEL');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_TOTAL_PRODUCTS')
    INSERT INTO Labels (Name) VALUES ('HOME_TOTAL_PRODUCTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_ACTIVE_PRODUCTS')
    INSERT INTO Labels (Name) VALUES ('HOME_ACTIVE_PRODUCTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_CATEGORIES')
    INSERT INTO Labels (Name) VALUES ('HOME_CATEGORIES');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_MANAGE_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_MANAGE_SYSTEM');

-- Panel de Reportería
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_RECENT_ACTIVITY')
    INSERT INTO Labels (Name) VALUES ('HOME_RECENT_ACTIVITY');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_SYSTEM_EVENTS')
    INSERT INTO Labels (Name) VALUES ('HOME_SYSTEM_EVENTS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_EVENTS_24H')
    INSERT INTO Labels (Name) VALUES ('HOME_EVENTS_24H');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_ACTIVE_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_ACTIVE_SYSTEM');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_LOW_ACTIVITY')
    INSERT INTO Labels (Name) VALUES ('HOME_LOW_ACTIVITY');

-- Panel de Backup
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_SYSTEM');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_SECURITY_BACKUPS')
    INSERT INTO Labels (Name) VALUES ('HOME_SECURITY_BACKUPS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_ACCESS_TOOLS')
    INSERT INTO Labels (Name) VALUES ('HOME_ACCESS_TOOLS');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_OPERATIONAL_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_OPERATIONAL_SYSTEM');

-- Panel de Idiomas
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_LANGUAGES')
    INSERT INTO Labels (Name) VALUES ('HOME_LANGUAGES');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_MULTILANGUAGE_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_MULTILANGUAGE_SYSTEM');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_LANGUAGES_CONFIGURED')
    INSERT INTO Labels (Name) VALUES ('HOME_LANGUAGES_CONFIGURED');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_MANAGE_TRANSLATIONS')
    INSERT INTO Labels (Name) VALUES ('HOME_MANAGE_TRANSLATIONS');

-- Mensajes generales
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_WELCOME_SIFRE')
    INSERT INTO Labels (Name) VALUES ('HOME_WELCOME_SIFRE');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_USE_MENU')
    INSERT INTO Labels (Name) VALUES ('HOME_USE_MENU');

-- Footer
IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_SECURE_SYSTEM')
    INSERT INTO Labels (Name) VALUES ('HOME_SECURE_SYSTEM');

IF NOT EXISTS (SELECT 1 FROM Labels WHERE Name = 'HOME_SESSION')
    INSERT INTO Labels (Name) VALUES ('HOME_SESSION');

-- =============================================
-- TRADUCCIONES EN ESPAÑOL
-- =============================================

MERGE INTO Translations AS Target
USING (VALUES
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_WELCOME'), '¡Bienvenido, {0}!'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_MORNING'), 'Buenos días. Aquí está el resumen de tu actividad.'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_AFTERNOON'), 'Buenas tardes. Aquí está el resumen de tu actividad.'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_EVENING'), 'Buenas noches. Aquí está el resumen de tu actividad.'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_REDIRECTING'), 'Redirigiendo al inicio de sesión...'),

    -- Panel de Puntos
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MY_POINTS'), 'Mis Puntos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_POINTS_AVAILABLE'), 'Puntos disponibles'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_POINTS_TO_REDEEM'), '¡Tienes puntos para canjear!'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACCUMULATE_POINTS'), 'Acumula puntos realizando actividades'),

    -- Panel de Catálogo
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_PRODUCT_CATALOG'), 'Catálogo de Productos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_PRODUCTS_AVAILABLE'), 'Productos disponibles'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CHECK_CATALOG'), 'Revisa el catálogo en el menú'),

    -- Panel de Administración
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ADMINISTRATION'), 'Administración'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CONTROL_PANEL'), 'Panel de Control'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_TOTAL_PRODUCTS'), 'Productos totales'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACTIVE_PRODUCTS'), 'Productos activos'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CATEGORIES'), 'Categorías'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MANAGE_SYSTEM'), 'Gestiona el sistema desde el menú de configuración'),

    -- Panel de Reportería
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_RECENT_ACTIVITY'), 'Actividad Reciente'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SYSTEM_EVENTS'), 'Eventos del sistema'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_EVENTS_24H'), 'eventos en las últimas 24 horas'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACTIVE_SYSTEM'), 'Sistema activo'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LOW_ACTIVITY'), 'Poca actividad reciente'),

    -- Panel de Backup
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SYSTEM'), 'Sistema'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SECURITY_BACKUPS'), 'Seguridad y Backups'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACCESS_TOOLS'), 'Accede a las herramientas de administración del sistema desde el menú de configuración'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_OPERATIONAL_SYSTEM'), 'Sistema operativo'),

    -- Panel de Idiomas
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LANGUAGES'), 'Idiomas'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MULTILANGUAGE_SYSTEM'), 'Sistema Multiidioma'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LANGUAGES_CONFIGURED'), 'idiomas configurados'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MANAGE_TRANSLATIONS'), 'Gestiona las traducciones desde el menú de configuración'),

    -- Mensajes generales
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_WELCOME_SIFRE'), 'Bienvenido al sistema SIFRE'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_USE_MENU'), 'Utiliza el menú lateral para navegar por las opciones disponibles según tus permisos.'),

    -- Footer
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SECURE_SYSTEM'), 'Sistema Seguro'),
    (@SpanishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SESSION'), 'Sesión')
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
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_WELCOME'), 'Welcome, {0}!'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_MORNING'), 'Good morning. Here is your activity summary.'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_AFTERNOON'), 'Good afternoon. Here is your activity summary.'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_GREETING_EVENING'), 'Good evening. Here is your activity summary.'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_REDIRECTING'), 'Redirecting to login...'),

    -- Points Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MY_POINTS'), 'My Points'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_POINTS_AVAILABLE'), 'Points available'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_POINTS_TO_REDEEM'), 'You have points to redeem!'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACCUMULATE_POINTS'), 'Accumulate points by performing activities'),

    -- Catalog Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_PRODUCT_CATALOG'), 'Product Catalog'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_PRODUCTS_AVAILABLE'), 'Products available'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CHECK_CATALOG'), 'Check the catalog in the menu'),

    -- Administration Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ADMINISTRATION'), 'Administration'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CONTROL_PANEL'), 'Control Panel'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_TOTAL_PRODUCTS'), 'Total products'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACTIVE_PRODUCTS'), 'Active products'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_CATEGORIES'), 'Categories'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MANAGE_SYSTEM'), 'Manage the system from the settings menu'),

    -- Reports Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_RECENT_ACTIVITY'), 'Recent Activity'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SYSTEM_EVENTS'), 'System events'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_EVENTS_24H'), 'events in the last 24 hours'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACTIVE_SYSTEM'), 'Active system'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LOW_ACTIVITY'), 'Low recent activity'),

    -- Backup Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SYSTEM'), 'System'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SECURITY_BACKUPS'), 'Security and Backups'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_ACCESS_TOOLS'), 'Access system administration tools from the settings menu'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_OPERATIONAL_SYSTEM'), 'Operational system'),

    -- Languages Panel
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LANGUAGES'), 'Languages'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MULTILANGUAGE_SYSTEM'), 'Multilanguage System'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_LANGUAGES_CONFIGURED'), 'configured languages'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_MANAGE_TRANSLATIONS'), 'Manage translations from the settings menu'),

    -- General Messages
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_WELCOME_SIFRE'), 'Welcome to SIFRE system'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_USE_MENU'), 'Use the side menu to navigate through the available options according to your permissions.'),

    -- Footer
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SECURE_SYSTEM'), 'Secure System'),
    (@EnglishId, (SELECT Id FROM Labels WHERE Name = 'HOME_SESSION'), 'Session')
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
PRINT 'Traducciones del Home/Dashboard instaladas correctamente'
PRINT '============================================='
PRINT 'Total de etiquetas del Home:'
SELECT COUNT(*) AS TotalLabels FROM Labels WHERE Name LIKE 'HOME_%';
PRINT ''
PRINT 'Total de traducciones del Home por idioma:'
SELECT L.Name AS Language, COUNT(*) AS TotalTranslations
FROM Translations T
INNER JOIN Languages L ON T.LanguageId = L.Id
INNER JOIN Labels La ON T.LabelId = La.Id
WHERE La.Name LIKE 'HOME_%'
GROUP BY L.Name;
