using DevExpress.Web.ASPxTreeList;
using DocumentFormat.OpenXml.Wordprocessing;
using MFKSHelper.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace MFKSHelper.Helpers
{
    public static class StructureHelpers
    {
        public static bool isChapter(string line)
        {
            Match match = Regex.Match(line, @"^(\s*Раздел\s*\d+\s*(-|–)+\s*)(.+)");
            return match.Success;
        }

        public static bool isKindOfSport(string line)
        {
            Match match = Regex.Match(line, @"^(\s*\d+.\s*)(.*)");
            return match.Success;
        }

        public static string GetChapterName(string line)
        {
            return Regex.Match(line, @"^(\s*Раздел\s*\d+\s*(-|–)+\s*)(.+)").Groups[3].Value.Trim();
        }

        public static string GetKindOfSportName(string line)
        {
            return Regex.Match(line, @"^(\s*\d+.\s*)(.*)").Groups[2].Value.Trim();
        }

        public static bool IsCaption(IEnumerable<TableCell> cells)
        {
            if (cells.Any(x => x.InnerText.ToLower().Trim() == @"Организатор".Trim().ToLower())) return true;

            string result = string.Join(null, cells.Select(x => x.InnerText.Trim()));
            if (result == "123456789") return true;

            return false;
        }

        public static void MoveNodes(List<TreeListNode> nodes, int parentID, List<StructureItem> data)
        {
            foreach (var node in nodes)
            {
                if (nodes.Where(x => (int)x.GetValue("ID") == (int)node.GetValue("ParentID")).Count() == 0)
                {
                    var id = (int)node.GetValue("ID");
                    var processedNode = data.Find(x => x.ID == id);
                    processedNode.ParentNode = data.Find(x => x.ID == parentID);
                }
            }
        }

        public static void MoveNode(int nodeID, int parentID, List<StructureItem> data)
        {
            data.Find(x => x.ID == nodeID).ParentNode = data.Find(x=>x.ID == parentID) ;
        }
    }
}
