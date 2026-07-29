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

            dgvAllContacts.Columns["ID"].FillWeight = 50;
            dgvAllContacts.Columns["ID"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgvAllContacts.Columns["Name"].FillWeight = 85;
            dgvAllContacts.Columns["Phone"].FillWeight = 90;
            dgvAllContacts.Columns["Email"].FillWeight = 140;
            dgvAllContacts.Columns["Address"].FillWeight = 140;
            dgvAllContacts.Columns["Country"].FillWeight = 80;
        }

        private void AddContact_Click(object sender, EventArgs e)
        {
            Form AddContact = new frmContact(-1, Contact.enMode.Add);
            AddContact.ShowDialog();
            _RefreshDataToGrid();
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

        private void Delete_Click(object sender, EventArgs e)
        {
            if (dgvAllContacts.Rows.Count > 0)
            {
                DataGridViewRow selectRow = dgvAllContacts.SelectedRows[0];
                DialogResult result = MessageBox.Show("Are you sure you want to delete this contact",
                    "Confirm Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == DialogResult.Yes)
                {
                    int ContactID = Convert.ToInt32(selectRow.Cells[0].Value);
                    if (Contact.Delete(ContactID))
                    {
                        dgvAllContacts.Rows.Remove(selectRow);
                        MessageBox.Show("Contact delete successfully");
                        _RefreshDataToGrid();
                    }
                    else
                    {
                        MessageBox.Show("Contact delete fiald");
                    }
                }
            }

        }

        private void Edit_Click(object sender, EventArgs e)
        {
            DataGridViewRow selectRow = dgvAllContacts.SelectedRows[0];
            int ContactID = Convert.ToInt32(selectRow.Cells["ID"].Value);
            Form form = new frmContact(ContactID, Contact.enMode.Update);
            form.ShowDialog();
        }
    }
}
