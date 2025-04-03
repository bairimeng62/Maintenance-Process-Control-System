using FontAwesome.Sharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Maintenance_Process_Control_System.ChildViewModel;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using Maintenance_Process_Control_System.View;
using Maintenance_Process_Control_System.Model;

namespace Maintenance_Process_Control_System.ViewModel
{
    public class ManagerViewModel: ViewModelBase
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

        public ManagerViewModel()
        {

            //Initialize commands   
            ShowHomeViewCommand = new ViewModelCommand(ExecuteShowHomeViewCommand);
            ShowCustomerViewCommand = new ViewModelCommand(ExecuteShowCustomerViewCommand);
            ShowUserViewCommand = new ViewModelCommand(ExecuteShowUserViewCommand);
            ExitCommand = new ViewModelCommand(ExecuteExitCommand);

            //Default view
            ExecuteShowHomeViewCommand(null);
        }

        private void ExecuteShowHomeViewCommand(object obj)
        {
            CurrentChildView = new manageCarViewModel();
            
        }

        private void ExecuteShowCustomerViewCommand(object obj)
        {
            CurrentChildView = new manageOverhaulViewModel();
           
        }

        private void ExecuteShowUserViewCommand(object obj)
        {
            CurrentChildView = new manageUserViewModel();
            
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
                if (window is ManagerView)
                {
                    window.Close();
                    break;
                }
            }
        }
    }
}
