using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.Models
{
    public class Events_YearlyPlan
    {
        public int? FirmID { get; set; }
        public int? SportsCompetitionsClassificationID { get; set; }
        public int SectionID { get; set; }
        public int YearValue { get; set; }
        public string NameRus { get; set; }
        public string NameKaz { get; set; }
        public string EventDateRus { get; set; }
        public string EventDateKaz { get; set; }
        public string ParticipantRus { get; set; }
        public string ParticipantKaz { get; set; }
        public string TeamCount { get; set; }
        public string AthleteCount { get; set; }
        public string TrainerCount { get; set; }
        public string JudgeCount { get; set; }
        public string OrganizerRus { get; set; }
        public string OrganizerKaz { get; set; }
        public string SenderRus { get; set; }
        public string SenderKaz { get; set; }
        public int SortOrder { get; set; }
        public int CreatedFirmID { get; set; }
        public int CreatedUserID { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Today;
        public int State { get; set; }
        public int RegionID { get; set; }

    }
}
