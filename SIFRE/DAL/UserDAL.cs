using DAL.Helper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Interfaces.DAL;
using BE.Entities;
using Infrastructure.Mappers;
using BE.DTO;
using Infrastructure.Session;

namespace DAL
{
    public class UserDAL : IUserDAL
    {
        private IRoleDAL roleDAL;
        private DatabaseHelper dbHelper;

        public UserDAL(IRoleDAL roleDAL)
        {
            dbHelper = new DatabaseHelper();
            this.roleDAL = roleDAL;
        }

        public UserDTO? GetByUsernameAndPassword(string username, string password)
        {
            string query = "SELECT * FROM Users WHERE Username = @Username AND Password = @Password";
            SqlParameter[] parameters =
            [
            new SqlParameter("@Username", username),
            new SqlParameter("@Password", password)
            ];

            DataSet ds = dbHelper.ExecuteDataSet(query, CommandType.Text, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                var user = UsersMapper.MapToUser(ds.Tables[0].Rows[0]);
                var roles = roleDAL.GetRoles();
                var role = roles.First(f => f.Id == user.RoleId);
                roleDAL.FillRoleComponent(role);
                user.UserRole = role;
                return user;
            }
            else
                return null;
        }

        public bool Block(string username)
        {
            string query = "UPDATE Users SET IsBlocked = @IsBlocked WHERE Username = @Username";
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@IsBlocked", 1),
            new SqlParameter("@Username", username)
            };

            int affectedRows = dbHelper.ExecuteNonQuery(query, CommandType.Text, parameters);
            return affectedRows > 0;
        }

        public void UpdateUserLanguage(Guid userId, int languageId)
        {
            string query = "UPDATE Users SET LanguageId = @LanguageId WHERE Id = @Id";
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@Id", userId),
            new SqlParameter("@LanguageId", languageId)
            };
            dbHelper.ExecuteNonQuery(query, CommandType.Text, parameters);
            SingletonSession.Instancia.User.LanguageId = languageId;
        }

        public List<UserDTO> GetAllUsers()
        {
            string query = "SELECT * FROM Users";
            SqlParameter[] parameters = [];
            List<UserDTO> list = new List<UserDTO>();
            DataSet ds = dbHelper.ExecuteDataSet(query, CommandType.Text, parameters);
            var roles = roleDAL.GetRoles();
            if (ds.Tables[0].Rows.Count > 0)
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    var user = UsersMapper.MapToUser(item);
                    list.Add(user);
                }
            return list;
        }

        public void AssignRole(Role role, UserDTO user)
        {
            string query = "UPDATE Users SET RoleId = @RoleId WHERE Username = @Username";
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RoleId", role.Id),
            new SqlParameter("@Username", user.Username)
            };
            dbHelper.ExecuteNonQuery(query, CommandType.Text, parameters);
            if (user.Id == SingletonSession.Instancia.User.Id) {
                roleDAL.FillRoleComponent(role);
                SingletonSession.Instancia.User.UserRole = role;
            }
        }

        public void UpdatePassword(string username, string newEncryptedPassword)
        {
            string query = "UPDATE Users SET Password = @Password, PasswordLastUpdatedAt = GETDATE() WHERE Username = @Username";
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@Password", newEncryptedPassword),
            new SqlParameter("@Username", username)
            };
            dbHelper.ExecuteNonQuery(query, CommandType.Text, parameters);
        }
    }
}
