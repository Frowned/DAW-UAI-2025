using BE.DTO;
using Infrastructure.Interfaces.BLL;
using Microsoft.AspNetCore.Mvc;
using WebUI.Services;

namespace WebUI.Controller
{
    [ApiController]
    [Route("api/serialization")]
    public class SerializationController : ControllerBase
    {
        private readonly SerializationService _serializationService;
        private readonly IProductBLL _productBLL;

        public SerializationController(SerializationService serializationService, IProductBLL productBLL)
        {
            _serializationService = serializationService;
            _productBLL = productBLL;
        }

        [HttpGet("products/export/json")]
        public IActionResult ExportProductsJson()
        {
            var products = _productBLL.GetProducts(false, true);
            var bytes = _serializationService.SerializeToJson(products);
            return File(bytes, "application/json", $"products_{DateTime.Now:yyyyMMdd_HHmmss}.json");
        }

        [HttpGet("products/export/xml")]
        public IActionResult ExportProductsXml()
        {
            var products = _productBLL.GetProducts(false, true);
            var bytes = _serializationService.SerializeToXml(products);
            return File(bytes, "application/xml", $"products_{DateTime.Now:yyyyMMdd_HHmmss}.xml");
        }

        [HttpPost("products/import/json")]
        public async Task<IActionResult> ImportProductsJson([FromForm] IFormFile file, [FromQuery] bool persist = false)
        {
            if (file == null) return BadRequest("No se recibió ningún archivo.");
            using var stream = file.OpenReadStream();
            var products = await _serializationService.DeserializeFromJsonAsync<ProductDTO>(stream);
            int persisted = 0;
            if (persist)
            {
                foreach (var product in products)
                {
                    try
                    {
                        product.Id = 0;
                        _productBLL.AddProduct(product);
                        persisted++;
                    }
                    catch
                    {
                        // ignorar errores individuales para continuar
                    }
                }
            }
            return Ok(new { count = products.Count, persisted });
        }

        [HttpPost("products/import/xml")]
        public async Task<IActionResult> ImportProductsXml([FromForm] IFormFile file, [FromQuery] bool persist = false)
        {
            if (file == null) return BadRequest("No se recibió ningún archivo.");
            using var stream = file.OpenReadStream();
            var products = await _serializationService.DeserializeFromXmlAsync<ProductDTO>(stream);
            int persisted = 0;
            if (persist)
            {
                foreach (var product in products)
                {
                    try
                    {
                        product.Id = 0;
                        _productBLL.AddProduct(product);
                        persisted++;
                    }
                    catch
                    {
                        
                    }
                }
            }
            return Ok(new { count = products.Count, persisted });
        }
    }
}


