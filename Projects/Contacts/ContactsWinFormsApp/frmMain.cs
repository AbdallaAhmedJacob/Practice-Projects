using ContactsBusiness;
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
    public partial class frmMain : Form
    {
        public enum enMode { Add = 1, Update = 2 }
        public frmMain()
        {
            InitializeComponent();
        }
        private void _RefreshDataToGrid()
        {
            dgvAllContacts.DataSource = Contact.GetAllContacts();
            lblTotalContacts.Text = $"Contacts ({dgvAllContacts.RowCount})";
        }
        public void frmMain_Load(object sender, EventArgs e)
        {
            _RefreshDataToGrid();
            txtSearchContact.Focus();
            dgvAllContacts.RowHeadersVisible = false;
            dgvAllContacts.Dock = DockStyle.Fill;
            dgvAllContacts.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            dgvAllContacts.Columns["ContactID"].HeaderText = "ID";
            dgvAllContacts.Columns["ID"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgvAllContacts.Columns["FirstName"].HeaderText = "First Name";
            dgvAllContacts.Columns["LastName"].HeaderText = "Last Name";
            dgvAllContacts.Columns["Email"].HeaderText = "Email";
            dgvAllContacts.Columns["Phone"].HeaderText = "Phone";
            dgvAllContacts.Columns["Address"].HeaderText = "Address";
            dgvAllContacts.Columns["CountryID"].HeaderText = "Country";

            dgvAllContacts.Columns["ContactID"].FillWeight = 50;
            dgvAllContacts.Columns["FirstName"].FillWeight = 85;
            dgvAllContacts.Columns["LastName"].FillWeight = 85;
            dgvAllContacts.Columns["Phone"].FillWeight = 90;
            dgvAllContacts.Columns["CountryID"].FillWeight = 60;
            dgvAllContacts.Columns["Email"].FillWeight = 140;
            dgvAllContacts.Columns["Address"].FillWeight = 140;
        }

        private void AddContact_Click(object sender, EventArgs e)
        {
            Form AddContact = new frmContact(-1, enMode.Add);
            AddContact.ShowDialog();
        }



        public void btnAdd_MouseEnter(object sender, EventArgs e)
        {
            btnAddContact.BackColor = Color.FromArgb(52, 152, 219); 
        }

        public void btnAdd_MouseLeave(object sender, EventArgs e)
        {
            btnAddContact.BackColor = Color.FromArgb(41, 128, 185);
        }

        private void dgvContacts_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right && e.RowIndex >= 0)
            {
                dgvAllContacts.ClearSelection();

                dgvAllContacts.Rows[e.RowIndex].Selected = true;
            }
        }
    }
}
