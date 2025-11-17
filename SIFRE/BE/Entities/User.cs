using System.Data;

namespace BE.Entities
{
    public class User : BaseGuidEntity
    {
        public string Email { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsBlocked { get; set; }
        public long Points { get; set; }
        public DateTime PasswordLastUpdatedAt { get; set; }
        public Language Language { get; set; }
        public RoleComponent Role { get; set; }
    }
}
