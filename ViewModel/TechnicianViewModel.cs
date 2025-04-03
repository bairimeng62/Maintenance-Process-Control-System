using FontAwesome.Sharp;
using Maintenance_Process_Control_System.ChildViewModel;
using Maintenance_Process_Control_System.Model;
using Maintenance_Process_Control_System.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Maintenance_Process_Control_System.ViewModel
{
    public class TechnicianViewModel:ViewModelBase
    {
        public string CurrentUserAccount => LoginModel.CurrentUser?.Account;

        //Fields
        private ViewModelBase _currentChildView;

        public ViewModelBase CurrentChildView
        {
            get
            {
                return _currentChildView;
            }

            set
            {
                _currentChildView = value;
                OnPropertyChanged(nameof(CurrentChildView));
            }
        }

        //--> Commands
        public ICommand ShowHomeViewCommand { get; set; }
        public ICommand ShowCustomerViewCommand { get; set; }
        public ICommand ShowUserViewCommand { get; set; }
        public ICommand ExitCommand { get; set; }


        public TechnicianViewModel()
        {
            LoginModel.CurrentUserChanged += OnCurrentUserChanged;

            //Initialize commands   
            ShowHomeViewCommand = new ViewModelCommand(ExecuteShowHomeViewCommand);
            ShowCustomerViewCommand = new ViewModelCommand(ExecuteShowCustomerViewCommand);
            ShowUserViewCommand = new ViewModelCommand(ExecuteShowUserViewCommand);
            ExitCommand = new ViewModelCommand(ExecuteExitCommand);

            //Default view
            ExecuteShowHomeViewCommand(null);
        }

        private void OnCurrentUserChanged(object sender, EventArgs e)
        {
            OnPropertyChanged(nameof(CurrentUserAccount));
        }

        private void ExecuteShowHomeViewCommand(object obj)
        {
            CurrentChildView = new techCarViewModel();

        }

        private void ExecuteShowCustomerViewCommand(object obj)
        {
            CurrentChildView = new techEnterViewModel();
            
        }

        private void ExecuteShowUserViewCommand(object obj)
        {
            CurrentChildView = new techFaultViewModel();

        }

        private void ExecuteExitCommand(object obj)
        {
            // 清除当前用户
            LoginModel.CurrentUser = null;

            // 创建登录窗口并显示
            var loginWindow = new LoginView();
            loginWindow.Show();

            // 关闭当前窗口
            foreach (Window window in Application.Current.Windows)
            {
                if (window is TechnicianView)
                {
                    window.Close();
                    break;
                }
            }
        }
    }
}
