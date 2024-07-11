using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace k_Optimization_Hard
{
    public partial class InfoForm : Form
    {
        public InfoForm()
        {
            InitializeComponent();
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {



            main main = new main(); // замените OtherForm на имя вашей формы
            main.Show();

            // Закрываем текущую форму
            this.Close();


        }
    }
}
