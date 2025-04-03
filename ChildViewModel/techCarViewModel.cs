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
    public class techCarViewModel: ViewModelBase
    {
        // 数据库连接字符串
        private static string ConnectionString => ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        //页面加载
        public ObservableCollection<TechCar> TechCars { get; } = new ObservableCollection<TechCar>();

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
        private List<TechCar> _allCars = new List<TechCar>();

        // 搜索命令
        public RelayCommand SearchCommand { get; }

        // 添加出库命令
        public RelayCommand<TechCar> ActionCommand { get; }

        public techCarViewModel()
        {
            LoadVehicles();
            SearchCommand = new RelayCommand(ExecuteSearch);
            ActionCommand = new RelayCommand<TechCar>(ProcessCarOut); // 出库命令
        }

        // 加载车辆数据
        private void LoadVehicles()
        {
            TechCars.Clear();
            string query = @"SELECT id, model, number, type, blong, 
                            entertime, staff, status,outtime
                            FROM VehicleInfo";

            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(query, conn);
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            TechCars.Add(new TechCar
                            {
                                Id = (int)reader["id"],
                                Model = reader["model"].ToString(),
                                Number = reader["number"].ToString(),
                                Type = reader["type"].ToString(),
                                BelongTo = reader["blong"].ToString(),
                                EnterTime = (DateTime)reader["entertime"],
                                Staff = reader["staff"].ToString(),
                                Status = Convert.ToByte(reader["status"]), // 安全转换
                                OutTime = reader["outtime"] as DateTime? // 
                            });
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
            TechCars.Clear(); // 清空现有数据
            if (string.IsNullOrWhiteSpace(SearchKeyword))
            {
                // 恢复全部数据
                foreach (var car in _allCars)
                {
                    TechCars.Add(car);
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
                    TechCars.Add(car);
                }
            }
        }


        // 出库处理逻辑
        private void ProcessCarOut(TechCar car)
        {
            var result = MessageBox.Show(
                $"确认将{car.Number} 机车出库吗？",
                "出库确认",
                MessageBoxButton.YesNo,
                MessageBoxImage.Warning
            );
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    // 检查 ManagerCar 表中是否存在未完成的记录
                    string checkQuery = @"SELECT COUNT(1) FROM ManagerCar WHERE number = @Number AND status != 2"; // 假设 status=2 表示已完成

                    using (var conn = new SqlConnection(ConnectionString))
                    {
                        conn.Open();

                        // 检查未完成记录
                        var checkCmd = new SqlCommand(checkQuery, conn);
                        checkCmd.Parameters.AddWithValue("@Number", car.Number);
                        int incompleteCount = (int)checkCmd.ExecuteScalar();

                        if (incompleteCount > 0)
                        {
                            MessageBox.Show("存在未完成的检修记录，无法出库！",
                                          "警告",
                                          MessageBoxButton.OK,
                                          MessageBoxImage.Warning);
                            return;
                        }

                        // 更新 VehicleInfo 表
                        string updateQuery = @"UPDATE VehicleInfo SET status = 1, outtime = GETDATE() WHERE number = @Number";

                        var updateCmd = new SqlCommand(updateQuery, conn);
                        updateCmd.Parameters.AddWithValue("@Number", car.Number);
                        int affectedRows = updateCmd.ExecuteNonQuery();

                        if (affectedRows > 0)
                        {
                            // 更新本地数据
                            car.Status = 1;
                            car.OutTime = DateTime.Now;
                            MessageBox.Show("出库成功！", "成功", MessageBoxButton.OK, MessageBoxImage.Information);

                            // 刷新列表（可选）
                            LoadVehicles();
                        }
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show($"数据库错误: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"操作失败: {ex.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

                
        }
    }
}
