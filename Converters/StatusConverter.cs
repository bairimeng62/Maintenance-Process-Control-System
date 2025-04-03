// 定义状态与文本
using System;
using System.Globalization;
using System.Windows.Data;

namespace Maintenance_Process_Control_System.Converters
{
    public class StatusConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return "未知状态";

            byte status;
            if (value is byte)
                status = (byte)value;
            else if (value is int)
                status = (byte)(int)value;
            else
                return "未知状态";
            switch (status)
            {
                case 0:
                    return "入库";
                case 1:
                    return "出库";
                default:
                    return "未知状态";
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}