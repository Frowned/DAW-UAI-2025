using BE.DTO;
using Infrastructure.Session;

namespace WebUI.Services
{
    /// <summary>
    /// Servicio de idioma para Blazor que adapta el patrón Observer de WinForms
    /// </summary>
    public class LanguageService
    {
        // Evento que notifica cuando cambia el idioma
        public event Action? OnLanguageChanged;

        private readonly UserSession _session;

        public LanguageService()
        {
            _session = SingletonSession.Instancia;
        }

        /// <summary>
        /// Obtiene el idioma actual de la sesión
        /// </summary>
        public LanguageDTO? CurrentLanguage => _session.currentLanguage;

        /// <summary>
        /// Cambia el idioma actual y notifica a todos los componentes suscritos
        /// </summary>
        public void ChangeLanguage(LanguageDTO language)
        {
            _session.currentLanguage = language;
            NotifyLanguageChanged();
        }

        /// <summary>
        /// Notifica a todos los componentes suscritos que el idioma ha cambiado
        /// </summary>
        public void NotifyLanguageChanged()
        {
            OnLanguageChanged?.Invoke();
        }

        /// <summary>
        /// Obtiene la traducción de una etiqueta en el idioma actual
        /// </summary>
        public string GetTranslation(string labelName, string defaultText = "")
        {
            if (CurrentLanguage?.Translations == null)
                return defaultText;

            var translation = CurrentLanguage.Translations
                .FirstOrDefault(t => t.LabelName == labelName);

            return translation?.TranslatedText ?? defaultText;
        }

        /// <summary>
        /// Verifica si existe una traducción para una etiqueta
        /// </summary>
        public bool HasTranslation(string labelName)
        {
            return CurrentLanguage?.Translations?.Any(t => t.LabelName == labelName) ?? false;
        }
    }
}
