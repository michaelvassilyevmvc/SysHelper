using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.Models.Dto
{
    public class KindOfSportDto
    {
        public int ID { get; set; }
        public int ParentID { get; set; }
        public string NameRus { get; set; }
        public string NameKaz { get; set; }
        public int CommonID { get; set; }
        public int HasPerformance { get; set; }
        public int State { get; set; }
        [JsonIgnore]
        public string Name { get; set; }
        [JsonIgnore]
        public string CommonName { get; set; }
        [JsonIgnore]
        public string ParentName { get; set; }


    }
}
