using System.Text.RegularExpressions;

namespace Infrastructure.Helpers
{
    public static class PasswordValidationHelper
    {
        private const int MinLength = 8;

        public static (bool IsValid, string ErrorMessage) ValidatePassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password))
            {
                return (false, "La contraseña es obligatoria.");
            }

            if (password.Length < MinLength)
            {
                return (false, $"La contraseña debe tener al menos {MinLength} caracteres.");
            }

            if (!Regex.IsMatch(password, @"[A-Z]"))
            {
                return (false, "La contraseña debe contener al menos una letra mayúscula.");
            }

            if (!Regex.IsMatch(password, @"\d"))
            {
                return (false, "La contraseña debe contener al menos un número.");
            }

            return (true, string.Empty);
        }

        public static string GetPasswordRequirements()
        {
            return $"La contraseña debe tener al menos {MinLength} caracteres, incluir una letra mayúscula y al menos un número.";
        }
    }
}

