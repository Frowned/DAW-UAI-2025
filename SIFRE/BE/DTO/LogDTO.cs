using BE.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json.Serialization;
using System.Xml.Serialization;

namespace BE.DTO
{
    [XmlRoot("LogDTO")]
    public class LogDTO
    {
        [JsonPropertyName("id")]
        [XmlElement("Id")]
        public int Id { get; set; }

        [JsonPropertyName("module")]
        [XmlElement("Module")]
        public string Module { get; set; }

        [JsonPropertyName("message")]
        [XmlElement("Message")]
        public string Message { get; set; }

        [JsonPropertyName("type")]
        [XmlElement("Type")]
        public LogType Type { get; set; }

        [JsonPropertyName("createdBy")]
        [XmlElement("CreatedBy")]
        public string CreatedBy { get; set; }

        [JsonPropertyName("createdAt")]
        [XmlElement("CreatedAt")]
        public DateTime CreatedAt { get; set; }
    }
}
