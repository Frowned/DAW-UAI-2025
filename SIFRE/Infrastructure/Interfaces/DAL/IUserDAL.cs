using BE.DTO;
using BE.Entities;

namespace Infrastructure.Interfaces.DAL
{
    public interface IUserDAL
    {
        UserDTO? GetByUsernameAndPassword(string username, string password);
        bool Block(string username);
        void UpdateUserLanguage(Guid userId, int languageId);
        List<UserDTO> GetAllUsers();
        void AssignRole(Role role, UserDTO user);
        void UpdatePassword(string username, string newEncryptedPassword);
    }
}
