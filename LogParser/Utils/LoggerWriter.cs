using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace LogParser.Utils
{
    public class LoggerWriter 
    {
        private readonly string _filePath;
        public LoggerWriter(string filePath)
        {
            this._filePath = filePath;
        }

        public bool Save(HashSet<Logger> loggerList)
        {
            using (StreamWriter sw = new StreamWriter(_filePath, false, System.Text.Encoding.Default))
            {
                //DateTime startDate = new DateTime(2021, 31, 5, 9, 0, 0);
                var groupLoggerList = loggerList.Where(x => x.ActionName == "Успешный вход в систему" ).GroupBy(x=>x.Login).Select(x=>new { Name = x.Key, Count = x.Count()}).OrderBy(x=>x.Name);
                string str = "";
                int i = 1;
                foreach (var item in groupLoggerList)
                {
                    try
                    {
                        str = $"{i++}.{item.Name} - {item.Count}";
                        //str = String.Format("{0}\t\t{1}\t\t{2}\t\t\t{3}\t\t{4}\t\t{5}\t\t{6}"

                        //    , item.LogDate
                        //    , item.Session
                        //    , item.Login
                        //    , item.ActionName
                        //    , item.FirmID
                        //    , item.ClientID
                        //    , item.Description
                        //    );
                        sw.WriteLine(str);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

               

                return true;
            }
        }
    }
}
