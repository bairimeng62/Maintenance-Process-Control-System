using GalaSoft.MvvmLight.Command;
using Maintenance_Process_Control_System.Model;
using Maintenance_Process_Control_System.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Maintenance_Process_Control_System.ChildViewModel
{
   public class techFaultViewModel: ViewModelBase
    {
        // 数据库连接字符串
        private static string connectionString => ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        //页面加载
        public ObservableCollection<TechFault> TechFaults { get; } = new ObservableCollection<TechFault>();

        // 添加故障命令
        public RelayCommand AddFaultCommand { get; }

        // 新增送检命令
        public RelayCommand<TechFault> SendForInspectionCommand { get; }


        public techFaultViewModel()
        {
            LoadVehicles();
            AddFaultCommand = new RelayCommand(ExecuteAddFault);
            SendForInspectionCommand = new RelayCommand<TechFault>(ExecuteSendForInspection);
            LoadPart1Options(); // 初始化一级部位
            LoadVehicleNumbers();
            LoadTeams();

        }

        // 送检逻辑
        private void ExecuteSendForInspection(TechFault techFault)
        {
            if (techFault == null) return;

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var transaction = conn.BeginTransaction()) // 开启事务
                {
                    try
                    {
                        // 将 TechFault 数据转换为 ManagerCar
                        var managerCar = new ManagerCar
                        {
                            Number = techFault.Number,
                            Part1 = techFault.Part1,
                            Part2 = techFault.Part2,
                            Part3 = techFault.Part3,
                            Note = techFault.Note,
                            ManHours = techFault.ManHours,
                            Team = techFault.Team,
                            CreateTime = techFault.CreateTime,
                            Status = 0
                        };
                        
                        // 插入到 ManagerCar 表
                        if (InsertIntoManagerCar(managerCar, conn, transaction))
                        {
                            // 删除原 TechFault 记录
                            DeleteFromTechFault(techFault.Id, conn, transaction);
                            transaction.Commit(); // 提交事务

                            // 更新 UI
                            Application.Current.Dispatcher.Invoke(() =>
                            {
                                TechFaults.Remove(techFault);
                                MessageBox.Show("送检成功！", "成功", MessageBoxButton.OK, MessageBoxImage.Information);
                            });
                        }
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback(); // 回滚事务
                        MessageBox.Show($"送检失败: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
        }

        // 插入到 ManagerCar 表（带事务支持）
        private bool InsertIntoManagerCar(ManagerCar managerCar, SqlConnection conn, SqlTransaction transaction)
        {
            string query = @"INSERT INTO ManagerCar (number, part1, part2, part3, note, man_hours, team, createtime, status) 
        VALUES (@Number, @Part1, @Part2, @Part3, @Note, @ManHours, @Team, @CreateTime, @Status)";

            try
            {
                var cmd = new SqlCommand(query, conn, transaction);
                cmd.Parameters.AddWithValue("@Number", managerCar.Number);
                cmd.Parameters.AddWithValue("@Part1", managerCar.Part1);
                cmd.Parameters.AddWithValue("@Part2", managerCar.Part2);
                cmd.Parameters.AddWithValue("@Part3", managerCar.Part3);
                cmd.Parameters.AddWithValue("@Note", managerCar.Note);
                cmd.Parameters.AddWithValue("@ManHours", managerCar.ManHours);
                cmd.Parameters.AddWithValue("@Team", (object)managerCar.Team ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@CreateTime", managerCar.CreateTime);
                cmd.Parameters.AddWithValue("@Status", managerCar.Status);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("数据提交失败", ex); // 抛出异常供上层处理
            }
        }

        

        // 从 TechFault 表删除记录（带事务支持）
        private void DeleteFromTechFault(int id, SqlConnection conn, SqlTransaction transaction)
        {
            string query = "DELETE FROM TechFault WHERE id = @Id";
            try
            {
                var cmd = new SqlCommand(query, conn, transaction);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("删除 TechFault 记录失败", ex); // 抛出异常供上层处理
            }
        }


        // 机车编号和检修岗位的数据集合
        private ObservableCollection<string> _vehicleNumbers = new ObservableCollection<string>();
        private ObservableCollection<string> _teams = new ObservableCollection<string>();

        public ObservableCollection<string> VehicleNumbers
        {
            get => _vehicleNumbers;
            set { _vehicleNumbers = value; OnPropertyChanged(nameof(VehicleNumbers)); }
        }

        public ObservableCollection<string> Teams
        {
            get => _teams;
            set { _teams = value; OnPropertyChanged(nameof(Teams)); }
        }

        private string _selectedVehicleNumber;
        public string SelectedVehicleNumber
        {
            get => _selectedVehicleNumber;
            set
            {
                _selectedVehicleNumber = value;
                OnPropertyChanged(nameof(SelectedVehicleNumber));
            }
        }

        private string _selectedTeam;
        public string SelectedTeam
        {
            get => _selectedTeam;
            set
            {
                _selectedTeam = value;
                OnPropertyChanged(nameof(SelectedTeam));
            }
        }


        // 联动数据集合
        private ObservableCollection<string> _part1List = new ObservableCollection<string>();
        private ObservableCollection<string> _part2List = new ObservableCollection<string>();
        private ObservableCollection<string> _part3List = new ObservableCollection<string>();
        private ObservableCollection<string> _noteList = new ObservableCollection<string>();

        // 选中的项
        private string _selectedPart1;
        private string _selectedPart2;
        private string _selectedPart3;
        private string _selectedNote;

        public ObservableCollection<string> Part1List
        {
            get => _part1List;
            set { _part1List = value; OnPropertyChanged(nameof(Part1List)); }
        }

        public ObservableCollection<string> Part2List
        {
            get => _part2List;
            set { _part2List = value; OnPropertyChanged(nameof(Part2List)); }
        }

        public ObservableCollection<string> Part3List
        {
            get => _part3List;
            set { _part3List = value; OnPropertyChanged(nameof(Part3List)); }
        }

        public ObservableCollection<string> NoteList
        {
            get => _noteList;
            set { _noteList = value; OnPropertyChanged(nameof(NoteList)); }
        }

        public string SelectedPart1
        {
            get => _selectedPart1;
            set
            {
                _selectedPart1 = value;
                OnPropertyChanged(nameof(SelectedPart1));
                // 选择 Part1 后清空下级选项
                SelectedPart2 = null;
                SelectedPart3 = null;
                SelectedNote = null;
                LoadPart2Options(value); // 选择 Part1 后加载 Part2
            }
        }

        public string SelectedPart2
        {
            get => _selectedPart2;
            set
            {
                _selectedPart2 = value;
                OnPropertyChanged(nameof(SelectedPart2));
                SelectedPart3 = null;
                SelectedNote = null;
                LoadPart3Options(value); // 选择 Part2 后加载 Part3
            }
        }

        public string SelectedPart3
        {
            get => _selectedPart3;
            set
            {
                _selectedPart3 = value;
                OnPropertyChanged(nameof(SelectedPart3));
                SelectedNote = null;
                LoadNoteOptions(value); // 选择 Part3 后加载 Note
            }
        }

        public string SelectedNote
        {
            get => _selectedNote;
            set
            {
                _selectedNote = value;
                OnPropertyChanged(nameof(SelectedNote));
            }
        }



        // 加载车辆数据
        private void LoadVehicles()
        {
            TechFaults.Clear();

            string query = @"SELECT id,  number,  part1,  part2, part3, note, 
                                man_hours, team, createtime
                            FROM TechFault";

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
                            var car = new TechFault
                            {
                                Id = (int)reader["id"],
                                Number = reader["number"].ToString(),
                                Part1 = reader["part1"].ToString(),
                                Part2 = reader["part2"].ToString(),
                                Part3 = reader["part3"].ToString(),
                                Note = reader["note"].ToString(),
                                ManHours = (int)reader["man_hours"],
                                Team = reader.IsDBNull(reader.GetOrdinal("team")) ? null : reader["team"].ToString(),
                                CreateTime = (DateTime)reader["createtime"],
                            };

                            TechFaults.Add(car);
                            
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



        // 加载一级部位选项
        private void LoadPart1Options()
        {
            Part1List.Clear();
            string query = "SELECT DISTINCT part1 FROM FaultDictionary";
            LoadOptions(query, Part1List);
        }

        // 加载二级部位选项（基于一级部位）
        private void LoadPart2Options(string part1)
        {
            Part2List.Clear();
            string query = $"SELECT DISTINCT part2 FROM FaultDictionary WHERE part1 = '{part1}'";
            LoadOptions(query, Part2List);
        }

        // 加载三级部位选项（基于二级部位）
        private void LoadPart3Options(string part2)
        {
            Part3List.Clear();
            string query = $"SELECT DISTINCT part3 FROM FaultDictionary WHERE part2 = '{part2}'";
            LoadOptions(query, Part3List);
        }

        // 加载现象描述（基于三级部位）
        private void LoadNoteOptions(string part3)
        {
            NoteList.Clear();
            string query = $"SELECT DISTINCT note FROM FaultDictionary WHERE part3 = '{part3}'";
            LoadOptions(query, NoteList);
        }

        // 加载机车编号
        private void LoadVehicleNumbers()
        {
            VehicleNumbers.Clear();
            string query = "SELECT DISTINCT number FROM VehicleInfo";

            LoadOptions(query, VehicleNumbers);
        }

        // 加载检修岗位
        private void LoadTeams()
        {
            Teams.Clear();
            string query = "SELECT DISTINCT team FROM ManageUser";

            LoadOptions(query, Teams);
        }

        // 通用方法：从数据库加载选项
        private void LoadOptions(string query, ObservableCollection<string> targetCollection)
        {
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
                            targetCollection.Add(reader[0].ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"加载选项失败: {ex.Message}");
            }
        }



        // 工时输入属性（假设界面有工时输入框）
        private int _manHoursInput = 5;
        public int ManHoursInput
        {
            get => _manHoursInput;
            set { _manHoursInput = value; OnPropertyChanged(nameof(ManHoursInput)); }
        }

        
        // 添加故障逻辑
        private void ExecuteAddFault()
        {
            if (string.IsNullOrEmpty(SelectedVehicleNumber) ||
                string.IsNullOrEmpty(SelectedPart1) ||
                string.IsNullOrEmpty(SelectedPart2) ||
                string.IsNullOrEmpty(SelectedPart3) ||
                string.IsNullOrEmpty(SelectedNote))
            {
                MessageBox.Show("请填写所有必填字段！", "提示", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var techFault = new TechFault
            {
                Number = SelectedVehicleNumber,
                Part1 = SelectedPart1,
                Part2 = SelectedPart2,
                Part3 = SelectedPart3,
                Note = SelectedNote,
                ManHours = ManHoursInput,
                Team = SelectedTeam,
                CreateTime = DateTime.Now
            };

            if (InsertIntoTechFault(techFault))
            {
                ClearInputs();
                TechFaults.Add(techFault);
                MessageBox.Show("添加故障成功！", "成功", MessageBoxButton.OK, MessageBoxImage.Information); // 新增提示
            }
        }

        // 插入到 TechFault 表
        private bool InsertIntoTechFault(TechFault techFault)
        {
            string query = @"
        INSERT INTO TechFault 
            (number, part1, part2, part3, note, man_hours, team, createtime) 
        VALUES 
            (@Number, @Part1, @Part2, @Part3, @Note, @ManHours, @Team, @CreateTime)";

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var transaction = conn.BeginTransaction()) // 开启事务
                    {
                        try
                        {
                            var cmd = new SqlCommand(query, conn, transaction);
                            cmd.Parameters.AddWithValue("@Number", techFault.Number);
                            cmd.Parameters.AddWithValue("@Part1", techFault.Part1);
                            cmd.Parameters.AddWithValue("@Part2", techFault.Part2);
                            cmd.Parameters.AddWithValue("@Part3", techFault.Part3);
                            cmd.Parameters.AddWithValue("@Note", techFault.Note);
                            cmd.Parameters.AddWithValue("@ManHours", techFault.ManHours);
                            cmd.Parameters.AddWithValue("@Team", (object)techFault.Team ?? DBNull.Value);
                            cmd.Parameters.AddWithValue("@CreateTime", techFault.CreateTime);
                            cmd.ExecuteNonQuery();
                            transaction.Commit();
                            return true;
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            MessageBox.Show($"添加故障失败: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                            return false;
                        }
                    }
                }
            }
            catch (SqlException ex) when (ex.Number == 2627)
            {
                MessageBox.Show("该故障记录已存在！", "警告", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }
        }

        // 清空输入框
        private void ClearInputs()
        {
            SelectedVehicleNumber = null;
            SelectedPart1 = null;
            SelectedPart2 = null;
            SelectedPart3 = null;
            SelectedNote = null;
            SelectedTeam = null;
            ManHoursInput = 5; // 重置为默认值
        }


    }
}
