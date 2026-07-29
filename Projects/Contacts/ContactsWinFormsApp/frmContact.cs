using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ContactsWinFormsApp
{
    public partial class frmContact : Form
    {
        public frmContact(int ContactID, frmMain.enMode mode)
        {
            InitializeComponent();

            if (mode == frmMain.enMode.Add)
            {
                this.Text = "Add New Contact";
                lblTitle.Text = "Add New Contact";
            }
            else
            {
                this.Text ="Edit Contact";
                lblTitle.Text = $"Edit Contact {ContactID}";
            }
            
        }



        public void btn_MouseEnter(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            button.BackColor = Color.FromArgb(52, 152, 219);
        }

        public void btn_MouseLeave(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            button.BackColor = Color.FromArgb(41, 128, 185);
        }
    }
}
