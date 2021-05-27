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
                string str = "";
                foreach (var item in loggerList.OrderBy(x => x.LogDate))
                {
                    try
                    {
                        str = String.Format("{0}\t\t{1}\t\t{2}\t\t\t{3}\t\t{4}\t\t{5}\t\t{6}"

                            , item.LogDate
                            , item.Session
                            , item.Login
                            , item.ActionName
                            , item.FirmID
                            , item.ClientID
                            , item.Description
                            );
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
