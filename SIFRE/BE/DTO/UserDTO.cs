using BE.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json.Serialization;
using System.Xml.Serialization;

namespace BE.DTO
{
    [XmlRoot("UserDTO")]
    public class UserDTO
    {
        [JsonPropertyName("id")]
        [XmlElement("Id")]
        public Guid Id { get; set; }

        [JsonPropertyName("email")]
        [XmlElement("Email")]
        public string Email { get; set; }

        [JsonPropertyName("username")]
        [XmlElement("Username")]
        public string Username { get; set; }

        // No incluimos Password por razones de seguridad.
        [JsonPropertyName("firstName")]
        [XmlElement("FirstName")]
        public string FirstName { get; set; }

        [JsonPropertyName("lastName")]
        [XmlElement("LastName")]
        public string LastName { get; set; }

        [JsonPropertyName("isBlocked")]
        [XmlElement("IsBlocked")]
        public bool IsBlocked { get; set; }

        [JsonPropertyName("languageId")]
        [XmlElement("LanguageId")]
        public int LanguageId { get; set; }

        [JsonPropertyName("roleId")]
        [XmlElement("RoleId")]
        public int RoleId { get; set; }

        [JsonPropertyName("points")]
        [XmlElement("Points")]
        public long Points { get; set; }

        [JsonPropertyName("userRole")]
        [XmlElement("UserRole")]
        public Role UserRole { get; set; }
    }
}
