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
    public class manageCarViewModel : ViewModelBase
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
        private List<TechCar> _allCars = new List<TechCar>();

        // 搜索命令
        public RelayCommand SearchCommand { get; }

        //页面加载
        public ObservableCollection<TechCar> TechCars { get; } = new ObservableCollection<TechCar>();
        
        
        
        public manageCarViewModel()
        {
            SearchCommand = new RelayCommand(ExecuteSearch);

            LoadVehicles();
        }

        

        // 加载车辆数据
        private void LoadVehicles()
        {
            TechCars.Clear();
            _allCars.Clear(); // 清空缓存

            string query = @"SELECT id, model, number, type, blong, 
                    entertime, staff, status,outtime
                    FROM VehicleInfo";

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
                            var car = new TechCar
                            {
                                Id = (int)reader["id"],
                                Model = reader["model"].ToString(),
                                Number = reader["number"].ToString(),
                                Type = reader["type"].ToString(),
                                BelongTo = reader["blong"].ToString(),
                                EnterTime = (DateTime)reader["entertime"],
                                Staff = reader["staff"].ToString(),
                                Status = Convert.ToByte(reader["status"]), // 安全转换
                                OutTime = reader.IsDBNull(reader.GetOrdinal("outtime")) ?
              (DateTime?)null :
              (DateTime)reader["outtime"]

                            };

                            TechCars.Add(car);
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






    }
}

