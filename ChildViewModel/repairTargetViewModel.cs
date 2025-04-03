using GalaSoft.MvvmLight.Command;
using Maintenance_Process_Control_System.Model;
using Maintenance_Process_Control_System.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Maintenance_Process_Control_System.ChildViewModel
{
    public class repairTargetViewModel: ViewModelBase
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
        private List<ManagerCar> _allCars = new List<ManagerCar>();

        // 搜索命令
        public RelayCommand SearchCommand { get; }

        // 开始检修命令
        public RelayCommand<ManagerCar> StartRepairCommand { get; }

        // 完成检修命令
        public RelayCommand<ManagerCar> CompleteRepairCommand { get; }

        //页面加载
        public ObservableCollection<ManagerCar> ManagerCars { get; } = new ObservableCollection<ManagerCar>();

        public repairTargetViewModel()
        {
            LoadVehicles();
            SearchCommand = new RelayCommand(ExecuteSearch);
            StartRepairCommand = new RelayCommand<ManagerCar>(ExecuteStartRepair);
            CompleteRepairCommand = new RelayCommand<ManagerCar>(ExecuteCompleteRepair);
        }


        // 加载车辆数据
        private void LoadVehicles()
        {
            ManagerCars.Clear();
            _allCars.Clear();

            string query = @"SELECT id,  number,  part1,  part2, part3, Note, 
                                man_hours, team, createtime, starttime, status, overtime, costtime 
                            FROM ManagerCar";

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
                            var car = new ManagerCar
                            {
                                Id = (int)reader["id"],
                                Number = reader["number"].ToString(),
                                Part1 = reader["part1"].ToString(),
                                Part2 = reader["part2"].ToString(),
                                Part3 = reader["part3"].ToString(),
                                Note = reader["Note"].ToString(),
                                ManHours = (int)reader["man_hours"],
                                Team = reader.IsDBNull(reader.GetOrdinal("team")) ? null : reader["team"].ToString(),
                                CreateTime = (DateTime)reader["createtime"],
                                StartTime = reader.IsDBNull(reader.GetOrdinal("starttime")) ? (DateTime?)null : (DateTime)reader["starttime"],
                                Status = (byte)reader["status"],
                                OverTime = reader.IsDBNull(reader.GetOrdinal("overtime")) ? (DateTime?)null : (DateTime)reader["overtime"],
                                CostTime = reader.IsDBNull(reader.GetOrdinal("costtime")) ? (decimal?)null : (decimal)reader["costtime"]

                            };

                            ManagerCars.Add(car);
                            _allCars.Add(car);
                        }
                    }
                }
                // 添加调试输出
                Debug.WriteLine($"Loaded {ManagerCars.Count} records.");
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
            ManagerCars.Clear(); // 清空现有数据
            if (string.IsNullOrWhiteSpace(SearchKeyword))
            {
                // 恢复全部数据
                foreach (var car in _allCars)
                {
                    ManagerCars.Add(car);
                }
            }
            else
            {
                // 过滤并添加匹配项
                var filtered = _allCars
                    .Where(c => c.Number.IndexOf(SearchKeyword, StringComparison.OrdinalIgnoreCase) >= 0)
                    .ToList();
                foreach (var car in filtered)
                {
                    ManagerCars.Add(car);
                }
            }
        }

        // 执行开始检修
        private void ExecuteStartRepair(ManagerCar car)
        {
            if (car == null) return;

            var result = MessageBox.Show("确认开始检修吗？", "提示", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    using (var conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        var cmd = new SqlCommand(
                            "UPDATE ManagerCar SET status = 1, starttime = @startTime WHERE id = @id",
                            conn
                        );
                        cmd.Parameters.AddWithValue("@startTime", DateTime.Now);
                        cmd.Parameters.AddWithValue("@id", car.Id);
                        cmd.ExecuteNonQuery();
                    }

                    // 更新本地数据
                    car.Status = 1;
                    car.StartTime = DateTime.Now;
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"操作失败: {ex.Message}");
                }
            }
        }

        // 执行结束检修
        private void ExecuteCompleteRepair(ManagerCar car)
        {
            if (car == null) return;

            var result = MessageBox.Show("确认结束检修吗？", "提示", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    var overTime = DateTime.Now;
                    // 计算总小时数，保留3位小数
                    var totalHours = (decimal)(overTime - car.StartTime.Value).TotalHours;
                    var costTime = Math.Round(totalHours, 3);

                    using (var conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        var cmd = new SqlCommand(
                            "UPDATE ManagerCar SET status = 2, overtime = @overTime, costtime = @costTime WHERE id = @id",
                            conn
                        );
                        cmd.Parameters.AddWithValue("@overTime", overTime);
                        cmd.Parameters.AddWithValue("@costTime", costTime);
                        cmd.Parameters.AddWithValue("@id", car.Id);
                        cmd.ExecuteNonQuery();
                    }

                    // 更新本地数据
                    car.Status = 2;
                    car.OverTime = overTime;
                    car.CostTime = costTime;
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"操作失败: {ex.Message}");
                }
            }
        }
    }
}
