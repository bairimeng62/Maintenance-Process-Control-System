using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maintenance_Process_Control_System.Model
{
    public class ManagerCar: INotifyPropertyChanged 
    {
        private int _id;             // 对应 id
        private string _number;
        private string _part1;
        private string _part2;
        private string _part3;
        private string _note = string.Empty;
        private int _manHours=5;
        private string _team;
        private DateTime _createTime = DateTime.Now;
        private DateTime? _startTime;
        private byte _status;
        private DateTime? _overTime;
        private decimal? _costTime;


        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged(nameof(Id));
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

        public string Part1
        {
            get => _part1;
            set
            {
                _part1 = value;
                OnPropertyChanged(nameof(Part1));
            }
        }

        public string Part2
        {
            get => _part2;
            set
            {
                _part2 = value;
                OnPropertyChanged(nameof(Part2));
            }
        }

        public string Part3
        {
            get => _part3;
            set
            {
                _part3 = value;
                OnPropertyChanged(nameof(Part3));
            }
        }

        public string Note
        {
            get => _note;
            set
            {
                _note = value;
                OnPropertyChanged(nameof(Note));
            }
        }

        public int ManHours
        {
            get => _manHours;
            set
            {
                _manHours = value;
                OnPropertyChanged(nameof(ManHours));
            }
        }

        public string Team
        {
            get => _team;
            set
            {
                _team = value;
                OnPropertyChanged(nameof(Team));
            }
        }

        public DateTime CreateTime
        {
            get => _createTime;
            set
            {
                _createTime = value;
                OnPropertyChanged(nameof(CreateTime));
            }
        }

        public DateTime? StartTime
        {
            get => _startTime;
            set
            {
                _startTime = value;
                OnPropertyChanged(nameof(StartTime));
            }
        }

        public byte Status
        {
            get => _status;
            set
            {
                if (value > 2) throw new ArgumentException("状态值必须为0、1或2");
                _status = value;
                OnPropertyChanged(nameof(Status));
            }
        }

        public DateTime? OverTime
        {
            get => _overTime;
            set
            {
                _overTime = value;
                OnPropertyChanged(nameof(OverTime));
            }
        }

        public decimal? CostTime
        {
            get => _costTime;
            set
            {
                _costTime = value;
                OnPropertyChanged(nameof(CostTime));
            }
        }

        // 实现 INotifyPropertyChanged 接口
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }

}
