using Microsoft.AspNetCore.Components;
using WebUI.Services;

namespace WebUI.Components
{
    /// <summary>
    /// Componente base que se actualiza automáticamente cuando cambia el idioma
    /// </summary>
    public abstract class LanguageAwareComponentBase : ComponentBase, IDisposable
    {
        [Inject]
        protected LanguageService LanguageService { get; set; } = default!;

        protected override void OnInitialized()
        {
            base.OnInitialized();

            // Suscribirse a cambios de idioma
            LanguageService.OnLanguageChanged += OnLanguageChanged;
        }

        /// <summary>
        /// Método que se ejecuta cuando cambia el idioma
        /// Fuerza la re-renderización del componente
        /// </summary>
        protected virtual void OnLanguageChanged()
        {
            InvokeAsync(StateHasChanged);
        }

        /// <summary>
        /// Obtiene la traducción de una etiqueta en el idioma actual
        /// </summary>
        protected string T(string labelName, string defaultText = "")
        {
            return LanguageService.GetTranslation(labelName, defaultText);
        }

        /// <summary>
        /// Verifica si existe una traducción para una etiqueta
        /// </summary>
        protected bool HasTranslation(string labelName)
        {
            return LanguageService.HasTranslation(labelName);
        }

        public void Dispose()
        {
            // Desuscribirse al destruir el componente
            LanguageService.OnLanguageChanged -= OnLanguageChanged;
        }
    }
}
