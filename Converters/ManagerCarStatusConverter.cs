using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Maintenance_Process_Control_System.Converters
{
    public class ManagerCarStatusConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return "未知状态";
            byte status = (byte)value;
            switch (status)
            {
                case 0: return "未检修";   // 状态0对应文本
                case 1: return "检修中";   // 状态1对应文本
                case 2: return "检修完成"; // 状态2对应文本
                default: return "未知状态";
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}
