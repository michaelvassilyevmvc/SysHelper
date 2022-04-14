using System;

namespace MFKSHelper.SpeedRun.Models
{
    [Serializable]
    public class AthleteCardDto
    {
        //Данные
        public int AthleteID { get; set; }
        public int FirmID { get; set; }
        public int RegionID { get; set; }
        public AthleteInfo AthleteInfo { get; set; }
        public AthleteStatisticsInfo AthleteStatisticsInfo { get; set; }


        //Отображение
        public int KindOfSportIDFilter { get; set; }
        public bool IsEditable { get; set; }

    }
}
