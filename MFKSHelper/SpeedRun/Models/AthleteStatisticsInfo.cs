using System;

namespace MFKSHelper.SpeedRun.Models
{
    [Serializable]
    public class AthleteStatisticsInfo
    {
        public int AthleteID { get; set; }
        public double SportInfo { get; set; }
        public double FirmList { get; set; }
        public double AdditionalInfo { get; set; }
        public double PlaceOfPermanentResidence { get; set; }
        public double Anthropometric { get; set; }
        public double ParentsInfo { get; set; }
        public double AthletesPerformance { get; set; }
        public double AthletesMedicalCard { get; set; }
        public double AthletesPerformanceCard { get; set; }
        public double AthletesSpecialOlimpicsNorm { get; set; }
        public double Total { get; set; }
    }
}
