# 🌍 Sistema de Traducciones del NavMenu

## Resumen

El NavMenu de WebUI ahora está completamente traducido y soporta cambio dinámico de idioma en tiempo real.

## ✅ Archivos Modificados

### 1. **NavMenu.razor**
- Ahora hereda de `LanguageAwareComponentBase`
- Todos los textos usan el método `T()` para traducción
- Se actualiza automáticamente al cambiar el idioma

### 2. **NavMenu_Translations.sql**
- Script SQL con todos los inserts necesarios
- Crea 2 idiomas: Español (predeterminado) e English
- Define 20 etiquetas (labels) para el menú
- Incluye 40 traducciones (20 en español + 20 en inglés)

## 📋 Etiquetas Creadas

### Menús Principales
- `MENU_POINTS` - Puntos / Points
- `MENU_CATALOG` - Catálogo / Catalog
- `MENU_REPORTS` - Reporterías / Reports
- `MENU_CONFIG` - Configuración / Settings
- `MENU_LOGOUT` - Cerrar sesión / Logout

### Submenú de Puntos
- `MENU_CONSULT_POINTS` - Consultar puntos / Check Points
- `MENU_REDEEM_POINTS` - Canjear puntos / Redeem Points
- `MENU_TRANSFER_POINTS` - Transferir puntos / Transfer Points

### Submenú de Catálogo
- `MENU_VIEW_PRODUCTS` - Ver productos / View Products

### Submenú de Reporterías
- `MENU_EVENT_LOG` - Bitácora eventos / Event Log
- `MENU_PRODUCT_LOG` - Bitácora productos / Product Log

### Submenú de Configuración
- `MENU_MANAGE_PRODUCTS` - Gestionar productos / Manage Products
- `MENU_MANAGE_LANGUAGES` - Gestionar idiomas / Manage Languages
- `MENU_MANAGE_BACKUP` - Gestionar Backup / Manage Backup
- `MENU_IMPORT_EXPORT` - Importar/Exportar JSON/XML / Import/Export JSON/XML

### Modal de Logout
- `LOGOUT_CONFIRM_TITLE` - ¿Confirmar cierre de sesión? / Confirm Logout?
- `LOGOUT_CONFIRM_MESSAGE` - ¿Estás seguro de que querés cerrar sesión? / Are you sure you want to log out?
- `BTN_CANCEL` - Cancelar / Cancel
- `BTN_LOGOUT` - Cerrar sesión / Logout

## 🚀 Instalación

### 1. Ejecutar el Script SQL
```sql
-- Ejecutar en SQL Server Management Studio
-- Archivo: NavMenu_Translations.sql
-- Ubicación: SIFRE\WebUI\Resources\NavMenu_Translations.sql
```

El script:
- ✅ Verifica si los idiomas existen antes de crearlos
- ✅ Usa MERGE para evitar duplicados
- ✅ Es idempotente (se puede ejecutar múltiples veces)
- ✅ Incluye verificación al final

### 2. Reiniciar la Aplicación
Después de ejecutar el script, reinicia la aplicación WebUI.

## 🎯 Cómo Funciona

### 1. Usuario cambia el idioma
El usuario selecciona un idioma usando el selector en la parte superior derecha del NavMenu.

### 2. NavMenu se actualiza automáticamente
- El NavMenu hereda de `LanguageAwareComponentBase`
- Está suscrito al evento `OnLanguageChanged` del `LanguageService`
- Cuando cambia el idioma, se ejecuta `StateHasChanged()` automáticamente
- Todos los textos se vuelven a renderizar con las nuevas traducciones

### 3. Método T()
```csharp
@T("MENU_POINTS", "Puntos")
```
- Primer parámetro: clave de la etiqueta (labelName)
- Segundo parámetro: texto por defecto si no hay traducción
- Retorna la traducción en el idioma actual

## 🔍 Verificación

### Consultar idiomas instalados
```sql
SELECT * FROM Languages;
```

### Consultar etiquetas del NavMenu
```sql
SELECT * FROM Labels
WHERE Name LIKE 'MENU_%'
   OR Name LIKE 'LOGOUT_%'
   OR Name IN ('BTN_CANCEL', 'BTN_LOGOUT');
```

### Consultar todas las traducciones
```sql
SELECT
    L.Name AS Language,
    La.Name AS Label,
    T.Translation
FROM Translations T
INNER JOIN Languages L ON T.LanguageId = L.Id
INNER JOIN Labels La ON T.LabelId = La.Id
WHERE La.Name LIKE 'MENU_%'
   OR La.Name LIKE 'LOGOUT_%'
   OR La.Name IN ('BTN_CANCEL', 'BTN_LOGOUT')
ORDER BY L.Name, La.Name;
```

### Contar traducciones por idioma
```sql
SELECT
    L.Name AS Language,
    COUNT(*) AS TotalTranslations
FROM Translations T
INNER JOIN Languages L ON T.LanguageId = L.Id
INNER JOIN Labels La ON T.LabelId = La.Id
WHERE La.Name LIKE 'MENU_%'
   OR La.Name LIKE 'LOGOUT_%'
   OR La.Name IN ('BTN_CANCEL', 'BTN_LOGOUT')
GROUP BY L.Name;
```

Resultado esperado:
- Español: 20 traducciones
- English: 20 traducciones

## 🎨 Personalización

### Agregar un nuevo idioma
1. Ir a `/gestionar-idiomas`
2. Agregar el nuevo idioma (ej: "Português")
3. Seleccionar cada etiqueta del NavMenu
4. Agregar la traducción correspondiente

### Modificar una traducción
1. Ir a `/gestionar-idiomas`
2. Seleccionar el idioma
3. Hacer clic en la traducción a modificar
4. Actualizar el texto
5. Guardar

### Agregar más etiquetas al NavMenu
1. Agregar la etiqueta en `/gestionar-idiomas`
2. Agregar traducciones para todos los idiomas
3. Usar `@T("NUEVA_ETIQUETA", "Texto por defecto")` en el NavMenu

## 📊 Estructura de la BD

```
Languages
├── Id (int, PK, Identity)
├── Name (nvarchar(255))
└── isDefault (bit)

Labels
├── Id (int, PK, Identity)
└── Name (nvarchar(255))

Translations
├── LanguageId (int, PK, FK -> Languages.Id)
├── LabelId (int, PK, FK -> Labels.Id)
└── Translation (varchar(200))
```

## 🐛 Troubleshooting

### El menú no se traduce
1. Verificar que el script SQL se ejecutó correctamente
2. Verificar que el idioma seleccionado tiene traducciones
3. Reiniciar la aplicación

### El selector de idioma no aparece
1. Verificar que `LanguageSelector` está en el NavMenu
2. Verificar que hay idiomas en la base de datos
3. Revisar la consola del navegador para errores

### Las traducciones no se actualizan en tiempo real
1. Verificar que el componente hereda de `LanguageAwareComponentBase`
2. Verificar que `LanguageService` está registrado en `Program.cs`
3. Verificar que no hay errores en la consola

## 📚 Referencias

- Documentación completa: `LANGUAGE_SYSTEM_GUIDE.md`
- Ejemplo de uso: `/ejemplo-idiomas`
- Gestión de idiomas: `/gestionar-idiomas`

## ✨ Ventajas

- ✅ Cambio de idioma en tiempo real (sin recargar página)
- ✅ Fácil agregar nuevos idiomas
- ✅ Fácil agregar nuevas traducciones
- ✅ Compatible con el sistema WinForms
- ✅ Soporta cualquier cantidad de idiomas
- ✅ Textos por defecto si no hay traducción
- ✅ Actualización automática de todos los componentes

---

**Fecha de creación:** 2025
**Sistema:** SIFRE WebUI
**Versión:** 1.0
