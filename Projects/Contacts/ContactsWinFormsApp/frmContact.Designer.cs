namespace ContactsWinFormsApp
{
    partial class frmContact
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
            panel1 = new Panel();
            lblTitle = new Label();
            panel3 = new Panel();
            btnClose = new Button();
            btnSave = new Button();
            panel6 = new Panel();
            label2 = new Label();
            label1 = new Label();
            txtLastName = new TextBox();
            txtFirstName = new TextBox();
            panel4 = new Panel();
            label4 = new Label();
            txtEmail = new TextBox();
            label3 = new Label();
            txtPhone = new TextBox();
            panel7 = new Panel();
            cbCountries = new ComboBox();
            label6 = new Label();
            label5 = new Label();
            txtAddress = new TextBox();
            panel2 = new Panel();
            panel1.SuspendLayout();
            panel3.SuspendLayout();
            panel6.SuspendLayout();
            panel4.SuspendLayout();
            panel7.SuspendLayout();
            panel2.SuspendLayout();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.Controls.Add(lblTitle);
            panel1.Dock = DockStyle.Top;
            panel1.Location = new Point(10, 10);
            panel1.Name = "panel1";
            panel1.Size = new Size(477, 50);
            panel1.TabIndex = 0;
            // 
            // lblTitle
            // 
            lblTitle.AutoSize = true;
            lblTitle.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitle.Location = new Point(5, 9);
            lblTitle.Name = "lblTitle";
            lblTitle.Size = new Size(64, 32);
            lblTitle.TabIndex = 2;
            lblTitle.Text = "Title";
            // 
            // panel3
            // 
            panel3.Controls.Add(btnClose);
            panel3.Controls.Add(btnSave);
            panel3.Dock = DockStyle.Bottom;
            panel3.ForeColor = Color.FromArgb(44, 62, 80);
            panel3.Location = new Point(10, 443);
            panel3.Name = "panel3";
            panel3.Size = new Size(477, 50);
            panel3.TabIndex = 4;
            // 
            // btnClose
            // 
            btnClose.BackColor = Color.FromArgb(230, 230, 230);
            btnClose.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            btnClose.ForeColor = Color.FromArgb(44, 62, 80);
            btnClose.Location = new Point(375, 10);
            btnClose.Name = "btnClose";
            btnClose.Size = new Size(94, 29);
            btnClose.TabIndex = 1;
            btnClose.Text = "Close";
            btnClose.UseVisualStyleBackColor = false;
            btnClose.Click += Close_Click;
            // 
            // btnSave
            // 
            btnSave.BackColor = Color.FromArgb(41, 128, 185);
            btnSave.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            btnSave.ForeColor = Color.White;
            btnSave.Location = new Point(244, 10);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(94, 29);
            btnSave.TabIndex = 0;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = false;
            btnSave.Click += Save_Click;
            btnSave.MouseEnter += btn_MouseEnter;
            btnSave.MouseLeave += btn_MouseLeave;
            // 
            // panel6
            // 
            panel6.Controls.Add(label2);
            panel6.Controls.Add(label1);
            panel6.Controls.Add(txtLastName);
            panel6.Controls.Add(txtFirstName);
            panel6.Dock = DockStyle.Top;
            panel6.ForeColor = Color.FromArgb(44, 62, 80);
            panel6.Location = new Point(10, 60);
            panel6.Name = "panel6";
            panel6.Size = new Size(477, 63);
            panel6.TabIndex = 0;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label2.Location = new Point(255, 4);
            label2.Name = "label2";
            label2.Size = new Size(84, 20);
            label2.TabIndex = 1;
            label2.Text = "Last Name";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label1.Location = new Point(3, 4);
            label1.Name = "label1";
            label1.Size = new Size(86, 20);
            label1.TabIndex = 1;
            label1.Text = "First Name";
            // 
            // txtLastName
            // 
            txtLastName.Location = new Point(255, 36);
            txtLastName.Name = "txtLastName";
            txtLastName.Size = new Size(219, 27);
            txtLastName.TabIndex = 1;
            // 
            // txtFirstName
            // 
            txtFirstName.Location = new Point(0, 36);
            txtFirstName.Name = "txtFirstName";
            txtFirstName.Size = new Size(252, 27);
            txtFirstName.TabIndex = 0;
            // 
            // panel4
            // 
            panel4.Controls.Add(label4);
            panel4.Controls.Add(txtEmail);
            panel4.Controls.Add(label3);
            panel4.Controls.Add(txtPhone);
            panel4.Dock = DockStyle.Top;
            panel4.ForeColor = Color.FromArgb(44, 62, 80);
            panel4.Location = new Point(10, 123);
            panel4.Name = "panel4";
            panel4.Size = new Size(477, 63);
            panel4.TabIndex = 1;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label4.Location = new Point(261, 1);
            label4.Name = "label4";
            label4.Size = new Size(47, 20);
            label4.TabIndex = 3;
            label4.Text = "Email";
            // 
            // txtEmail
            // 
            txtEmail.Location = new Point(255, 36);
            txtEmail.Name = "txtEmail";
            txtEmail.Size = new Size(219, 27);
            txtEmail.TabIndex = 1;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label3.Location = new Point(3, 4);
            label3.Name = "label3";
            label3.Size = new Size(53, 20);
            label3.TabIndex = 1;
            label3.Text = "Phone";
            // 
            // txtPhone
            // 
            txtPhone.Location = new Point(0, 36);
            txtPhone.Name = "txtPhone";
            txtPhone.Size = new Size(252, 27);
            txtPhone.TabIndex = 0;
            // 
            // panel7
            // 
            panel7.Controls.Add(cbCountries);
            panel7.Controls.Add(label6);
            panel7.Dock = DockStyle.Top;
            panel7.ForeColor = Color.FromArgb(44, 62, 80);
            panel7.Location = new Point(10, 186);
            panel7.Name = "panel7";
            panel7.Size = new Size(477, 63);
            panel7.TabIndex = 2;
            // 
            // cbCountries
            // 
            cbCountries.DropDownStyle = ComboBoxStyle.DropDownList;
            cbCountries.FlatStyle = FlatStyle.Flat;
            cbCountries.Font = new Font("Segoe UI", 10F);
            cbCountries.ForeColor = Color.FromArgb(44, 62, 80);
            cbCountries.FormattingEnabled = true;
            cbCountries.Location = new Point(5, 26);
            cbCountries.Name = "cbCountries";
            cbCountries.Size = new Size(184, 31);
            cbCountries.TabIndex = 0;
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label6.Location = new Point(5, 3);
            label6.Name = "label6";
            label6.Size = new Size(66, 20);
            label6.TabIndex = 1;
            label6.Text = "Country";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            label5.Location = new Point(2, 0);
            label5.Name = "label5";
            label5.Size = new Size(66, 20);
            label5.TabIndex = 3;
            label5.Text = "Address";
            // 
            // txtAddress
            // 
            txtAddress.Dock = DockStyle.Bottom;
            txtAddress.Location = new Point(0, 34);
            txtAddress.Multiline = true;
            txtAddress.Name = "txtAddress";
            txtAddress.Size = new Size(477, 47);
            txtAddress.TabIndex = 0;
            // 
            // panel2
            // 
            panel2.Controls.Add(label5);
            panel2.Controls.Add(txtAddress);
            panel2.Dock = DockStyle.Top;
            panel2.ForeColor = Color.FromArgb(44, 62, 80);
            panel2.Location = new Point(10, 249);
            panel2.Name = "panel2";
            panel2.Size = new Size(477, 81);
            panel2.TabIndex = 3;
            // 
            // frmContact
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.White;
            ClientSize = new Size(497, 503);
            Controls.Add(panel2);
            Controls.Add(panel7);
            Controls.Add(panel4);
            Controls.Add(panel6);
            Controls.Add(panel3);
            Controls.Add(panel1);
            FormBorderStyle = FormBorderStyle.FixedDialog;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmContact";
            Padding = new Padding(10);
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Add\\Edit Contact";
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            panel3.ResumeLayout(false);
            panel6.ResumeLayout(false);
            panel6.PerformLayout();
            panel4.ResumeLayout(false);
            panel4.PerformLayout();
            panel7.ResumeLayout(false);
            panel7.PerformLayout();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private Panel panel3;
        private Panel panel6;
        private Label label1;
        private TextBox txtFirstName;
        private Label label2;
        private TextBox txtLastName;
        private Panel panel4;
        private Label label4;
        private TextBox txtEmail;
        private Label label3;
        private TextBox txtPhone;
        private Panel panel7;
        private ComboBox cbCountries;
        private Label label5;
        private TextBox txtAddress;
        private Label label6;
        private Label lblTitle;
        private Button btnClose;
        private Button btnSave;
        private Panel panel2;
    }
}