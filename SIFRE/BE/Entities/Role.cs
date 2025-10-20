using System.Xml.Serialization;

namespace BE.Entities
{
    [XmlRoot("Role")]
    public class Role : RoleComponent
    {
        private IList<RoleComponent> _components;

        [XmlIgnore]
        public override IList<RoleComponent> Children
        {
            get
            {
                return _components;
            }
        }

        public Role()
        {
            _components = new List<RoleComponent>();
        }

        public override void AddChild(RoleComponent c)
        {
            _components.Add(c);
        }

        public override void ClearChild()
        {
            _components = new List<RoleComponent>();
        }
    }
}
