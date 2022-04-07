using System;
using System.Collections.Generic;

namespace MFKSHelper.Models
{
    public class StructureItem
    {
        public int ID { get; set; }
        public StructureItem ParentNode { get; set; }
        public string Name { get; set; }
        public string OriginalName { get; set; }
        public int Level { get; set; }
        public StructureNodeType StructureNodeType { get; set; }
        public List<Compitation> Compitations { get; set; }
        public int MfksID { get; set; } = 0;
        public int MfksParentID { get; set; } = 0;

        public override string ToString()
        {
            return $"{ID} - {Name} - {Level} - {Enum.GetName(typeof(StructureNodeType), this.StructureNodeType)}";
        }

    }
}
