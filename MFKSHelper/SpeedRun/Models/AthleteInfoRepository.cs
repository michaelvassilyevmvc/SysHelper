using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace MFKSHelper.SpeedRun.Models
{
    public static class AthleteInfoRepository
    {
        public static AthleteInfo Get(int athleteId)
        {
            using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
            {
                var query = @"dbo.GetAthleteInfo";
                var param = new
                {
                    AthleteID = athleteId
                };
                return db.Query<AthleteInfo>(query, param, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public static void Save(AthleteInfo athleteInfo, LogData logData)
        {
            
            using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
            {
                var query = @"dbo.AthleteInfo_Save";
                var param = new
                {
                    Log_IP = logData.Log_IP,
                    Log_SessionID = logData.Log_SessionID,
                    Log_Login = logData.Log_Login,
                    Log_ClientID = logData.Log_ClientID,
                    Log_AuthorisationSessionID = logData.Log_AuthorisationSessionID,
                    ID = athleteInfo.ID,
                    FirmID = athleteInfo.FirmID,
                    Date_of_firm_entered = athleteInfo.Date_of_firm_entered,
                    IIN = athleteInfo.IIN,
                    Last_name = athleteInfo.Last_name,
                    First_name = athleteInfo.First_name,
                    Pat_name = athleteInfo.Pat_name,
                    Birth_date = athleteInfo.Birth_date,
                    Birthplace = athleteInfo.Birthplace,
                    Sex = athleteInfo.Sex,
                    NationID = athleteInfo.NationID,
                    Education_info = athleteInfo.Education_info,
                    KindsOfSportsID = athleteInfo.KindsOfSportsID,
                    Subject_of_sport = athleteInfo.Subject_of_sport,
                    Social_status = athleteInfo.Social_status,
                    Passport_ID = athleteInfo.Passport_ID,
                    Passport_Date_of_issue = athleteInfo.Passport_Date_of_issue,
                    Passport_Issued_by = athleteInfo.Passport_Issued_by,
                    Identity_card_ID = athleteInfo.Identity_card_ID,
                    Identity_card_Date_of_issue = athleteInfo.Identity_card_Date_of_issue,
                    Identity_card_Issued_by = athleteInfo.Identity_card_Issued_by,
                    BC_ID = athleteInfo.BC_ID,
                    BC_Date_of_issue = athleteInfo.BC_Date_of_issue,
                    BC_Issued_by = athleteInfo.BC_Issued_by,
                    Anthropometric_growth = athleteInfo.Anthropometric_growth,
                    Anthropometric_weight = athleteInfo.Anthropometric_weight,
                    Anthropometric_shoe_size = athleteInfo.Anthropometric_shoe_size,
                    Anthropometric_clothing_size = athleteInfo.Anthropometric_clothing_size,
                    Anthropometric_cap_size = athleteInfo.Anthropometric_cap_size,
                    Place_of_permanent_residence = athleteInfo.Place_of_permanent_residence,
                    Contact_phone_number = athleteInfo.Contact_phone_number,
                    Home_phone_number = athleteInfo.Home_phone_number,
                    Career_completion_date = athleteInfo.Career_completion_date,
                    SocialStatusID = athleteInfo.SocialStatusID
                };
                var affectRows =  db.Execute(query, param, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
