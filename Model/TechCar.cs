using System;
using System.ComponentModel;

namespace Maintenance_Process_Control_System.Model
{
    public class TechCar : INotifyPropertyChanged
    {
        private int _id;
        private string _model;
        private string _number;
        private string _type;
        private string _belongTo;  // 对应数据库字段 blong
        private DateTime _enterTime;
        private string _staff;
        private byte _status;
        private DateTime? _outTime;


        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged(nameof(Id));
            }
        }
        public string Model
        {
            get => _model;
            set
            {
                _model = value;
                OnPropertyChanged(nameof(Model));
            }
        }
        public string Number
        {
            get => _number;
            set
            {
                _number = value;
                OnPropertyChanged(nameof(Number));
            }
        }
        public string Type
        {
            get => _type;
            set
            {
                _type = value;
                OnPropertyChanged(nameof(Type));
            }
        }
        public string BelongTo
        {
            get => _belongTo;
            set
            {
                _belongTo = value;
                OnPropertyChanged(nameof(BelongTo));
            }
        }
        public DateTime EnterTime
        {
            get => _enterTime;
            set
            {
                _enterTime = value;
                OnPropertyChanged(nameof(EnterTime));
            }
        }
        public string Staff
        {
            get => _staff;
            set
            {
                _staff = value;
                OnPropertyChanged(nameof(Staff));
            }
        }
        public byte Status
        {
            get => _status;
            set
            {
                _status = value;
                OnPropertyChanged(nameof(Status));
            }
        }
        public DateTime? OutTime
        {
            get => _outTime;
            set
            {
                _outTime = value;
                OnPropertyChanged(nameof(OutTime));
            }
        }

        // 实现 INotifyPropertyChanged 接口
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}