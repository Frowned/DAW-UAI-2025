using Microsoft.AspNetCore.Mvc;
using Infrastructure.Interfaces.BLL;
using BLL;
using BE.Enums;
using BE.Entities;

namespace WebUI.Controller
{
    [ApiController]
    [Route("api/pdf")]
    public class PdfExportController : ControllerBase
    {
        private readonly ILogBLL _logBLL;
        private readonly IProductBLL _productBLL;

        public PdfExportController(ILogBLL logBLL, IProductBLL productBLL)
        {
            _logBLL = logBLL;
            _productBLL = productBLL;
        }

        [HttpPost("bitacora-eventos")]
        public IActionResult ExportBitacoraEventos([FromBody] BitacoraEventosRequest request)
        {
            try
            {
                var logs = _logBLL.GetLogs(
                    request.TypeFilter,
                    string.IsNullOrWhiteSpace(request.ModuleFilter) ? null : request.ModuleFilter,
                    request.DateFrom,
                    request.DateTo
                );

                if (logs == null || !logs.Any())
                {
                    return NotFound("No hay eventos para exportar.");
                }

                var pdfBytes = PdfExportService.CrearReportePDF(logs);
                var fileName = $"bitacora-eventos-{DateTime.Now:yyyyMMddHHmmss}.pdf";

                return File(pdfBytes, "application/pdf", fileName);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al generar PDF: {ex.Message}");
            }
        }

        [HttpPost("bitacora-productos")]
        public IActionResult ExportBitacoraProductos([FromBody] BitacoraProductosRequest request)
        {
            try
            {
                var productIdFilter = string.IsNullOrWhiteSpace(request.ProductFilter) ? null : request.ProductFilter;
                var productLogs = _logBLL.GetLogs(productIdFilter, request.DateFrom, request.DateTo);

                // Aplicar filtro de estado si está definido
                if (request.StatusFilter.HasValue)
                {
                    productLogs = productLogs.Where(p => p.IsBlocked == request.StatusFilter.Value).ToList();
                }

                if (productLogs == null || !productLogs.Any())
                {
                    return NotFound("No hay registros de productos para exportar.");
                }

                var pdfBytes = PdfExportService.CrearReportePDF(productLogs);
                var fileName = $"bitacora-productos-{DateTime.Now:yyyyMMddHHmmss}.pdf";

                return File(pdfBytes, "application/pdf", fileName);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al generar PDF: {ex.Message}");
            }
        }
    }

    public class BitacoraEventosRequest
    {
        public string ModuleFilter { get; set; }
        public LogType? TypeFilter { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
    }

    public class BitacoraProductosRequest
    {
        public string ProductFilter { get; set; }
        public bool? StatusFilter { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
    }
}
