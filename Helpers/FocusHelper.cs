//自动聚焦可编辑行
using System;
using System.Windows;
using System.Windows.Controls;

namespace Maintenance_Process_Control_System.Helpers
{
    public static class FocusHelper
    {
        public static readonly DependencyProperty RequestFocusProperty =
            DependencyProperty.RegisterAttached(
                "RequestFocus",
                typeof(bool),
                typeof(FocusHelper),
                new PropertyMetadata(false, OnRequestFocusChanged));

        public static bool GetRequestFocus(DependencyObject obj) =>
            (bool)obj.GetValue(RequestFocusProperty);

        public static void SetRequestFocus(DependencyObject obj, bool value) =>
            obj.SetValue(RequestFocusProperty, value);

        private static void OnRequestFocusChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is DataGridCell cell && (bool)e.NewValue)
            {
                cell.Focus();
                // 使用 Action 委托明确类型，并指定调度优先级
                cell.Dispatcher.BeginInvoke(
                    new Action(() => {
                        cell.IsEditing = true;
                    }),
                    System.Windows.Threading.DispatcherPriority.Render
                );
            }
        }
    }
}