using MFKSHelper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System.IO;
using MFKSHelper.Helpers;
using DevExpress.Web.ASPxTreeList;

namespace MFKSHelper
{
    public partial class TreeListStructurePage : System.Web.UI.Page
    {
        public List<StructureItem> StructureList
        {
            get
            {
                if (Session["structure"] == null)
                {
                    return new List<StructureItem>();
                }
                return Session["structure"] as List<StructureItem>;
            }
            set
            {
                Session["structure"] = value;
            }

        }
        public  StructureItem LastItem { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                                if (StructureHelpers.IsCaption(cells))
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



                                if (StructureHelpers.isChapter(row.InnerText))
                                {
                                    StructureList.Add(new StructureItem
                                    {
                                        ID = _id++,
                                        Level = 0,
                                        ParentNode = null,
                                        OriginalName = row.InnerText,
                                        Name = StructureHelpers.GetChapterName(row.InnerText),
                                        StructureNodeType = StructureNodeType.Chapter

                                    });

                                    LastItem = StructureList.Last();
                                    continue;
                                }

                                if (StructureHelpers.isKindOfSport(row.InnerText))
                                {
                                    if (LastItem.StructureNodeType == StructureNodeType.NotUndefined && StructureList.Any(x => x.StructureNodeType == StructureNodeType.CommonKindOfSport))
                                    {
                                        LastItem = StructureList.Last(x => x.StructureNodeType == StructureNodeType.CommonKindOfSport);
                                    }

                                    StructureList.Add(new StructureItem
                                    {
                                        ID = _id++,
                                        Level = LastItem.Level == 0 ? LastItem.Level + 1 : LastItem.Level,
                                        ParentNode = LastItem.Level == 0 ? LastItem : LastItem.ParentNode,
                                        OriginalName = row.InnerText,
                                        Name = StructureHelpers.GetKindOfSportName(row.InnerText),
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

                
            }

            if (StructureList != null && StructureList.Count() > 0)
            {
                tlStructure.DataBind();
            }
        }

        protected void tlStructure_DataBinding(object sender, EventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            tree.DataSource = StructureList.Select(x=>new { ID = x.ID, ParentID = x.ParentNode?.ID ?? 0, Name = x.Name, Count = x.Compitations?.Count ?? 0}).ToList();
        }

        protected void tlStructure_ProcessDragNode(object sender, TreeListNodeDragEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;

            e.Handled = true;
            var nodes = tree.GetSelectedNodes();

            if (nodes.Count == 0)
                StructureHelpers.MoveNode(Convert.ToInt32(e.Node.Key), Convert.ToInt32(e.NewParentNode.Key),StructureList);
            else
                StructureHelpers.MoveNodes(nodes, Convert.ToInt32(e.NewParentNode.Key), StructureList);
        }

        protected void tlStructure_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            e.Cell.CssClass = "customClass";
        }
    }
}