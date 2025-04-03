using System.Windows;
using System.Windows.Controls;
using System.Security;

namespace Maintenance_Process_Control_System.View
{
    public static class PasswordBoxHelper
    {
        public static readonly DependencyProperty BindPasswordProperty =
            DependencyProperty.RegisterAttached(
                "BindPassword",
                typeof(bool),
                typeof(PasswordBoxHelper),
                new PropertyMetadata(false, OnBindPasswordChanged)
            );

        public static bool GetBindPassword(DependencyObject obj) =>
            (bool)obj.GetValue(BindPasswordProperty);

        public static void SetBindPassword(DependencyObject obj, bool value) =>
            obj.SetValue(BindPasswordProperty, value);

        private static void OnBindPasswordChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is PasswordBox box)
            {
                box.PasswordChanged -= PasswordChanged;
                if ((bool)e.NewValue)
                {
                    box.PasswordChanged += PasswordChanged;
                }
            }
        }

        private static void PasswordChanged(object sender, RoutedEventArgs e)
        {
            var box = sender as PasswordBox;
            SetBoundPassword(box, box?.SecurePassword);
        }

        public static readonly DependencyProperty BoundPasswordProperty =
            DependencyProperty.RegisterAttached(
                "BoundPassword",
                typeof(SecureString),
                typeof(PasswordBoxHelper)
            );

        public static SecureString GetBoundPassword(DependencyObject obj) =>
            (SecureString)obj.GetValue(BoundPasswordProperty);

        public static void SetBoundPassword(DependencyObject obj, SecureString value) =>
            obj.SetValue(BoundPasswordProperty, value);
    }
}