using Microsoft.AspNetCore.Mvc;
using Infrastructure.Interfaces.BLL;
using BE.Entities;
using BE.DTO;
using BE.Enums;

namespace WebServices.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NominationController : ControllerBase
    {
        private readonly INominationBLL _nominationBLL;

        public NominationController(INominationBLL nominationBLL)
        {
            _nominationBLL = nominationBLL;
        }

        [HttpPost]
        public ActionResult NominateCollaborator([FromBody] Nomination nomination)
        {
            try
            {
                _nominationBLL.NominateCollaborator(nomination);
                return Ok("Nominación creada exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("users")]
        public ActionResult<List<User>> GetUsers()
        {
            try
            {
                var users = _nominationBLL.GetUsers();
                return Ok(users);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("recognition-categories")]
        public ActionResult<List<RecognitionCategory>> GetRecognitionCategories()
        {
            try
            {
                var categories = _nominationBLL.GetRecognitionCategories();
                return Ok(categories);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("user/{userId}/count")]
        public ActionResult<int> GetUserNominationsCount(Guid userId, [FromQuery] DateTime fromDate)
        {
            try
            {
                var count = _nominationBLL.GetUserNominationsCount(userId, fromDate);
                return Ok(count);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("{nominationId}/comments")]
        public ActionResult<List<NominationCommentDTO>> GetNominationComments(int nominationId)
        {
            try
            {
                var comments = _nominationBLL.GetNominationComments(nominationId);
                return Ok(comments);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("user/{userId}")]
        public ActionResult<List<NominationDTO>> GetNominationsByUser(Guid userId)
        {
            try
            {
                var nominations = _nominationBLL.GetNominationsByUser(userId);
                return Ok(nominations);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPost("{nominationId}/comments")]
        public ActionResult AddNominationComment(int nominationId, [FromBody] AddCommentRequest request)
        {
            try
            {
                var comment = new NominationComment
                {
                    NominationId = nominationId,
                    Comment = request.Comment,
                    CreatedBy = request.CreatedBy,
                    CreatedAt = DateTime.Now
                };
                _nominationBLL.AddNominationComment(comment);
                return Ok("Comentario agregado exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpPut("{nominationId}")]
        public ActionResult UpdateNomination(int nominationId, [FromBody] UpdateNominationRequest request)
        {
            try
            {
                _nominationBLL.UpdateNomination(nominationId, request.Status, request.Comment);
                return Ok("Nominación actualizada exitosamente");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }

        [HttpGet("history")]
        public ActionResult<List<NominationHistoryDTO>> GetNominationHistory(
            [FromQuery] DateTime dateFrom,
            [FromQuery] DateTime dateTo,
            [FromQuery] Guid? collaboratorId = null,
            [FromQuery] int? recognitionTypeId = null)
        {
            try
            {
                var history = _nominationBLL.GetNominationHistory(dateFrom, dateTo, collaboratorId, recognitionTypeId);
                return Ok(history);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor: {ex.Message}");
            }
        }
    }

    public class AddCommentRequest
    {
        public string Comment { get; set; } = string.Empty;
        public Guid CreatedBy { get; set; }
    }

    public class UpdateNominationRequest
    {
        public NominationStatuses Status { get; set; }
        public string Comment { get; set; } = string.Empty;
    }
}