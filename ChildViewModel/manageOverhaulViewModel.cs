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
    public class manageOverhaulViewModel: ViewModelBase
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

        //页面加载
        public ObservableCollection<ManagerCar> ManagerCars { get; } = new ObservableCollection<ManagerCar>();



        public manageOverhaulViewModel()
        {
            SearchCommand = new RelayCommand(ExecuteSearch);

            LoadVehicles();
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

    }
}
