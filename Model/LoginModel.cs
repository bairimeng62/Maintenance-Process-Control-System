using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maintenance_Process_Control_System.Model
{
    public class LoginModel
    {
        private static LoginModel _currentUser;
        public static event EventHandler CurrentUserChanged; // 添加事件定义

        public static LoginModel CurrentUser
        {
            get => _currentUser;
            set
            {
                _currentUser = value;
                CurrentUserChanged?.Invoke(null, EventArgs.Empty); // 触发事件
            }
        }

        public int Id { get; set; }             // 对应 id
        public string Account { get; set; }     // 对应 account
        public string Pwd { get; set; }         // 对应 pwd
        public string Post { get; set; }        // 对应 post（角色）
        public string Name { get; set; }        // 对应 name
        public string Team { get; set; }        // 对应 team
        public string Note { get; set; }        // 对应 note

    }
}
