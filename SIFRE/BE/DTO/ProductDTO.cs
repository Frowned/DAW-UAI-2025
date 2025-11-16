using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json.Serialization;
using System.Xml.Serialization;

namespace BE.DTO
{
    [XmlRoot("ProductDTO")]
    public class ProductDTO
    {
        [JsonPropertyName("id")]
        [XmlElement("Id")]
        public int Id { get; set; }

        [JsonPropertyName("productName")]
        [XmlElement("ProductName")]
        public string ProductName { get; set; }

        [JsonPropertyName("description")]
        [XmlElement("Description")]
        public string Description { get; set; }

        [JsonPropertyName("points")]
        [XmlElement("Points")]
        public long Points { get; set; }

        [JsonPropertyName("category")]
        [XmlElement("Category")]
        public string Category { get; set; }

        [JsonPropertyName("startDate")]
        [XmlElement("StartDate")]
        public DateTime? StartDate { get; set; }

        [JsonPropertyName("endDate")]
        [XmlElement("EndDate")]
        public DateTime? EndDate { get; set; }
    }
}
