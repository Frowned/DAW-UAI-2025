using BE.Enums;
using System.Xml.Serialization;

namespace BE.Entities
{
    [XmlInclude(typeof(Role))]
    [XmlInclude(typeof(Permission))]
    public abstract class RoleComponent
    {
        [XmlIgnore]
        public abstract IList<RoleComponent> Children { get; }

        public abstract void AddChild(RoleComponent c);

        public abstract void ClearChild();

        [XmlElement("Id")]
        public int Id { get; set; }

        [XmlElement("Name")]
        public string Name { get; set; }

        [XmlElement("Permission")]
        public PermissionsType? Permission { get; set; }
    }
}
