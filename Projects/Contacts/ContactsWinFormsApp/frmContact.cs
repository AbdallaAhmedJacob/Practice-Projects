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
        public frmContact(int ContactID, frmMain.enMode mode)
        {
            InitializeComponent();

            if (mode == frmMain.enMode.Add)
            {
                this.Text = "Add New Contact";
                lblTitle.Text = "Add New Contact";
                cbCountries.DataSource = Countries.GetNamesAllCountries();
                cbCountries.DisplayMember = "Country";
                cbCountries.SelectedIndex = 0;
            }
            else
            {
                contact = Contact.Find(ContactID);
                if (contact == null) {
                    MessageBox.Show("Error: this Contact not found");
                    return;
                }

                this.Text ="Edit Contact";
                lblTitle.Text = $"Edit Contact {ContactID}";
                cbCountries.DisplayMember = Countries.Find(contact.ContactID).CountryName;
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
