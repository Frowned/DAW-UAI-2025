using Microsoft.AspNetCore.Mvc;
using Infrastructure.Interfaces.BLL;
using BE.Entities;
using BE.DTO;

namespace WebServices.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserBLL _userBLL;

        public UserController(IUserBLL userBLL)
        {
            _userBLL = userBLL;
        }

        [HttpGet]
        public ActionResult<List<UserDTO>> GetAllUsers()
        {
            try
            {
                var users = _userBLL.GetAllUsers();
                return Ok(users);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPost("authenticate")]
        public ActionResult<UserDTO> Authenticate([FromBody] LoginRequest request)
        {
            try
            {
                var user = _userBLL.GetByUsernameAndPassword(request.Username, request.Password);
                if (user == null)
                {
                    return Unauthorized("Credenciales inválidas");
                }
                return Ok(user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPost("{username}/block")]
        public ActionResult BlockUser(string username)
        {
            try
            {
                var result = _userBLL.Block(username);
                if (result)
                {
                    return Ok("Usuario bloqueado exitosamente");
                }
                return NotFound("Usuario no encontrado");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPost("assign-role")]
        public ActionResult AssignRole([FromBody] AssignRoleRequest request)
        {
            try
            {
                _userBLL.AssignRole(request.Role, request.User);
                return Ok("Rol asignado exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPut("{userId}/language")]
        public ActionResult UpdateUserLanguage(Guid userId, [FromBody] UpdateLanguageRequest request)
        {
            try
            {
                _userBLL.UpdateUserLanguage(userId, request.LanguageId);
                return Ok("Idioma actualizado exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }
    }

    public class LoginRequest
    {
        public string Username { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }

    public class AssignRoleRequest
    {
        public Role Role { get; set; } = new Role();
        public UserDTO User { get; set; } = new UserDTO();
    }

    public class UpdateLanguageRequest
    {
        public int LanguageId { get; set; }
    }
}