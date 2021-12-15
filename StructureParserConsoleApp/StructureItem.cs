using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StructureParserConsoleApp
{
    public class StructureItem
    {
        public int ID { get; set; }
        public StructureItem ParentNode { get; set; }
        public string Name { get; set; }
        public string OriginalName { get; set; }
        public int Level { get; set; }
        public StructureNodeType StructureNodeType { get; set; }

        public override string ToString()
        {
            return $"{ID} - {Name} - {Level} - {Enum.GetName(typeof(StructureNodeType), this.StructureNodeType)}";
        }

    }
}
