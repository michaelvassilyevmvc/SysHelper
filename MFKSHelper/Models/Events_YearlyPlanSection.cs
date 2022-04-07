namespace MFKSHelper.Models
{
    public class Events_YearlyPlanSection
    {
        public int ID { get; set; }
        public int ParentID { get; set; }
        public string Name { get; set; }
        public bool IsEditable { get; set; } = false;
    }
}
