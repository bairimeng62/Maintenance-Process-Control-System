// 定义文本颜色
using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace Maintenance_Process_Control_System.Converters
{
    public class StatusColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            byte status = (byte)value;
            switch (status)
            {
                case 0:
                    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#38A00D")); // 在库（绿色）
                case 1:
                    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#fb539b")); // 出库（红色）
                //case 2:
                //    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#E6A320")); // 维修中（橙色）
                //case 3:
                //    return new SolidColorBrush((Color)ColorConverter.ConvertFromString("#5974C8")); // 维修完成（蓝色）
                default:
                    return Brushes.Black;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}