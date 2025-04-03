using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maintenance_Process_Control_System.Model
{
    public class ManagerUser: INotifyPropertyChanged
    {
        private bool _isEditing;
        //删除状态
        private bool _isSelected;
        public bool IsSelected
        {
            get => _isSelected;
            set
            {
                _isSelected = value;
                OnPropertyChanged(nameof(IsSelected));
            }
        }

        // 编辑状态
        public bool IsEditing
        {
            get => _isEditing;
            set
            {
                _isEditing = value;
                OnPropertyChanged(nameof(IsEditing));
                OnPropertyChanged(nameof(EditButtonIcon)); // 通知编辑按钮图标
                OnPropertyChanged(nameof(CancelButtonIcon)); // 通知取消按钮图标
            }
        }

        public int Id { get; set; }
        private string _name;
        private string _account;
        private string _pwd;
        private string _post;
        private string _team;
        private string _note;
        

        public string Name
        {
            get => _name;
            set { _name = value; OnPropertyChanged(nameof(Name)); }
        }

        public string Account
        {
            get => _account;
            set { _account = value; OnPropertyChanged(nameof(Account)); }
        }

        public string Pwd
        {
            get => _pwd;
            set { _pwd = value; OnPropertyChanged(nameof(Pwd)); }
        }

        public string Post
        {
            get => _post;
            set { _post = value; OnPropertyChanged(nameof(Post)); }
        }

        public string Team
        {
            get => _team;
            set { _team = value; OnPropertyChanged(nameof(Team)); }
        }

        public string Note
        {
            get => _note;
            set { _note = value; OnPropertyChanged(nameof(Note)); }
        }


        // 新增字段保存原始数据
        private string _originalAccount;
        private string _originalPwd;
        private string _originalPost;
        private string _originalName;
        private string _originalTeam;
        private string _originalNote;


        public void BeginEdit()
        {
            _originalAccount = Account;
            _originalPwd = Pwd;
            _originalPost = Post;
            _originalName = Name;
            _originalTeam = Team;
            _originalNote = Note;
            // 其他字段同理
            IsEditing = true;
        }

        public void CancelEdit()
        {
            Account = _originalAccount;
            Pwd = _originalPwd;
            Post = _originalPost;
            Name = _originalName;
            Team = _originalTeam;
            Note = _originalNote;
            // 其他字段同理
            IsEditing = false;
        }

        // 编辑/保存按钮图标动态切换
        public string EditButtonIcon => IsEditing ? "Check" : "Edit";
        public string CancelButtonIcon => IsEditing ? "Close" : "Trash";


        // 实现 INotifyPropertyChanged 接口
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
