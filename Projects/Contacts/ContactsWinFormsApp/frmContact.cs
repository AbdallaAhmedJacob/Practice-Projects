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
    public partial class frmContact : Form
    {
        Contact contact = new();
        public frmContact(int ContactID, Contact.enMode mode)
        {
            InitializeComponent();
            contact.Mode = mode;
            frmContact_Lode();
        }
        private void frmContact_Lode()
        {

            cbCountries.DataSource = Countries.GetNamesAllCountries();
            cbCountries.DisplayMember = "Country";

            if (contact.Mode == Contact.enMode.Add)
            {
                this.Text = "Add New Contact";
                lblTitle.Text = "Add New Contact";
                cbCountries.SelectedIndex = 0;
            }
            else
            {
                contact = Contact.Find(contact.ContactID);
                if (contact == null)
                {
                    MessageBox.Show("Error: this Contact not found");
                    return;
                }

                this.Text = "Edit Contact";
                lblTitle.Text = $"Edit Contact {contact.ContactID}";
                cbCountries.Text = Countries.Find(contact.CountryID).CountryName;

                txtFirstName.Text = contact.FirstNam;
                txtLastName.Text = contact.LastNam;
                txtPhone.Text = contact.Phone;
                txtEmail.Text = contact.Email;
                txtAddress.Text = contact.Address;
            }
        }
        private void Save_Click(object sender, EventArgs e)
        {
            contact.FirstNam = txtFirstName.Text.Trim();
            contact.LastNam = txtLastName.Text.Trim();
            contact.Phone = txtPhone.Text.Trim();
            contact.Email = txtEmail.Text.Trim();
            contact.Address = txtAddress.Text.Trim();
            contact.CountryID = Countries.Find(cbCountries.Text).CountryID;

            Contact.enMode BeforeMode = contact.Mode;

            if (contact.Save())
            {
                if (BeforeMode == Contact.enMode.Add)
                {
                    contact.Mode = Contact.enMode.Update;
                    MessageBox.Show("Add Contact Successfully");
                }
                else if (BeforeMode == Contact.enMode.Update)
                {
                    MessageBox.Show("Update Contact Successfully");
                }
                frmContact_Lode();
            }
            else
            {
                MessageBox.Show("something went wrong");
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

        private void Close_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
