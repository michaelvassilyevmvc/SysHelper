using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.SpeedRun.Models
{
    [Serializable]
    public class AthleteCardDto
    {
        public int AthleteID { get; set; }
        public int FirmID { get; set; }
        public int RegionID { get; set; }
        public int KindOfSportIDFilter { get; set; }
        public bool IsEditable { get; set; } 

    }
}
