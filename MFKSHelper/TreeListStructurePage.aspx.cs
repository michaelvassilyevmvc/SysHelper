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
using DevExpress.Web;

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

                                    if (LastItem.Compitations == null) 
                                        LastItem.Compitations = new List<Compitation>();

                                    var lstItm = StructureList.Last();

                                    if (lstItm.Compitations == null) lstItm.Compitations = new List<Compitation>();

                                    lstItm.Compitations.Add(compitation);
                                    continue;
                                }

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
                gvData.DataBind();
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

        protected void gvData_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            if(tlStructure.FocusedNode == null)
            {
                grid.DataSource = null;
            }
            else
            {
                var node = StructureList.Find(x => x.ID.ToString() == tlStructure.FocusedNode.Key);
                grid.DataSource = node.Compitations;
            }
        }

        protected void gvData_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var node = StructureList.Find(x => x.ID.ToString() == tlStructure.FocusedNode.Key);
            node.Compitations = node.Compitations.Where(x => x.Name != e.Values["Name"].ToString()).ToList();
            e.Cancel = true;
        }

        protected void gvData_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string oldName = e.OldValues["Name"].ToString();
            var node = StructureList.Find(x => x.ID.ToString() == tlStructure.FocusedNode.Key);
            var compitations = node.Compitations;
            var oldCompitation = compitations.Find(x => x.Name == oldName);
                oldCompitation.Name = e.NewValues["Name"]?.ToString();
                oldCompitation.AthleteCount = e.NewValues["AthleteCount"]?.ToString();
                oldCompitation.CompetitorFirm = e.NewValues["CompetitorFirm"]?.ToString() ;
                oldCompitation.Count = e.NewValues["Count"]?.ToString();
                oldCompitation.DateAndPlace = e.NewValues["DateAndPlace"]?.ToString();
                oldCompitation.JudgeCount = e.NewValues["JudgeCount"]?.ToString();
                oldCompitation.OrganizerFirm = e.NewValues["OrganizerFirm"]?.ToString() ;
                oldCompitation.SendingFirm = e.NewValues["SendingFirm"]?.ToString();
                oldCompitation.TrainerCount = e.NewValues["TrainerCount"]?.ToString();
               
            grid.CancelEdit();
            e.Cancel = true;
            
        }

        protected void gvData_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            var node = StructureList.Find(x => x.ID.ToString() == tlStructure.FocusedNode.Key);
            if (node.Compitations == null) node.Compitations = new List<Compitation>();
            node.Compitations.Add(new Compitation
                {
                    Name = e.NewValues["Name"]?.ToString(),
                    AthleteCount = e.NewValues["AthleteCount"]?.ToString(),
                    CompetitorFirm = e.NewValues["CompetitorFirm"]?.ToString(),
                    Count = e.NewValues["Count"]?.ToString(),
                    DateAndPlace = e.NewValues["DateAndPlace"]?.ToString(),
                    JudgeCount = e.NewValues["JudgeCount"]?.ToString(),
                    OrganizerFirm = e.NewValues["OrganizerFirm"]?.ToString(),
                    SendingFirm = e.NewValues["SendingFirm"]?.ToString(),
                    TrainerCount = e.NewValues["TrainerCount"]?.ToString()
            });

            grid.CancelEdit();
            e.Cancel = true;
        }

        protected void tlStructure_NodeDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            StructureList = StructureList.Where(x => x.ID.ToString() != e.Values["ID"].ToString()).ToList();
            e.Cancel = true;
        }

        protected void tlStructure_NodeUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            var node = StructureList.Find(x => x.ID.ToString() == tree.FocusedNode.Key);
            node.Name = e.NewValues["Name"].ToString();

            tree.CancelEdit();
            e.Cancel = true;
        }
    }
}