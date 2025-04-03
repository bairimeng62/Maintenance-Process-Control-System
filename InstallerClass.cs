//using System.Configuration;
//using System.IO;
//using System.Collections;
//using System.ComponentModel;
//using System.Configuration.Install;
//using System.Diagnostics;

//[RunInstaller(true)]
//public class InstallerClass : Installer
//{
//    public override void Install(IDictionary stateSaver)
//    {
//        base.Install(stateSaver);

//        // 获取用户输入
//        string server = Context.Parameters["SERVERNAME"];
//        string database = Context.Parameters["DATABASENAME"];
//        string user = Context.Parameters["DBUSERNAME"];
//        string password = Context.Parameters["DBPASSWORD"];

//        // 修改App.config
//        string configPath = Path.Combine(Context.Parameters["targetdir"], "YourApp.exe.config");
//        Configuration config = ConfigurationManager.OpenExeConfiguration(configPath);
//        var connectionString = config.ConnectionStrings.ConnectionStrings["DefaultConnection"];
//        connectionString.ConnectionString =
//            $"Server={server};Database={database};User Id={user};Password={password};";
//        config.Save();

//        // 执行SQL脚本
//        Process.Start(
//            Path.Combine(Context.Parameters["targetdir"], "RunSQLScript.bat"),
//            $"{server} {database} {user} {password}"
//        );
//    }
//}