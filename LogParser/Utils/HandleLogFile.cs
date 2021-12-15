using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace LogParser.Utils
{
    public static class HandleLogFile
    {
        public static void Run()
        {
            HashSet<Logger> LoggerList = new HashSet<Logger>();
            string line1, line2, line3, resultLine;
            Match match;

            try
            {
                using (LogReader sr = new LogReader(GetLogFilePath()))
                {
                    sr.OpenFile();

                    while (!sr.IsEOF())
                    {
                        try
                        {
                            line1 = sr.ReadLine();
                            line2 = sr.ReadLine();
                            line3 = sr.ReadLine();
                            resultLine = string.Format("{0}{1}{2}", line1, line2, line3);

                            Logger nl = new Logger();
                            nl.Id = (LoggerList.Count > 0) ? LoggerList.Max(x => x.Id) + 1 : 1;

                            match = Regex.Match(resultLine,
                                @"\[(.*?)\](.*?)\[(.*?)\](.*?)\[(.*?)\](.*?)ActionName: \[(.*?)\](.*?)Description: \[(.*?):");
                            if (match.Success)
                            {
                                nl.LogDate = match.Groups[1].Value.ToString();
                                nl.IP = match.Groups[3].Value.ToString();
                                nl.Session = match.Groups[5].Value.ToString();
                                nl.ActionName = match.Groups[7].Value.ToString();
                                nl.Description = match.Groups[9].Value.ToString();
                            }

                            match = Regex.Match(resultLine,
                                @"\[(.*?)\](.*?)\[(.*?)\](.*?)\[(.*?)\](.*?)ActionName: \[(.*?)\](.*?)Description: \[(.*?)\]");
                            if (match.Success)
                            {
                                nl.LogDate = match.Groups[1].Value.ToString();
                                nl.IP = match.Groups[3].Value.ToString();
                                nl.Session = match.Groups[5].Value.ToString();
                                nl.ActionName = match.Groups[7].Value.ToString();
                                nl.Description = match.Groups[9].Value.ToString();
                            }

                            match = Regex.Match(line3, @"(.*?)ClientId = (.*?);(.*?)Login = (.*?);(.*?)IP=(.*?)\]");
                            if (match.Success)
                            {
                                nl.ClientID = match.Groups[2].Value.ToString();
                                nl.Login = match.Groups[4].Value.ToString();
                                nl.DescIP = match.Groups[6].Value.ToString();
                            }

                            match = Regex.Match(line3, @"(.*?)UserID = (.*?);(.*?)FirmID = (.*?);(.*?)SessionID = (.*?)\;");
                            if (match.Success)
                            {
                                nl.UserID = match.Groups[2].Value.ToString();
                                nl.FirmID = match.Groups[4].Value.ToString();
                                nl.SessionID = match.Groups[6].Value.ToString();
                            }

                            match = Regex.Match(line3, @"(.*?)Login=(.*?)\sClientId=(.*?)\s");
                            if (match.Success)
                            {
                                nl.Login = match.Groups[2].Value.ToString();
                                nl.ClientID = match.Groups[3].Value.ToString();
                            }

                            LoggerList.Add(nl);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            string writePath = $"C:/MFKS/MFKS_Akmola/LogReport/report_log_{DateTime.Today.ToShortDateString()}.txt";
            LoggerWriter lw = new LoggerWriter(writePath);

            try
            {
                if (lw.Save(LoggerList))
                {
                    Console.WriteLine("Запись выполнена");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка при записи");
                Console.WriteLine(ex.Message);
            }
        }

        static string GetLogFilePath()
        {
            string startPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)
                .Replace("file:\\", "").Replace("\\bin\\Debug", "");
            return System.IO.Path.Combine(startPath, "Logs\\MFKS_AuthorizationLog.log");
        }
    }
}
