# 🌍 Sistema de Idiomas en WebUI - Guía de Uso

## Descripción General

El sistema de idiomas en WebUI está basado en el patrón Observer del proyecto WinForms, adaptado para Blazor. Permite cambiar el idioma de la interfaz en tiempo real sin necesidad de recargar la página.

## Componentes del Sistema

### 1. LanguageService (`WebUI/Services/LanguageService.cs`)
Servicio principal que maneja el cambio de idioma y notifica a los componentes suscritos.

**Métodos principales:**
- `ChangeLanguage(LanguageDTO language)`: Cambia el idioma actual
- `GetTranslation(string labelName, string defaultText)`: Obtiene la traducción de una etiqueta
- `HasTranslation(string labelName)`: Verifica si existe una traducción

### 2. LanguageSelector (`Components/Shared/LanguageSelector.razor`)
Componente que muestra el selector de idioma en la interfaz.

**Parámetros:**
- `ShowAsDropdown` (bool): Si es true, muestra un dropdown; si es false, muestra botones
- `ShowLabel` (bool): Si es true, muestra una etiqueta
- `Label` (string): Texto de la etiqueta
- `OnLanguageChanged` (EventCallback): Evento que se dispara al cambiar idioma

### 3. LanguageAwareComponentBase (`Components/LanguageAwareComponentBase.cs`)
Clase base que proporciona actualización automática cuando cambia el idioma.

## Cómo Usar el Sistema

### Opción 1: Heredar de LanguageAwareComponentBase (Recomendado)

```razor
@page "/mi-pagina"
@inherits LanguageAwareComponentBase

<h3>@T("PAGE_TITLE", "Mi Página")</h3>
<p>@T("WELCOME_MESSAGE", "Bienvenido al sistema")</p>

<button class="btn btn-primary">
    @T("BTN_SAVE", "Guardar")
</button>

@code {
    // El componente se actualizará automáticamente cuando cambie el idioma
    // No necesitas código adicional
}
```

**Ventajas:**
- ✅ Actualización automática cuando cambia el idioma
- ✅ Método `T()` disponible para traducciones
- ✅ Método `HasTranslation()` para verificar traducciones
- ✅ Se desuscribe automáticamente al destruirse

### Opción 2: Inyectar LanguageService manualmente

```razor
@page "/mi-pagina"
@inject LanguageService LanguageService
@implements IDisposable

<h3>@GetTitle()</h3>

@code {
    protected override void OnInitialized()
    {
        // Suscribirse manualmente
        LanguageService.OnLanguageChanged += OnLanguageChanged;
    }

    private void OnLanguageChanged()
    {
        // Forzar re-renderizado
        InvokeAsync(StateHasChanged);
    }

    private string GetTitle()
    {
        return LanguageService.GetTranslation("PAGE_TITLE", "Mi Página");
    }

    public void Dispose()
    {
        // IMPORTANTE: Desuscribirse para evitar memory leaks
        LanguageService.OnLanguageChanged -= OnLanguageChanged;
    }
}
```

### Opción 3: Para componentes que NO necesitan actualización automática

```razor
@page "/mi-pagina"
@inject LanguageService LanguageService

<h3>Idioma actual: @LanguageService.CurrentLanguage?.Name</h3>

@code {
    // Este componente NO se actualizará cuando cambie el idioma
    // Solo muestra el valor inicial
}
```

## Agregar el Selector de Idioma

### En el NavMenu (ya configurado)
```razor
<LanguageSelector ShowAsDropdown="true" />
```

### En cualquier componente
```razor
<!-- Como dropdown -->
<LanguageSelector ShowAsDropdown="true" />

<!-- Como botones -->
<LanguageSelector ShowAsDropdown="false" ShowLabel="true" Label="Seleccionar idioma:" />

<!-- Con callback personalizado -->
<LanguageSelector
    ShowAsDropdown="true"
    OnLanguageChanged="@HandleLanguageChange" />

@code {
    private void HandleLanguageChange(LanguageDTO newLanguage)
    {
        // Ejecutar lógica adicional cuando cambia el idioma
        Console.WriteLine($"Idioma cambiado a: {newLanguage.Name}");
    }
}
```

## Gestionar Traducciones

### 1. Agregar Etiquetas
Ir a `/gestionar-idiomas` y:
1. Crear idiomas (Español, English, etc.)
2. Agregar etiquetas (BTN_SAVE, PAGE_TITLE, etc.)
3. Agregar traducciones para cada idioma

### 2. Usar en Código
```csharp
// Con texto por defecto
@T("BTN_SAVE", "Guardar")

// El sistema buscará la traducción de "BTN_SAVE"
// Si no existe, mostrará "Guardar"
```

## Ejemplos Completos

### Ejemplo 1: Página Simple con Traducciones

```razor
@page "/ejemplo-idioma"
@inherits LanguageAwareComponentBase
@using BE.Enums

<RoleGuard RequiredPermissions="@(new[] { PermissionsType.CONSULTAR_PUNTOS })">

    <div class="card">
        <div class="card-header">
            <h3>@T("EXAMPLE_PAGE_TITLE", "Ejemplo de Página")</h3>
        </div>
        <div class="card-body">
            <p>@T("EXAMPLE_DESCRIPTION", "Esta es una página de ejemplo con traducciones.")</p>

            <button class="btn btn-primary" @onclick="DoSomething">
                @T("BTN_CLICK_ME", "Haz clic aquí")
            </button>

            @if (showMessage)
            {
                <div class="alert alert-success mt-3">
                    @T("MSG_SUCCESS", "¡Operación exitosa!")
                </div>
            }
        </div>
    </div>

</RoleGuard>

@code {
    private bool showMessage = false;

    private void DoSomething()
    {
        showMessage = true;
    }

    // El componente se actualiza automáticamente al cambiar idioma
    // gracias a LanguageAwareComponentBase
}
```

### Ejemplo 2: Componente Reutilizable con Traducciones

```razor
<!-- ConfirmDialog.razor -->
@inherits LanguageAwareComponentBase

@if (IsVisible)
{
    <div class="modal fade show d-block" style="background-color: rgba(0,0,0,0.5);">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@T("CONFIRM_TITLE", "Confirmar")</h5>
                </div>
                <div class="modal-body">
                    <p>@Message</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" @onclick="OnCancel">
                        @T("BTN_CANCEL", "Cancelar")
                    </button>
                    <button class="btn btn-primary" @onclick="OnConfirm">
                        @T("BTN_CONFIRM", "Confirmar")
                    </button>
                </div>
            </div>
        </div>
    </div>
}

@code {
    [Parameter] public bool IsVisible { get; set; }
    [Parameter] public string Message { get; set; } = "";
    [Parameter] public EventCallback OnConfirm { get; set; }
    [Parameter] public EventCallback OnCancel { get; set; }
}
```

## Mejores Prácticas

### ✅ DO (Hacer)
- Heredar de `LanguageAwareComponentBase` para componentes que necesiten traducciones
- Usar siempre texto por defecto en `T("KEY", "Default Text")`
- Nombrar las etiquetas con MAYÚSCULAS_Y_GUIONES_BAJOS (BTN_SAVE, PAGE_TITLE)
- Desuscribirse del servicio si usas suscripción manual

### ❌ DON'T (No Hacer)
- No hardcodear textos sin el método `T()`
- No olvidar implementar `IDisposable` si te suscribes manualmente
- No usar nombres de etiquetas genéricos (BTN1, TEXT1)
- No acceder directamente a `SingletonSession.Instancia.currentLanguage` si necesitas reactivity

## Flujo del Sistema

1. Usuario selecciona idioma en `LanguageSelector`
2. `LanguageSelector` llama a `LanguageService.ChangeLanguage()`
3. `LanguageService` actualiza `UserSession.currentLanguage`
4. `LanguageService` dispara evento `OnLanguageChanged`
5. Todos los componentes suscritos reciben la notificación
6. Cada componente llama a `StateHasChanged()` y se re-renderiza
7. Los textos se actualizan con las nuevas traducciones

## Debugging

### Ver idioma actual
```csharp
var currentLanguage = LanguageService.CurrentLanguage;
Console.WriteLine($"Idioma: {currentLanguage?.Name}");
```

### Ver si existe traducción
```csharp
if (LanguageService.HasTranslation("BTN_SAVE"))
{
    Console.WriteLine("Traducción disponible");
}
```

### Ver todas las traducciones del idioma actual
```csharp
var translations = LanguageService.CurrentLanguage?.Translations;
foreach (var t in translations ?? new())
{
    Console.WriteLine($"{t.LabelName}: {t.TranslatedText}");
}
```

## Próximos Pasos

Una vez que el sistema esté probado y funcionando:
1. Agregar todas las etiquetas necesarias en `/gestionar-idiomas`
2. Crear traducciones para todos los idiomas soportados
3. Ir reemplazando textos hardcodeados por llamadas a `T()`
4. Migrar componentes existentes para heredar de `LanguageAwareComponentBase`

---

**Nota:** Este sistema es compatible con el patrón Observer del proyecto WinForms y mantiene la misma estructura de datos.
