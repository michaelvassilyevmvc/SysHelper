using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace StructureParserConsoleApp
{
    class Program
    {
        public static List<StructureItem> StructureList { get; set; }
        public static StructureItem LastItem { get; set; }

        static void Main(string[] args)
        {
            string filePath = @"c:\doc_source_light.docx";
            
            StructureList = new List<StructureItem>();

            int _id = 1;


            if (File.Exists(filePath))
            {
                using (var doc = WordprocessingDocument.Open(filePath, true))
                {
                    List<Table> tables = doc.MainDocumentPart.Document.Body.Elements<Table>().ToList();

                    foreach (Table table in tables)
                    {
                        IEnumerable<TableRow> rows = table.Elements<TableRow>();
                        foreach (TableRow row in rows)
                        {
                            List<TableCell> cells = row.Descendants<TableCell>().ToList();

                            if (IsCaption(cells))
                            {
                                continue;
                            }

                            if (cells.Count() == 9)
                            {
                                Compitation compitation = new Compitation
                                {
                                    Name = cells[0].InnerText.Trim(),
                                    DateAndPlace = cells[1].InnerText.Trim(),
                                    CompetitorFirm = cells[2].InnerText.Trim(),
                                    Count = cells[3].InnerText.Trim(),
                                    AthleteCount = cells[4].InnerText.Trim(),
                                    TrainerCount = cells[5].InnerText.Trim(),
                                    JudgeCount = cells[6].InnerText.Trim(),
                                    OrganizerFirm = cells[7].InnerText.Trim(),
                                    SendingFirm = cells[8].InnerText.Trim()
                                };

                                if (LastItem.Compitations == null) LastItem.Compitations = new List<Compitation>();
                                LastItem.Compitations.Add(compitation);
                                continue;
                            }

                            //todo: get 



                            if (isChapter(row.InnerText))
                            {
                                StructureList.Add(new StructureItem
                                {
                                    ID = _id++,
                                    Level = 0,
                                    ParentNode = null,
                                    OriginalName = row.InnerText,
                                    Name = GetChapterName(row.InnerText),
                                    StructureNodeType = StructureNodeType.Chapter
                                    
                                });

                                LastItem = StructureList.Last();
                                continue;
                            }

                            if (isKindOfSport(row.InnerText))
                            {
                                if(LastItem.StructureNodeType == StructureNodeType.NotUndefined && StructureList.Any(x=>x.StructureNodeType == StructureNodeType.CommonKindOfSport))
                                {
                                    LastItem = StructureList.Last(x => x.StructureNodeType == StructureNodeType.CommonKindOfSport);
                                }

                                StructureList.Add(new StructureItem
                                {
                                    ID = _id++,
                                    Level = LastItem.Level == 0 ? LastItem.Level+1 : LastItem.Level,
                                    ParentNode = LastItem.Level == 0 ? LastItem : LastItem.ParentNode,
                                    OriginalName = row.InnerText,
                                    Name = GetKindOfSportName(row.InnerText),
                                    StructureNodeType = StructureNodeType.CommonKindOfSport
                                });

                                LastItem = StructureList.Last();
                                //Сделать проверку на вид спорта

                                continue;
                            }

                            StructureList.Add(new StructureItem
                            {
                                ID = _id++,
                                Level = LastItem.Level + 1,
                                ParentNode = LastItem,
                                OriginalName = row.InnerText,
                                Name = row.InnerText,
                                StructureNodeType = StructureNodeType.NotUndefined
                            });

                        }
                    }
                }
            }

            foreach (var item in StructureList)
            {
                System.Console.WriteLine(item);
            }


        }

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
    }
}
