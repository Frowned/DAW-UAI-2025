using System.Xml.Serialization;

namespace BE.Entities
{
    [XmlRoot("Permission")]
    public class Permission : RoleComponent
    {
        [XmlIgnore]
        public override IList<RoleComponent> Children
        {
            get { return new List<RoleComponent>(); }
        }

        public override void AddChild(RoleComponent c)
        {
        }

        public override void ClearChild()
        {
        }
    }
}
