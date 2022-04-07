using MFKSHelper.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace MFKSHelper.Repository
{
    public static class Repository
    {
        public static List<AthleteAdditionalSportDto> GetAthletesAdditionalSport()
        {
            try
            {
                List<AthleteAdditionalSportDto> result = new List<AthleteAdditionalSportDto>();
                using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
                {
                    var query = $"SELECT JsonValue FROM dbo.CachingData WHERE RegionID = 1 AND Type = 2";

                    List<string> jsonList = db.Query<string>(query).ToList<string>();
                    foreach (var json in jsonList)
                    {
                        var tmp = JsonConvert.DeserializeObject<List<AthleteAdditionalSportDto>>(json);
                        if(tmp != null && tmp.Count > 0)
                            result.AddRange(tmp);
                    }
                }
                return result;
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public static List<KindOfSportDto> GetKindOfSportListByCatalogs(bool IsLangKAZ = false)
        {
            try
            {
                List<KindOfSportDto> result = new List<KindOfSportDto>();

                using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
                {
                    var query = $"SELECT JsonValue FROM dbo.Catalogs WHERE CatalogType = 2";
                    string json = db.Query<string>(query).FirstOrDefault();
                    result = JsonConvert.DeserializeObject<List<KindOfSportDto>>(json);
                    result.ForEach(x => x.NameKaz = x.NameKaz.Replace('^', '"'));
                    result.ForEach(x => x.NameRus = x.NameRus.Replace('^', '"'));
                    result.ForEach(x => x.Name = IsLangKAZ ? x.NameKaz : x.NameRus);
                    result.ForEach(x => x.CommonName = result.FirstOrDefault(k => k.ID == x.CommonID)?.Name);
                    result.ForEach(x => x.ParentName = result.FirstOrDefault(k => k.ID == x.ParentID)?.Name);
                }

                return result.OrderBy(X => X.Name).ToList();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return new List<KindOfSportDto>();
            }
        }
    }
}
