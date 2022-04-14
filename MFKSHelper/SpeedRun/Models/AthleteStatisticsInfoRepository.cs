using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace MFKSHelper.SpeedRun.Models
{
    public class AthleteStatisticsInfoRepository
    {

        public static AthleteStatisticsInfo Get(int athleteId)
        {
            using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
            {
                var query = @"select * from dbo.GetAthletesCardPercent(@AthleteID)";
                var param = new
                {
                    AthleteID = athleteId
                };
                return db.Query<AthleteStatisticsInfo>(query, param, commandType: CommandType.Text).ToList<AthleteStatisticsInfo>().FirstOrDefault();
            }
        }
    }
}
