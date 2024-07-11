using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace k_Optimization_Hard
{
    public partial class main : Form
    {
        public main()
        {
            InitializeComponent();
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            RunAsAdmin(Path.Combine("Res", "BoostBeta.exe"));
            Task.Delay(3000); // Задержка в 3 секунды
            RunAsAdmin(Path.Combine("Res", "Optimization.bat"));


        }

        private void guna2CircleButton1_Click(object sender, EventArgs e)
        {

            InfoForm InfoForm = new InfoForm();
            InfoForm.Show();

            
          


            


        }







        private void RunAsAdmin(string fileName)
        {
            // Полный путь к файлу
            string filePath = System.IO.Path.Combine(Application.StartupPath, fileName);

            // Создаем процесс для запуска файла с правами администратора
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = filePath,
                UseShellExecute = true,
                Verb = "runas"  // Запускаем от имени администратора
            };

            try
            {
                // Запускаем процесс
                Process.Start(psi);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при запуске {fileName}: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


    }







}
