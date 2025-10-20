using System.Text;
using System.Text.Json;
using System.Xml.Serialization;
using Microsoft.Extensions.Logging;

namespace WebUI.Services
{
    public class SerializationService
    {
        private readonly ILogger<SerializationService> _logger;

        public SerializationService(ILogger<SerializationService> logger)
        {
            _logger = logger;
        }

        public byte[] SerializeToJson<T>(IEnumerable<T> items)
        {
            try
            {
                var options = new JsonSerializerOptions
                {
                    WriteIndented = true,
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                };
                string json = JsonSerializer.Serialize(items, options);
                _logger.LogInformation("JSON serializado exitosamente para tipo {Type}", typeof(T).Name);
                return Encoding.UTF8.GetBytes(json);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al serializar a JSON para tipo {Type}", typeof(T).Name);
                throw new InvalidOperationException($"Error al serializar a JSON: {ex.Message}", ex);
            }
        }

        public byte[] SerializeToXml<T>(IEnumerable<T> items)
        {
            try
            {
                var list = items is List<T> concreteList ? concreteList : items.ToList();
                var serializer = new XmlSerializer(typeof(List<T>));
                using var memoryStream = new MemoryStream();
                using var writer = System.Xml.XmlWriter.Create(memoryStream, new System.Xml.XmlWriterSettings { Indent = true });
                serializer.Serialize(writer, list);
                _logger.LogInformation("XML serializado exitosamente para tipo {Type}", typeof(T).Name);
                return memoryStream.ToArray();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error al serializar a XML para tipo {Type}", typeof(T).Name);
                throw new InvalidOperationException($"Error al serializar a XML: {ex.Message}", ex);
            }
        }

        public async Task<List<T>> DeserializeFromJsonAsync<T>(Stream stream)
        {
            try
            {
                using var reader = new StreamReader(stream, Encoding.UTF8, detectEncodingFromByteOrderMarks: true, leaveOpen: true);
                string json = await reader.ReadToEndAsync();
                _logger.LogInformation("Contenido JSON leído: {Content}", json.Substring(0, Math.Min(200, json.Length)));

                var options = new JsonSerializerOptions
                {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
                    PropertyNameCaseInsensitive = true
                };
                var result = JsonSerializer.Deserialize<List<T>>(json, options);
                _logger.LogInformation("JSON deserializado exitosamente para tipo {Type}", typeof(T).Name);
                return result ?? new List<T>();
            }
            catch (JsonException ex)
            {
                _logger.LogError(ex, "Error de JSON al deserializar para tipo {Type}", typeof(T).Name);
                throw new JsonException($"Error en formato JSON: {ex.Message}", ex);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al deserializar JSON para tipo {Type}", typeof(T).Name);
                throw new InvalidOperationException($"Error al deserializar JSON: {ex.Message}", ex);
            }
        }

        public async Task<List<T>> DeserializeFromXmlAsync<T>(Stream stream)
        {
            try
            {
                // Copiar el stream a un MemoryStream de forma asíncrona
                using var memoryStream = new MemoryStream();
                await stream.CopyToAsync(memoryStream);
                memoryStream.Position = 0;
                
                var serializer = new XmlSerializer(typeof(List<T>));
                var result = serializer.Deserialize(memoryStream) as List<T>;
                _logger.LogInformation("XML deserializado exitosamente para tipo {Type}", typeof(T).Name);
                return result ?? new List<T>();
            }
            catch (InvalidOperationException ex)
            {
                _logger.LogError(ex, "Error de XML al deserializar para tipo {Type}", typeof(T).Name);
                throw new InvalidOperationException($"Error en formato XML: {ex.Message}", ex);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error inesperado al deserializar XML para tipo {Type}", typeof(T).Name);
                throw new InvalidOperationException($"Error al deserializar XML: {ex.Message}", ex);
            }
        }
    }
}


