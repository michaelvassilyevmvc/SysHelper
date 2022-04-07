using Dapper;
using DevExpress.Web;
using DevExpress.Web.ASPxTreeList;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using MFKSHelper.Helpers;
using MFKSHelper.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.Configuration;

namespace MFKSHelper
{
    public partial class TreeListStructurePage : System.Web.UI.Page
    {
        #region Properties

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

        public List<Events_YearlyPlanSection> OriginalStructureList
        {
            get
            {
                if (Session["original"] == null)
                {
                    return new List<Events_YearlyPlanSection>();
                }
                return Session["original"] as List<Events_YearlyPlanSection>;
            }
            set
            {
                Session["original"] = value;
            }

        }


        public List<Events_YearlyPlanSection> SectionList
        {
            get
            {
                if (Session["section"] == null)
                {
                    return new List<Events_YearlyPlanSection>();
                }
                return Session["section"] as List<Events_YearlyPlanSection>;
            }
            set
            {
                Session["section"] = value;
            }

        }

        public StructureItem LastItem { get; set; }

        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filePath = @"c:\doc_source_light.docx";
                StructureList = new List<StructureItem>();

                SetOriginalStructureData();
                SetStructureDataFromFile(filePath);

            }

            if (StructureList != null && StructureList.Count() > 0)
            {
                BindTrees();
                gvData.DataBind();

            }

            //tlStructure.Toolbars[0].Items.FindByName("btImport").ClientEnabled = lstNeedAgree.Items.Count == 0;
        }

        protected void tlStructure_DataBinding(object sender, EventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            tree.DataSource = StructureList.Select(x => new { ID = x.ID, ParentID = x.ParentNode?.ID ?? 0, Name = x.Name, Count = x.Compitations?.Count ?? 0, MfksID = x.MfksID }).ToList();
        }

        protected void tlStructure_ProcessDragNode(object sender, TreeListNodeDragEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;

            e.Handled = true;
            var nodes = tree.GetSelectedNodes();

            if (nodes.Count == 0)
                StructureHelpers.MoveNode(Convert.ToInt32(e.Node.Key), Convert.ToInt32(e.NewParentNode.Key), StructureList);
            else
                StructureHelpers.MoveNodes(nodes, Convert.ToInt32(e.NewParentNode.Key), StructureList);
        }

        protected void tlStructure_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;

            e.Cell.CssClass = "customClass";
        }

        protected void gvData_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            if (tlStructure.FocusedNode == null)
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
            oldCompitation.CompetitorFirm = e.NewValues["CompetitorFirm"]?.ToString();
            oldCompitation.Count = e.NewValues["Count"]?.ToString();
            oldCompitation.DateAndPlace = e.NewValues["DateAndPlace"]?.ToString();
            oldCompitation.JudgeCount = e.NewValues["JudgeCount"]?.ToString();
            oldCompitation.OrganizerFirm = e.NewValues["OrganizerFirm"]?.ToString();
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
            StructureList = StructureList.Where(x => x.ID.ToString() != e.Keys["ID"].ToString()).ToList();

            e.Cancel = true;
        }

        protected void tlStructure_NodeUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            var node = StructureList.Find(x => x.ID.ToString() == tree.FocusedNode.Key);
            node.Name = e.NewValues["Name"].ToString();
            node.MfksID = OriginalStructureList.FirstOrDefault(x => x.Name.Trim().ToLower() == node.Name.Trim().ToLower())?.ID ?? 0;
            node.MfksParentID = OriginalStructureList.FirstOrDefault(x => x.Name.Trim().ToLower() == node.Name.Trim().ToLower())?.ParentID ?? 0;


            if (node.MfksID != 0 && StructureList.All(x => x.ID != node.MfksID))
            {
                node.ID = node.MfksID;
            }

            if (node.MfksParentID != 0)
            {
                node.ParentNode = StructureList.FirstOrDefault(x => x.MfksID == node.MfksParentID);
            }

            tree.CancelEdit();
            e.Cancel = true;
        }

        protected void tlStructure_NodeInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;



            if (e.NewValues.Count > 1)
            {
                var node = StructureList.Find(x => x.ID.ToString() == e.NewValues["ParentID"].ToString());
                StructureList.Add(new StructureItem
                {
                    ID = StructureList.Max(x => x.ID) + 1,
                    ParentNode = node,
                    Level = node.Level + 1,
                    Name = e.NewValues["Name"].ToString(),
                    OriginalName = e.NewValues["Name"].ToString(),
                    StructureNodeType = StructureNodeType.NotUndefined,
                    Compitations = new List<Compitation>()
                });
            }
            else
            {
                StructureList.Add(new StructureItem
                {
                    ID = StructureList.Max(x => x.ID) + 1,
                    ParentNode = null,
                    Level = 0,
                    Name = e.NewValues["Name"].ToString(),
                    OriginalName = e.NewValues["Name"].ToString(),
                    StructureNodeType = StructureNodeType.NotUndefined,
                    Compitations = new List<Compitation>()
                });
            }



            tree.CancelEdit();
            e.Cancel = true;
        }

        protected void tlStructure_HtmlRowPrepared(object sender, TreeListHtmlRowEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;

            if (e.RowKind == TreeListRowKind.Data)
            {
                var node = StructureList.Find(x => x.ID.ToString() == e.NodeKey);

                if (node.MfksID == 0)
                {
                    e.Row.CssClass = "row-back";
                    return;
                }

                if (node.ParentNode != null && node.MfksParentID != node.ParentNode?.MfksID)
                {
                    e.Row.CssClass = "row-blue";
                }
            }
        }

        protected void tlOriginalStructure_DataBinding(object sender, EventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            tree.DataSource = OriginalStructureList;
        }

        protected void Panel_Callback(object sender, CallbackEventArgsBase e)
        {


            if (e.Parameter == "save")
            {
                var needSaveItems = OriginalStructureList.Where(x => x.IsEditable == true).ToList();
                foreach (var item in needSaveItems)
                {
                    SaveNode(item);
                }
                BindTrees();
            }

            if (e.Parameter == "rename")
            {
                var leftKey = tlOriginalStructure.FocusedNode.Key;
                var rightKey = tlStructure.FocusedNode.Key;
                var item = StructureList.Find(x => x.ID.ToString() == rightKey);
                var original = OriginalStructureList.Find(x => x.ID.ToString() == leftKey);
                item.Name = OriginalStructureList.Find(x => x.ID.ToString() == leftKey).Name;
                if (StructureList.All(x => x.ID != original.ID))
                {
                    item.ID = original.ID;
                    item.MfksID = original.ID;
                    item.ParentNode = StructureList.FirstOrDefault(x => x.ID == original.ParentID);
                    item.MfksParentID = item.ParentNode?.ID ?? 0;
                }


                BindTrees();
                return;
            }

            if (e.Parameter == "Refresh")
            {
                BindTrees();
                return;
            }

            if (e.Parameter == "Cancel")
            {
                SetOriginalStructureData();
                BindTrees();
                return;
            }

            string[] data = e.Parameter.Split('|');
            if (data.Length == 3 && data[0] == "drag")
            {
                MoveNode(data[1], data[2]);
                BindTrees();
            }

            if (data[0] == "NotAgreeValue")
            {
                BindTrees();
                var node = tlStructure.FindNodesByFieldValue("Name", data[1]).FirstOrDefault();
                node.Focus();
            }

            if (data[0] == "dragself")
            {
                MoveNode(data[1], data[2], true);
                BindTrees();
            }

            if (data[0] == "import")
            {
                int year = Convert.ToInt32(data[1]);
                ImportData(year);
            }
        }

        private void ImportData(int year)
        {
            using (IDbConnection db = new SqlConnection(WebConfigurationManager.ConnectionStrings["MFKSConnectionString"].ConnectionString))
            {
                var procedure = "[Events_YearlyPlan_Insert]";


                List<Events_YearlyPlan> list = new List<Events_YearlyPlan>();

                foreach (var item in StructureList)
                {
                    foreach (var compitation in item.Compitations)
                    {
                        list.Add(new Events_YearlyPlan
                        {
                            FirmID = 0,
                            SportsCompetitionsClassificationID = 0,
                            SectionID = item.ID,
                            YearValue = year,
                            NameKaz = compitation.Name,
                            NameRus = compitation.Name,
                            EventDateKaz = compitation.DateAndPlace,
                            EventDateRus = compitation.DateAndPlace,
                            ParticipantKaz = compitation.CompetitorFirm,
                            ParticipantRus = compitation.CompetitorFirm,
                            TeamCount = compitation.Count,
                            AthleteCount = compitation.AthleteCount,
                            TrainerCount = compitation.TrainerCount,
                            JudgeCount = compitation.JudgeCount,
                            OrganizerKaz = compitation.OrganizerFirm,
                            OrganizerRus = compitation.OrganizerFirm,
                            SenderKaz = compitation.SendingFirm,
                            SenderRus = compitation.SendingFirm,
                            CreatedDate = DateTime.Today,
                            CreatedFirmID = 0,
                            CreatedUserID = 0,
                            RegionID = 1,
                            SortOrder = 0,
                            State = 0
                        });
                    }
                }



                foreach (var item in list)
                {
                    var values = new DynamicParameters();

                    values.Add("@Log_IP", "test");
                    values.Add("@Log_SessionID", "test");
                    values.Add("@Log_Login", "test");
                    values.Add("@Log_ClientID", 22);
                    values.Add("@Log_AuthorisationSessionID", string.Empty);
                    values.Add("@FirmID", item.FirmID);
                    values.Add("@SportsCompetitionsClassificationID", item.SportsCompetitionsClassificationID);
                    values.Add("@SectionID", item.SectionID);
                    values.Add("@YearValue", year);
                    values.Add("@NameKaz", item.NameKaz);
                    values.Add("@NameRus", item.NameRus);
                    values.Add("@EventDateKaz", item.EventDateKaz);
                    values.Add("@EventDateRus", item.EventDateRus);
                    values.Add("@ParticipantKaz", item.ParticipantKaz);
                    values.Add("@ParticipantRus", item.ParticipantRus);
                    values.Add("@TeamCount", item.TeamCount);
                    values.Add("@AthleteCount", item.AthleteCount);
                    values.Add("@TrainerCount", item.TrainerCount);
                    values.Add("@JudgeCount", item.JudgeCount);
                    values.Add("@OrganizerKaz", item.OrganizerKaz);
                    values.Add("@OrganizerRus", item.OrganizerRus);
                    values.Add("@SenderKaz", item.SenderKaz);
                    values.Add("@SenderRus", item.SenderRus);
                    values.Add("@CreatedDate", item.CreatedDate);
                    values.Add("@CreatedFirmID", item.CreatedFirmID);
                    values.Add("@CreatedUserID", item.CreatedUserID);
                    values.Add("@SortOrder", item.SortOrder);
                    values.Add("@State", item.State);
                    values.Add("@RegionID", item.RegionID);


                    try
                    {
                        var results = db.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
            }

        }

        protected void lstNeedAgree_DataBinding(object sender, EventArgs e)
        {
            ASPxListBox list = sender as ASPxListBox;

            var needAgreeList = StructureList.Where(x => x.ParentNode != null && (x.MfksID == 0 || x.MfksParentID != x.ParentNode?.MfksID))
                .Select(x => x.Name);

            list.DataSource = needAgreeList.ToList();
        }

        protected void lstNeedAgree_ItemRowPrepared(object sender, ListBoxItemRowPreparedEventArgs e)
        {
            var node = StructureList.Find(x => x.Name == e.Item.Text);


            if (node.MfksID == 0)
            {
                e.Row.CssClass = "row-back";
                return;
            }

            if (node.MfksParentID != node.ParentNode.MfksID)
            {
                e.Row.CssClass = "row-blue";
            }
        }

        protected void tlOriginalStructure_HtmlRowPrepared(object sender, TreeListHtmlRowEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;

            if (e.RowKind == TreeListRowKind.Data)
            {
                TreeListNode node = tree.FindNodeByKeyValue(e.NodeKey);
                if ((bool)node["IsEditable"])
                {
                    e.Row.CssClass = "row-green";
                }
            }
        }

        protected void tlOriginalStructure_NodeDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            OriginalStructureList = OriginalStructureList.Where(x => x.ID.ToString() != e.Keys["ID"].ToString()).ToList();
            e.Cancel = true;
        }


        #endregion

        #region Methods

        private void MoveNode(string key, string newParentKey, bool self = false)
        {
            var newChild = StructureList.Find(x => x.ID.ToString() == key);
            if (self)
            {
                var nodes = tlStructure.GetSelectedNodes();

                if (nodes.Count == 0)
                    StructureHelpers.MoveNode(Convert.ToInt32(key), Convert.ToInt32(newParentKey), StructureList);
                else
                    StructureHelpers.MoveNodes(nodes, Convert.ToInt32(key), StructureList);
            }
            else
            {
                CloneNodeToOriginal(Convert.ToInt32(key), Convert.ToInt32(newParentKey));
                //OriginalStructureList.Add(new Events_YearlyPlanSection
                //{
                //    ID = OriginalStructureList.Max(x => x.ID) + 1,
                //    ParentID = Convert.ToInt32(newParentKey),
                //    Name = newChild.Name,
                //    IsEditable = true
                //});

                //newChild.MfksID = StructureList.Last().ID;

            }
            BindTrees();
        }

        protected void SetOriginalStructureData()
        {
            using (IDbConnection db = new SqlConnection(WebConfigurationManager.ConnectionStrings["MFKSConnectionString"].ConnectionString))
            {
                string query = @"SELECT [ID]
      ,[ParentID]
      ,[NameRus] as Name      
  FROM [dbo].[Events_YearlyPlanSection] WHERE RegionID = 1";

                OriginalStructureList = db.Query<Events_YearlyPlanSection>(query).ToList();
            }
        }

        protected void SetStructureDataFromFile(string filePath)
        {
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
                                    StructureNodeType = StructureNodeType.Chapter,
                                    Compitations = new List<Compitation>()
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
                                    StructureNodeType = StructureNodeType.CommonKindOfSport,
                                    Compitations = new List<Compitation>()
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
                                StructureNodeType = StructureNodeType.NotUndefined,
                                Compitations = new List<Compitation>()
                            });

                        }
                    }
                }

                StructureList.ForEach(x =>
                x.MfksID = OriginalStructureList.FirstOrDefault(s => s.Name.Trim().ToLower() == x.Name.Trim().ToLower())?.ID ?? 0
                );

                StructureList.ForEach(x =>
                x.MfksParentID = OriginalStructureList.FirstOrDefault(s => s.Name.Trim().ToLower() == x.Name.Trim().ToLower())?.ParentID ?? 0
                );

                for (int i = 0; i < StructureList.Count; i++)
                {
                    int value = StructureList[i].MfksID;
                    if (value != 0 && StructureList.All(x => x.ID != value))
                    {
                        StructureList[i].ID = StructureList[i].MfksID;
                    }


                    if (StructureList[i].MfksParentID != 0)
                    {
                        StructureList[i].ParentNode = StructureList.FirstOrDefault(x => x.MfksID == StructureList[i].MfksParentID);
                    }
                }

            }
        }

        protected void BindTrees()
        {
            tlStructure.DataBind();
            tlOriginalStructure.DataBind();
            gvData.DataBind();
            lstNeedAgree.DataBind();
        }

        private List<int> GetCloneNode(int id)
        {
            List<int> list = new List<int>();
            if (StructureList.Any(x => x.ID == id))
                list.Add(id);

            List<StructureItem> childs = StructureList.Where(x => x.ParentNode?.ID == id)?.ToList();
            if (childs == null) return list;

            foreach (var item in childs)
            {
                list.AddRange(GetCloneNode(item.ID));
            }

            return list;
        }

        private void CloneNodeToOriginal(int key, int parentKey)
        {
            var newChild = StructureList.Find(x => x.ID == key);

            OriginalStructureList.Add(new Events_YearlyPlanSection
            {
                ID = OriginalStructureList.Max(x => x.ID) + 1,
                ParentID = Convert.ToInt32(parentKey),
                Name = newChild.Name,
                IsEditable = true
            });

            newChild.MfksID = StructureList.Last().ID;
            newChild.MfksParentID = StructureList.Last().ParentNode?.ID ?? 0;

            var newOriginalChild = OriginalStructureList.Last();

            List<StructureItem> childs = StructureList.Where(x => x.ParentNode?.ID == key)?.ToList();
            foreach (var item in childs)
            {
                CloneNodeToOriginal(item.ID, newOriginalChild.ID);
            }
        }


        private void SaveNode(Events_YearlyPlanSection item)
        {
            using (IDbConnection db = new SqlConnection(WebConfigurationManager.ConnectionStrings["MFKSConnectionString"].ConnectionString))
            {
                var procedure = "[Events_YearlyPlanSection_Insert]";
                //Log_IP = WTOServerUtils.GetClientIP(),
                //    Log_SessionID = this.Session.SessionID,
                //    Log_Login = Global.CurrentUserInfo.Login,
                //    Log_ClientID = Global.CurrentUserInfo.FirmID,
                //    Log_AuthorisationSessionID = string.Empty,

                var values = new DynamicParameters();
                values.Add("@Log_IP", "test");
                values.Add("@Log_SessionID", "test");
                values.Add("@Log_Login", "test");
                values.Add("@Log_ClientID", 22);
                values.Add("@Log_AuthorisationSessionID", string.Empty);
                values.Add("@ParentID", item.ParentID);
                values.Add("@Level", 3);
                values.Add("@NameRus", item.Name);
                values.Add("@NameKaz", item.Name);
                values.Add("@SortOrder", 0);
                values.Add("@SetNumber", 0);
                values.Add("@SubGroup", 0);
                values.Add("@KindsOfSportID", 0);
                values.Add("@RegionID", 1);
                values.Add("@return_value", dbType: DbType.Int32, direction: ParameterDirection.Output);

                try
                {
                    db.Execute(procedure, values, commandType: CommandType.StoredProcedure);
                    var res = values.Get<int>("@return_value");

                    if (res != 0)
                    {
                        item.IsEditable = false;
                        var searchItem = StructureList.Find(x => x.MfksID == item.ID);
                        if (searchItem != null)
                        {
                            searchItem.MfksID = res;
                            searchItem.MfksParentID = item.ParentID;
                        }

                        //StructureList.Where(x=>x.ParentNode?.ID == item.ID).ToList().ForEach(x=>x.ParentNode.)
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }


        #endregion




    }
}