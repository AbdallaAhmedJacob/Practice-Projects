namespace ContactsWinForms
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
            this.dgvAllContacts = new System.Windows.Forms.DataGridView();
            this.btnAddContct = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAllContacts)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvAllContacts
            // 
            this.dgvAllContacts.AllowUserToAddRows = false;
            this.dgvAllContacts.AllowUserToDeleteRows = false;
            this.dgvAllContacts.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAllContacts.Location = new System.Drawing.Point(0, 170);
            this.dgvAllContacts.Name = "dgvAllContacts";
            this.dgvAllContacts.ReadOnly = true;
            this.dgvAllContacts.RowHeadersWidth = 51;
            this.dgvAllContacts.RowTemplate.Height = 24;
            this.dgvAllContacts.Size = new System.Drawing.Size(1082, 483);
            this.dgvAllContacts.TabIndex = 1;
            // 
            // btnAddContct
            // 
            this.btnAddContct.Location = new System.Drawing.Point(12, 53);
            this.btnAddContct.Name = "btnAddContct";
            this.btnAddContct.Size = new System.Drawing.Size(145, 59);
            this.btnAddContct.TabIndex = 0;
            this.btnAddContct.Text = "Add Contact";
            this.btnAddContct.UseVisualStyleBackColor = true;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1082, 653);
            this.Controls.Add(this.btnAddContct);
            this.Controls.Add(this.dgvAllContacts);
            this.IsMdiContainer = true;
            this.Name = "frmMain";
            this.Text = "Contacts";
            ((System.ComponentModel.ISupportInitialize)(this.dgvAllContacts)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvAllContacts;
        private System.Windows.Forms.Button btnAddContct;
    }
}

