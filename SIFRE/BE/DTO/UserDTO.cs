using BE.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE.DTO
{
    public class UserDTO
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        // No incluimos Password por razones de seguridad.
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsBlocked { get; set; }
        public int LanguageId { get; set; }
        public int RoleId { get; set; }
        public long Points { get; set; }
        public DateTime PasswordLastUpdatedAt { get; set; }
        public Role UserRole { get; set; }
    }
}
