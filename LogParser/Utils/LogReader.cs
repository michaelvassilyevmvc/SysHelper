using System;
using System.IO;

namespace LogParser.Utils
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

        public bool IsEOF()
        {
            return _reader.Peek() < 0;
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
