using System;
using System.Text.RegularExpressions;

namespace LogParser.Utils
{
    public class Logger
    {
        public int Id { get; set; }
        public string LogDate { get; set; }
        public string IP { get; set; }
        public string Session { get; set; }
        public string ActionName { get; set; }
        public string ClientID { get; set; }
        public string Login { get; set; }
        public string DescIP { get; set; }
        public string Description { get; set; }
        public string UserID { get; set; }
        public string FirmID { get; set; }
        public string SessionID { get; set; }


        public string GetDate(string pattern, string str)
        {
            Regex r = new Regex(pattern, RegexOptions.IgnoreCase | RegexOptions.Singleline);
            Match m = r.Match(str);
            if (m.Success)
            {
                return m.Groups[0].ToString().Trim(new char[] { '[', ']' });
            }
            return "";
        }
    }
}
