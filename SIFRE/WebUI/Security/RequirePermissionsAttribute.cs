using System;
using BE.Enums;

namespace WebUI.Security
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
    public sealed class RequirePermissionsAttribute : Attribute
    {
        public PermissionsType[] Permissions { get; }

        public RequirePermissionsAttribute(params PermissionsType[] permissions)
        {
            Permissions = permissions ?? Array.Empty<PermissionsType>();
        }
    }
}
