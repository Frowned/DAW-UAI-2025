using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Infrastructure.Interfaces.DAL;
using Infrastructure.Interfaces.BLL;
using Infrastructure.Helpers;
using BE.Entities;
using BE.DTO;

namespace BLL
{
    public class UserBLL : IUserBLL
    {
        IUserDAL _userDAL;
        public UserBLL(IUserDAL userDAL)
        {
            _userDAL = userDAL;
        }

        public void AssignRole(Role role, UserDTO user)
        {
            _userDAL.AssignRole(role, user);
        }

        public bool Block(string username)
        {
            return _userDAL.Block(username);
        }

        public List<UserDTO> GetAllUsers()
        {
            return _userDAL.GetAllUsers();
        }

        public UserDTO? GetByUsernameAndPassword(string username, string password)
        {
            return _userDAL.GetByUsernameAndPassword(username, password);
        }

        public void UpdateUserLanguage(Guid userId, int languageId)
        {
            _userDAL.UpdateUserLanguage(userId, languageId);
        }

        public bool IsPasswordExpired(UserDTO user)
        {
            const int PASSWORD_EXPIRY_DAYS = 90;
            return (DateTime.Now - user.PasswordLastUpdatedAt).TotalDays > PASSWORD_EXPIRY_DAYS;
        }

        public void UpdatePassword(string username, string newEncryptedPassword)
        {
            _userDAL.UpdatePassword(username, newEncryptedPassword);
        }

        public bool ValidatePassword(string password)
        {
            return PasswordHelper.IsValidPassword(password);
        }
    }
}
