// LoginViewModel.cs
using Maintenance_Process_Control_System.Model;
using Maintenance_Process_Control_System.View;
using System;
using System.Data.SqlClient;
using System.Security;
using System.Windows;
using System.Windows.Input;
using System.Configuration;

namespace Maintenance_Process_Control_System.ViewModel
{
    public class LoginViewModel : ViewModelBase
    {
        private static string connectionString => ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // 绑定属性（字段名与 ManageUser 表一致）
        private string _account;
        private SecureString _pwd;
        private string _errorMessage;

        public string Account
        {
            get => _account;
            set { _account = value; OnPropertyChanged(nameof(Account)); }
        }

        public SecureString Pwd
        {
            get => _pwd;
            set { _pwd = value; OnPropertyChanged(nameof(Pwd)); }
        }

        public string ErrorMessage
        {
            get => _errorMessage;
            set { _errorMessage = value; OnPropertyChanged(nameof(ErrorMessage)); }
        }

        // 登录命令
        public ICommand LoginCommand { get; }

        public LoginViewModel()
        {
            LoginCommand = new ViewModelCommand(ExecuteLoginCommand, CanExecuteLoginCommand);
        }

        private bool CanExecuteLoginCommand(object obj)
        {
            return !string.IsNullOrWhiteSpace(Account) && Pwd?.Length > 0;
        }

        private void ExecuteLoginCommand(object obj)
        {
            var user = ValidateUser();
            if (user != null)
            {
                LoginModel.CurrentUser = user; // 关键：使用 LoginModel 的静态属性

                // 根据 Post（角色）跳转页面
                switch (user.Post)
                {
                    case "Admin":
                        Application.Current.MainWindow = new ManagerView();
                        break;
                    case "Technician":
                        Application.Current.MainWindow = new TechnicianView();
                        break;
                    case "Inspector":
                        Application.Current.MainWindow = new RepairView();
                        break;
                    default:
                        ErrorMessage = "* 用户角色无效";
                        return;
                }
                Application.Current.MainWindow.Show();
                CloseCurrentWindow();
            }
            else
            {
                ErrorMessage = "* 账户或密码错误";
            }
        }

        // 验证用户并返回完整模型
        private LoginModel ValidateUser()
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                var cmd = new SqlCommand(
                    "SELECT Id, Account, Pwd, Post, Name, Team FROM ManageUser WHERE Account=@Account",
                    conn
                );
                cmd.Parameters.AddWithValue("@Account", Account);
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        var storedPwd = reader["Pwd"].ToString();
                        var inputPwd = new System.Net.NetworkCredential("", Pwd).Password;
                        if (inputPwd == storedPwd)
                        {
                            return new LoginModel
                            {
                                Id = (int)reader["Id"],
                                Account = reader["Account"].ToString(),
                                Pwd = storedPwd,
                                Post = reader["Post"].ToString(),
                                Name = reader["Name"].ToString(),
                                Team = reader["Team"].ToString(),
                            };
                        }
                    }
                }
                return null;
            }
        }

        // 关闭当前窗口（代码同之前）
        private void CloseCurrentWindow()
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window is LoginView)
                {
                    window.Close();
                    break;
                }
            }
        }
    }
}