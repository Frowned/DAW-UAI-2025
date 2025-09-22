using System.Text.RegularExpressions;

namespace Infrastructure.Helpers
{
    public static class PasswordHelper
    {
        private const string PASSWORD_PATTERN = @"^(?=.*[A-Z])(?=.*\d).{8,}$";

        public static bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password))
                return false;

            var regex = new Regex(PASSWORD_PATTERN);
            return regex.IsMatch(password);
        }

        public static string GetPasswordRequirements()
        {
            return "La contraseña debe tener al menos 8 caracteres, incluyendo al menos 1 mayúscula y 1 número.";
        }
    }
}