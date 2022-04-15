using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.SpeedRun.Models
{
    [Serializable]
    public class AthleteInfo
    {
        public int ID { get; set; }
        public int FirmID { get; set; }
        public DateTime Creation_date { get; set; }
        public DateTime Date_of_firm_entered { get; set; }
        public string IIN { get; set; }
        public byte[] Foto { get; set; }
        public string Last_name { get; set; }
        public string First_name { get; set; }
        public string Pat_name { get; set; }
        public DateTime Birth_date { get; set; }
        public string Birthplace { get; set; }
        public int Sex { get; set; }
        public int? NationID { get; set; }
        public string Education_info { get; set; }
        public int KindsOfSportsID { get; set; }
        public string Subject_of_sport { get; set; }
        public string Social_status { get; set; }
        public string Passport_ID { get; set; }
        public DateTime? Passport_Date_of_issue { get; set; }
        public string Passport_Issued_by { get; set; }
        public string Identity_card_ID { get; set; }
        public DateTime? Identity_card_Date_of_issue { get; set; }
        public string Identity_card_Issued_by { get; set; }
        public string BC_ID { get; set; }
        public DateTime? BC_Date_of_issue { get; set; }
        public string BC_Issued_by { get; set; }
        public string Anthropometric_growth { get; set; }
        public string Anthropometric_weight { get; set; }
        public string Anthropometric_shoe_size { get; set; }
        public string Anthropometric_clothing_size { get; set; }
        public string Anthropometric_cap_size { get; set; }
        public string Place_of_permanent_residence { get; set; }
        public string Contact_phone_number { get; set; }
        public string Home_phone_number { get; set; }
        public DateTime? Career_completion_date { get; set; }
        public long? SocialStatusID { get; set; }


    }
}
