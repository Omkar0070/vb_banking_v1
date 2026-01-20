using System;
using System.Windows.Forms;

namespace BankingSystem
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void cmdLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Please enter username and password", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (ValidateUser(username, password))
            {
                MessageBox.Show("Login successful!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
            }
            else
            {
                MessageBox.Show("Invalid credentials", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmdCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Method to simulate user validation
        private bool ValidateUser(string username, string password)
        {
            // Replace with actual validation logic
            // For now let's assume valid credentials are "admin" and "password123"
            return username == "admin" && password == "password123";
        }
    }
}

// This code assumes you have a Form Designer set up. The form needs a 
// TextBox named 'txtUsername', a TextBox named 'txtPassword', and 
// two Button controls named 'cmdLogin' and 'cmdCancel', which 
// should call 'cmdLogin_Click' and 'cmdCancel_Click' events respectively.