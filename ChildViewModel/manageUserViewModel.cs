using Maintenance_Process_Control_System.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Data.SqlClient;
using Maintenance_Process_Control_System.Model;
using Maintenance_Process_Control_System.Helpers;
using System.Windows;
using GalaSoft.MvvmLight.Command;
using System.ComponentModel;
using System.Windows.Input;
using System.Windows.Controls;
using System.Configuration;

namespace Maintenance_Process_Control_System.ChildViewModel
{
    public class manageUserViewModel : ViewModelBase
    {
        private static string connectionString => ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // 搜索关键词属性
        private string _searchKeyword;
        public string SearchKeyword
        {
            get => _searchKeyword;
            set
            {
                _searchKeyword = value;
                OnPropertyChanged(nameof(SearchKeyword));
            }
        }

        // 原始数据缓存（用于过滤）
        private List<ManagerUser> _allCars = new List<ManagerUser>();

        // 搜索命令
        public RelayCommand SearchCommand { get; }

        //页面加载
        public ObservableCollection<ManagerUser> ManagerUsers { get; } = new ObservableCollection<ManagerUser>();

        // 提交命令
        public RelayCommand SubmitCommand { get; set; }

        public RelayCommand<ManagerUser> ActionCommand { get; }  // 统一处理操作
        public RelayCommand<ManagerUser> CancelDeleteCommand { get; } // 取消/删除

        //删除命令
        public RelayCommand<ManagerUser> DeleteCommand { get; set; }

        // 新增属性：用于绑定输入控件
        private ManagerUser _user = new ManagerUser();
        public ManagerUser User
        {
            get => _user;
            set
            {
                _user = value;
                OnPropertyChanged(nameof(User));
            }
        }
        public ObservableCollection<string> Posts { get; } = new ObservableCollection<string>
        {
            "Admin",
            "Technician",
            "Inspector",
        };

        public manageUserViewModel()
        {
            LoadVehicles();
            SearchCommand = new RelayCommand(ExecuteSearch);
            DeleteCommand = new RelayCommand<ManagerUser>(DeleteCar);
            SubmitCommand = new RelayCommand(ExecuteSubmit); // 新增提交命令

            //AddCommand = new RelayCommand(ExecuteAddCommand);
            ActionCommand = new RelayCommand<ManagerUser>(OnAction);
            CancelDeleteCommand = new RelayCommand<ManagerUser>(OnCancelOrDelete);
            
        }



        // 加载人员数据
        private void LoadVehicles()
        {
            ManagerUsers.Clear();
            _allCars.Clear(); // 清空缓存

            string query = @"SELECT id, name, account, pwd, post, team,note FROM ManageUser";

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(query, conn);
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var car = new ManagerUser
                            {
                                Id = (int)reader["id"],
                                Name = reader["name"].ToString(),
                                Account = reader["account"].ToString(),
                                Pwd = reader["pwd"].ToString(),
                                Post = reader["post"].ToString(),
                                Team = reader["team"].ToString(),
                                Note = reader["note"].ToString()

                            };

                            ManagerUsers.Add(car);
                            _allCars.Add(car); // 同步缓存
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show($"数据库错误: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"加载失败: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // 执行搜索
        private void ExecuteSearch()
        {
            ManagerUsers.Clear(); // 清空现有数据
            if (string.IsNullOrWhiteSpace(SearchKeyword))
            {
                // 恢复全部数据
                foreach (var user in _allCars)
                {
                    ManagerUsers.Add(user);
                }
            }
            else
            {
                // 过滤并添加匹配项
                var filtered = _allCars
                    .Where(c => c.Name .IndexOf(SearchKeyword, StringComparison.OrdinalIgnoreCase) >= 0)
                    .ToList();
                foreach (var user in filtered)
                {
                    ManagerUsers.Add(user);
                }
            }
        }


        // 新增用户提交逻辑
        private void ExecuteSubmit()
        {
            try
            {
                // 验证必填字段
                if (string.IsNullOrWhiteSpace(User.Name))
                    throw new ArgumentException("姓名不能为空");
                if (string.IsNullOrWhiteSpace(User.Account))
                    throw new ArgumentException("账号不能为空");
                if (string.IsNullOrWhiteSpace(User.Pwd))
                    throw new ArgumentException("密码不能为空");
                if (string.IsNullOrWhiteSpace(User.Post))
                    throw new ArgumentException("职位不能为空");
                if (string.IsNullOrWhiteSpace(User.Team))
                    throw new ArgumentException("班组不能为空");

                //检查账号是否已存在
                string checkQuery = "SELECT COUNT(1) FROM ManageUser WHERE account = @Account";
                using (var checkConn = new SqlConnection(connectionString))
                {
                    checkConn.Open();
                    var checkCmd = new SqlCommand(checkQuery, checkConn);
                    checkCmd.Parameters.AddWithValue("@Account", User.Account.Trim());
                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        MessageBox.Show("账号已存在，请修改后重试！", "警告", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }
                }


                // 插入数据库
                string query = @"
        INSERT INTO ManageUser (name, account, pwd, post, team, note)
        VALUES (@Name, @Account, @Pwd, @Post, @Team, @Note)";

                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", User.Name);
                    cmd.Parameters.AddWithValue("@Account", User.Account);
                    cmd.Parameters.AddWithValue("@Pwd", User.Pwd);
                    cmd.Parameters.AddWithValue("@Post", User.Post ); // 默认职位
                    cmd.Parameters.AddWithValue("@Team", User.Team );
                    cmd.Parameters.AddWithValue("@Note", User.Note ?? "");
                    cmd.ExecuteNonQuery();
                }

                // 更新界面列表（重新加载或直接添加）
                LoadVehicles(); // 简单方式：重新加载数据
                ClearInputs();  // 清空输入框
                MessageBox.Show("用户添加成功！");
            }
            catch (SqlException ex)
            {
                MessageBox.Show($"数据库错误: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"添加失败: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        
        // 清空输入
        private void ClearInputs()
        {
            User = new ManagerUser(); // 重置绑定对象
        }


        // 主操作：编辑/保存
        private void OnAction(ManagerUser user)
        {
            if (user.IsEditing)
            {
                SaveUser(user);  // 保存逻辑
            }
            else
            {
                user.BeginEdit();
            }
        }

        // 副操作：取消/删除
        private void OnCancelOrDelete(ManagerUser user)
        {
            if (user.IsEditing)
            {
                user.CancelEdit(); // 取消编辑
            }
            else
            {
                DeleteCar(user);   // 删除逻辑
            }
        }

        // 保存数据到数据库
        private void SaveUser(ManagerUser user)
        {
            try
            {
                string query = @"
                UPDATE ManageUser 
                SET Name=@Name, Account=@Account, Pwd=@Pwd,
                    Post=@Post, Team=@Team,Note=@Note
                WHERE Id=@Id";
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", user.Name);
                    cmd.Parameters.AddWithValue("@Account", user.Account);
                    cmd.Parameters.AddWithValue("@Pwd", user.Pwd);
                    cmd.Parameters.AddWithValue("@Post", user.Post);
                    cmd.Parameters.AddWithValue("@Team", user.Team);
                    cmd.Parameters.AddWithValue("@Note", user.Note);
                    cmd.Parameters.AddWithValue("@Id", user.Id);
                    cmd.ExecuteNonQuery();
                }
                user.IsEditing = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show($"保存失败: {ex.Message}");
            }
        }

        // 删除数据
        private void DeleteCar(ManagerUser user)
        {
            var result = MessageBox.Show(
                $"确认删除 {user.Name} 的记录吗？",
                "删除确认",
                MessageBoxButton.YesNo,
                MessageBoxImage.Warning
            );
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    using (var conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        var cmd = new SqlCommand("DELETE FROM ManageUser WHERE Id=@Id", conn);
                        cmd.Parameters.AddWithValue("@Id", user.Id);
                        cmd.ExecuteNonQuery();
                    }
                    ManagerUsers.Remove(user);
                    MessageBox.Show("删除成功！");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"删除失败: {ex.Message}");
                }
            }
        }


    }
}

