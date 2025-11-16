using BE.Base;
using System.Xml.Serialization;

namespace BE.Entities
{
    [XmlRoot("Log")]
    public class Log : BaseEntity
    {
        [XmlElement("Module")]
        public string Module { get; set; }
        
        [XmlElement("Message")]
        public string Message { get; set; }
        
        [XmlElement("Type")]
        public LogType Type { get; set; }

    }

    public enum LogType
    {
        Info,
        Warning,
        Error,
        Critical
    }
}
