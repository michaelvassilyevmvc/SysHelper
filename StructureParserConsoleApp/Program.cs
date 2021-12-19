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
        private static int _levelValue = 0;
        private static bool _predRowTitle = true;


        //public static List<StructureItem> Chapters { get; set; }
        //public static List<StructureItem> KindOfSportList { get; set; }
        public static List<StructureItem> StructureList { get; set; }
        public static StructureItem LastChapterItem { get; set; }

        static void Main(string[] args)
        {
            string filePath = @"c:\doc_source.docx";
            //Chapters = new List<StructureItem>();
            //KindOfSportList = new List<StructureItem>();
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
                            IEnumerable<TableCell> cells = row.Descendants<TableCell>().ToList();

                            if (IsCaption(cells) || cells.Count() > 1)
                            {
                                if (_predRowTitle) _levelValue++;
                                _predRowTitle = false;
                                continue;
                            }

                            if (!_predRowTitle) _levelValue--;


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

                                continue;
                            }

                            if (isKindOfSport(row.InnerText))
                            {
                                StructureList.Add(new StructureItem
                                {
                                    ID = _id++,
                                    Level = _levelValue,
                                    ParentNode = StructureList.Where(x => x.Level == 0).Last(),
                                    OriginalName = row.InnerText,
                                    Name = GetKindOfSportName(row.InnerText),
                                    StructureNodeType = StructureNodeType.CommonKindOfSport
                                });

                                //Сделать проверку на вид спорта

                                continue;
                            }






                        }
                    }
                }
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
