using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.Models.Dto
{
    public class AthleteAdditionalSportDto
    {
        public int ID { get; set; }
        public int AthleteId { get; set; }
        public int KindOfSportId { get; set; }
    }
}
