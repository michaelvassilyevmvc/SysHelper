using LogParser.Utils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace LogParser
{
    class Program
    {

        static void Main(string[] args)
        {
            //string line = @"[26.05.2021 11:25:25.070] - [172.17.1.204] - SessionID:[2jvd0m14u4r0e1v23jwmyldj] - ClientID:[] - Login:[] - AuthorisationSessionID:[]";
            //string line2 = @"	ActionName: [Успешный вход в систему] ";
            //string line3 = @"		Description: [Успешный вход в систему: ClientId = 100000000; Login = special; IP=172.17.1.204]";
            //string resultLine = line + line2 + line3;
            //Match match = Regex.Match(resultLine,
            //    @"\[(.*?)\](.*?)\[(.*?)\](.*?)\[(.*?)\](.*?)ActionName: \[(.*?)\](.*?)ClientId = (.*?);(.*?)Login = (.*?);(.*?)IP=(.*?)\]");
            //if (match.Success)
            //{
            //    string date = match.Groups[1].Value.ToString();
            //    string ip = match.Groups[3].Value.ToString();
            //    string session = match.Groups[5].Value.ToString();
            //    string actionName = match.Groups[7].Value.ToString();
            //    string clientId = match.Groups[9].Value.ToString();
            //    string login = match.Groups[11].Value.ToString();
            //    string descIP = match.Groups[13].Value.ToString();
            //}

            #region WorkWithFile

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

            string writePath = $"C:/report_log_{DateTime.Today.ToShortDateString()}.txt";

            using (StreamWriter sw = new StreamWriter(writePath,false,System.Text.Encoding.Default))
            {
                string str = "";
                foreach (var item in LoggerList.OrderBy(x=>x.LogDate))
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
                        //Console.WriteLine(str);
                        sw.WriteLine(str);
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
                Console.WriteLine("Запись выполнена");
            }

            #endregion

        }



        static string GetLogFilePath()
        {
            string startPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)
                .Replace("file:\\", "").Replace("\\bin\\Debug", "");
            return System.IO.Path.Combine(startPath, "Logs\\MFKS_AuthorizationLog.log");
        }
    }
}
