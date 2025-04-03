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
using System.Windows.Input;

namespace Maintenance_Process_Control_System.ChildViewModel
{
    public class techEnterViewModel : ViewModelBase
    {
        public string CurrentUserName => LoginModel.CurrentUser?.Name;

        // 数据库连接字符串
        private static string ConnectionString => ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        //页面加载
        public ObservableCollection<TechCar> TechCars { get; } = new ObservableCollection<TechCar>();

        // 车辆类型集合
        public ObservableCollection<string> VehicleTypes { get; } = new ObservableCollection<string>
        {
            "内燃机车",
            "电力机车",
            "动车组列车",
            "调车机车",
            "混合动力机车",
        };

        // 机车车型集合
        public ObservableCollection<string> VehicleModels { get; } = new ObservableCollection<string>
        {
            "DF4D",
            "DF8B",
            "HXN3/HXN5",
            "SS8",
            "HXD1",
            "HXD1D",
            "FXD1",
            "CRH1",
            "CRH2",
            "CRH5",
            "CR400AF",
            "CR200J",
        };

        private string _selectedModel;
        private string _number;
        private string _selectedType;
        private string _belongingSection;
        private DateTime? _entryDate;

        public string SelectedModel
        {
            get => _selectedModel;
            set { _selectedModel = value; OnPropertyChanged(nameof(SelectedModel)); }
        }

        public string Number
        {
            get => _number;
            set { _number = value; OnPropertyChanged(nameof(Number)); }
        }

        public string SelectedType
        {
            get => _selectedType;
            set { _selectedType = value; OnPropertyChanged(nameof(SelectedType)); }
        }

        public string BelongingSection
        {
            get => _belongingSection;
            set { _belongingSection = value; OnPropertyChanged(nameof(BelongingSection)); }
        }

        public DateTime? EntryDate
        {
            get => _entryDate;
            set { _entryDate = value; OnPropertyChanged(nameof(EntryDate)); }
        }

        private string _status;
        public string Status
        {
            get => _status;
            set
            {
                _status = value;
                OnPropertyChanged(nameof(Status));
            }
        }

        // 提交命令
        public ICommand SubmitCommand { get; }

        public techEnterViewModel()
        {
            LoginModel.CurrentUserChanged += OnCurrentUserChanged;
            SubmitCommand = new ViewModelCommand(ExecuteSubmitCommand, CanExecuteSubmitCommand);
        }

        private bool CanExecuteSubmitCommand(object obj)
        {
            // 确保所有必填字段不为空
            return !string.IsNullOrWhiteSpace(SelectedModel) &&
                   !string.IsNullOrWhiteSpace(Number) &&
                   !string.IsNullOrWhiteSpace(SelectedType) &&
                   !string.IsNullOrWhiteSpace(BelongingSection) &&
                   EntryDate != null;
        }

        private void ExecuteSubmitCommand(object obj)
        {
            if (!IsVehicleNumberUnique(Number))
            {
                MessageBox.Show("机车编号已存在！");
                return;
            }
            InsertVehicleIntoDatabase();
        }

        

        private void OnCurrentUserChanged(object sender, EventArgs e)
        {
            OnPropertyChanged(nameof(CurrentUserName));
        }



        private bool IsVehicleNumberUnique(string number)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                var cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM VehicleInfo WHERE number = @Number",
                    conn
                );
                cmd.Parameters.AddWithValue("@Number", number);
                int count = (int)cmd.ExecuteScalar();
                return count == 0;
            }
        }

        private void InsertVehicleIntoDatabase()
        {
            try
            {
                using (var conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(
                        @"INSERT INTO VehicleInfo 
                  (model, number, type, blong, entertime, staff,status) 
                  VALUES (@Model, @Number, @Type, @Blong, @EnterTime, @Staff, '0')",
                        conn
                    );

                    cmd.Parameters.AddWithValue("@Model", SelectedModel);
                    cmd.Parameters.AddWithValue("@Number", Number);
                    cmd.Parameters.AddWithValue("@Type", SelectedType);
                    cmd.Parameters.AddWithValue("@Blong", BelongingSection);
                    cmd.Parameters.AddWithValue("@EnterTime", EntryDate.Value);
                    cmd.Parameters.AddWithValue("@Staff", CurrentUserName);
                    cmd.Parameters.AddWithValue("@Status", "0");

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // 清空输入或提示成功
                        ClearInputs();
                        MessageBox.Show("入库成功！");
                    }
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // 唯一键冲突错误
                {
                    MessageBox.Show("机车编号已存在，请检查输入！");
                }
                else
                {
                    MessageBox.Show($"数据库错误: {ex.Message}");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"操作失败: {ex.Message}");
            }
        }

        private void ClearInputs()
        {
            SelectedModel = null;
            Number = null;
            SelectedType = null;
            BelongingSection = null;
            EntryDate = null;
        }

    }
}
