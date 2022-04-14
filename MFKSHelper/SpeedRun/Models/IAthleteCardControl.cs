using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.SpeedRun.Models
{
    public interface IAthleteCardControl
    {
        AthleteCardDto AthleteCardDto { get; set; }

        void Refresh();
    }
}
