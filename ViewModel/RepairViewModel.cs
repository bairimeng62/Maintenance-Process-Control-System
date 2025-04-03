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
    public class RepairViewModel: ViewModelBase
    {
        public string CurrentUserAccount => LoginModel.CurrentUser?.Account;


        private ViewModelBase _currentChildView = new repairTargetViewModel(); // 初始化为非空

        public ViewModelBase CurrentChildView
        {
            get => _currentChildView;
            set
            {
                _currentChildView = value;
                OnPropertyChanged(nameof(CurrentChildView));
            }
        }


        //--> Commands
        public ICommand ShowCustomerViewCommand { get; set; }
        public ICommand ExitCommand { get; set; }

        public RepairViewModel()
        {

            //Initialize commands   
            ShowCustomerViewCommand = new ViewModelCommand(ExecuteShowCustomerViewCommand);
            ExitCommand = new ViewModelCommand(ExecuteExitCommand);

            //Default view
            ExecuteShowCustomerViewCommand(null);
        }

        

        private void ExecuteShowCustomerViewCommand(object obj)
        {
            CurrentChildView = new repairTargetViewModel();
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
                if (window is RepairView)
                {
                    window.Close();
                    break;
                }
            }
        }

    }
}

