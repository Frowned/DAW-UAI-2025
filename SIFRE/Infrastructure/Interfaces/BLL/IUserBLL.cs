using BE.DTO;
using BE.Entities;

namespace Infrastructure.Interfaces.BLL
{
    public interface IUserBLL
    {
        UserDTO? GetByUsernameAndPassword(string username, string password);
        bool Block(string username);
        void UpdateUserLanguage(Guid userId, int languageId);
        List<UserDTO> GetAllUsers();
        void AssignRole(Role role, UserDTO user);
        void AddUser(string username, string email, string firstName, string lastName, string password, int roleId, int languageId);
    }
}
