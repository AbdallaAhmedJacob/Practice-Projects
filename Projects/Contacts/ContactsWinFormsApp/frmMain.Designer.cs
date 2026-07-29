namespace ContactsWinFormsApp
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            DataGridViewCellStyle dataGridViewCellStyle1 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle2 = new DataGridViewCellStyle();
            dgvAllContacts = new DataGridView();
            cmsContacts = new ContextMenuStrip(components);
            editToolStripMenuItem = new ToolStripMenuItem();
            deleteToolStripMenuItem = new ToolStripMenuItem();
            btnAddContact = new Button();
            panel1 = new Panel();
            txtSearchContact = new TextBox();
            lblTotalContacts = new Label();
            panel2 = new Panel();
            ((System.ComponentModel.ISupportInitialize)dgvAllContacts).BeginInit();
            cmsContacts.SuspendLayout();
            panel1.SuspendLayout();
            panel2.SuspendLayout();
            SuspendLayout();
            // 
            // dgvAllContacts
            // 
            dgvAllContacts.AllowUserToAddRows = false;
            dgvAllContacts.AllowUserToDeleteRows = false;
            dgvAllContacts.AllowUserToResizeColumns = false;
            dgvAllContacts.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            dgvAllContacts.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
            dgvAllContacts.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            dgvAllContacts.BackgroundColor = Color.White;
            dgvAllContacts.BorderStyle = BorderStyle.None;
            dgvAllContacts.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dataGridViewCellStyle1.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = Color.FromArgb(44, 62, 80);
            dataGridViewCellStyle1.Font = new Font("Segoe UI", 10F);
            dataGridViewCellStyle1.ForeColor = Color.White;
            dataGridViewCellStyle1.SelectionBackColor = SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = DataGridViewTriState.True;
            dgvAllContacts.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            dgvAllContacts.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvAllContacts.ContextMenuStrip = cmsContacts;
            dataGridViewCellStyle2.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = Color.White;
            dataGridViewCellStyle2.Font = new Font("Segoe UI", 10F);
            dataGridViewCellStyle2.ForeColor = Color.FromArgb(44, 62, 80);
            dataGridViewCellStyle2.SelectionBackColor = Color.FromArgb(232, 244, 252);
            dataGridViewCellStyle2.SelectionForeColor = Color.FromArgb(41, 128, 185);
            dataGridViewCellStyle2.WrapMode = DataGridViewTriState.False;
            dgvAllContacts.DefaultCellStyle = dataGridViewCellStyle2;
            dgvAllContacts.EnableHeadersVisualStyles = false;
            dgvAllContacts.GridColor = Color.FromArgb(230, 230, 230);
            dgvAllContacts.Location = new Point(0, 0);
            dgvAllContacts.Margin = new Padding(3, 5, 3, 5);
            dgvAllContacts.MultiSelect = false;
            dgvAllContacts.Name = "dgvAllContacts";
            dgvAllContacts.ReadOnly = true;
            dgvAllContacts.RowHeadersVisible = false;
            dgvAllContacts.RowHeadersWidth = 51;
            dgvAllContacts.RowTemplate.Height = 35;
            dgvAllContacts.RowTemplate.ReadOnly = true;
            dgvAllContacts.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvAllContacts.Size = new Size(1187, 816);
            dgvAllContacts.TabIndex = 1;
            dgvAllContacts.CellMouseDown += dgvContacts_CellMouseDown;
            // 
            // cmsContacts
            // 
            cmsContacts.BackColor = Color.White;
            cmsContacts.ImageScalingSize = new Size(20, 20);
            cmsContacts.Items.AddRange(new ToolStripItem[] { editToolStripMenuItem, deleteToolStripMenuItem });
            cmsContacts.Name = "cmsContacts";
            cmsContacts.RenderMode = ToolStripRenderMode.Professional;
            cmsContacts.Size = new Size(211, 80);
            // 
            // editToolStripMenuItem
            // 
            editToolStripMenuItem.Name = "editToolStripMenuItem";
            editToolStripMenuItem.Size = new Size(210, 24);
            editToolStripMenuItem.Text = "Edit";
            // 
            // deleteToolStripMenuItem
            // 
            deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            deleteToolStripMenuItem.Size = new Size(210, 24);
            deleteToolStripMenuItem.Text = "Delete";
            deleteToolStripMenuItem.Click += Delete_Click;
            // 
            // btnAddContact
            // 
            btnAddContact.BackColor = Color.FromArgb(41, 128, 185);
            btnAddContact.FlatAppearance.BorderSize = 0;
            btnAddContact.FlatStyle = FlatStyle.Flat;
            btnAddContact.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            btnAddContact.ForeColor = Color.White;
            btnAddContact.Location = new Point(1010, 19);
            btnAddContact.Margin = new Padding(3, 5, 3, 5);
            btnAddContact.Name = "btnAddContact";
            btnAddContact.Size = new Size(164, 33);
            btnAddContact.TabIndex = 1;
            btnAddContact.Text = "+ Add Contact";
            btnAddContact.UseVisualStyleBackColor = false;
            btnAddContact.Click += AddContact_Click;
            btnAddContact.MouseEnter += btnAdd_MouseEnter;
            btnAddContact.MouseLeave += btnAdd_MouseLeave;
            // 
            // panel1
            // 
            panel1.BackColor = Color.White;
            panel1.Controls.Add(txtSearchContact);
            panel1.Controls.Add(lblTotalContacts);
            panel1.Controls.Add(btnAddContact);
            panel1.Dock = DockStyle.Top;
            panel1.Location = new Point(15, 15);
            panel1.Name = "panel1";
            panel1.Padding = new Padding(10);
            panel1.Size = new Size(1187, 70);
            panel1.TabIndex = 0;
            // 
            // txtSearchContact
            // 
            txtSearchContact.BorderStyle = BorderStyle.FixedSingle;
            txtSearchContact.Font = new Font("Segoe UI", 11F);
            txtSearchContact.Location = new Point(473, 21);
            txtSearchContact.Name = "txtSearchContact";
            txtSearchContact.PlaceholderText = "Search Contacts ...";
            txtSearchContact.Size = new Size(188, 32);
            txtSearchContact.TabIndex = 0;
            // 
            // lblTotalContacts
            // 
            lblTotalContacts.AutoSize = true;
            lblTotalContacts.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            lblTotalContacts.ForeColor = Color.FromArgb(44, 62, 80);
            lblTotalContacts.Location = new Point(13, 22);
            lblTotalContacts.Name = "lblTotalContacts";
            lblTotalContacts.Size = new Size(94, 28);
            lblTotalContacts.TabIndex = 2;
            lblTotalContacts.Text = "Contacts";
            // 
            // panel2
            // 
            panel2.Controls.Add(dgvAllContacts);
            panel2.Dock = DockStyle.Bottom;
            panel2.Location = new Point(15, 107);
            panel2.Name = "panel2";
            panel2.Size = new Size(1187, 816);
            panel2.TabIndex = 1;
            // 
            // frmMain
            // 
            AutoScaleDimensions = new SizeF(9F, 23F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(245, 247, 250);
            ClientSize = new Size(1217, 938);
            Controls.Add(panel2);
            Controls.Add(panel1);
            Font = new Font("Segoe UI", 10F);
            IsMdiContainer = true;
            Margin = new Padding(3, 5, 3, 5);
            MaximumSize = new Size(1235, 985);
            MinimumSize = new Size(1235, 985);
            Name = "frmMain";
            Padding = new Padding(15);
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Contacts";
            Load += frmMain_Load;
            ((System.ComponentModel.ISupportInitialize)dgvAllContacts).EndInit();
            cmsContacts.ResumeLayout(false);
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            panel2.ResumeLayout(false);
            ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvAllContacts;
        private System.Windows.Forms.Button btnAddContact;
        private Panel panel1;
        private ContextMenuStrip cmsContacts;
        private ToolStripMenuItem editToolStripMenuItem;
        private ToolStripMenuItem deleteToolStripMenuItem;
        private Label lblTotalContacts;
        private TextBox txtSearchContact;
        private Panel panel2;
    }
}

