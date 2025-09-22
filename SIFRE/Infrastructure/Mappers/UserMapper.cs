using BE.DTO;
using BE.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Mappers
{
    public static class UsersMapper
    {
        public static User DtoToUser(UserDTO dto)
        {
            return new User
            {
                Id = dto.Id,
                Username = dto.Username
            };
        }

        public static UserDTO? MapToUser(DataRow row)
        {
            if (row == null)
                return null;

            return new UserDTO
            {
                Id = Guid.Parse(row["Id"].ToString()),
                Username = row["Username"].ToString(),
                IsBlocked = Convert.ToBoolean(row["IsBlocked"]),
                Email = row["Email"].ToString(),
                FirstName = row["FirstName"].ToString(),
                LastName = row["LastName"].ToString(),
                LanguageId = int.Parse(row["LanguageId"].ToString()),
                RoleId = int.Parse(row["RoleId"].ToString()),
                Points = long.Parse(row["Points"].ToString()),
                PasswordLastUpdatedAt = Convert.ToDateTime(row["PasswordLastUpdatedAt"])
            };
        }
    }
}
