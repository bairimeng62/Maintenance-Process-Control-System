using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media;

namespace Maintenance_Process_Control_System.Converters
{
    public class ManagerCarStatusColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            byte status = (byte)value;
            switch (status)
            {
                case 0: // 未检修（红色）
                    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#fb539b"));
                case 1: // 检修中（橙色）
                    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#E6A320"));
                case 2: // 检修完成（绿色）
                    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#38A00D"));
                default: // 其他状态
                    return Brushes.Black;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}
