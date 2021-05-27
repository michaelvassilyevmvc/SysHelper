using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.Utils
{
    public class LogReader : IDisposable
    {
        private FileStream _fileStream;
        private BufferedStream _bufferedStream;
        private StreamReader _reader;

        public string PathToFile { get; }

        public LogReader(string pathToFile)
        {
            PathToFile = pathToFile;
        }

        public void OpenFile()
        {
            _fileStream = File.Open(PathToFile, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            _bufferedStream = new BufferedStream(_fileStream);
            _reader = new StreamReader(_bufferedStream);
        }

        public string ReadLine()
        {
            return _reader.ReadLine();
        }

        public void Dispose()
        {
            _reader?.Dispose();
            _bufferedStream?.Dispose();
            _fileStream?.Dispose();
        }
    }
}
