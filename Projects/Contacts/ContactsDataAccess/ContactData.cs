using Microsoft.Data.SqlClient;
using System.Globalization;

namespace ContactsDataAccess
{
    public class ContactData
    {     
        public static bool GetContactInfoByID(ref int contactID, ref string firstNam, ref string lastNam, 
            ref string email, ref string phone, ref int countryID)
        {
            bool IsFound = false;

            SqlConnection connection = new SqlConnection(ContactsDataAccessSettings.ConnectionString);
            string sql = @"SELECT * FROM Contacts WHERE ContactID = @ContactID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("ContactID", contactID);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    contactID = (int)reader["ContactID"];
                    firstNam = (string)reader["FirstName"];
                    lastNam = (string)reader["LastName"];
                    email = (string)reader["Email"];
                    phone = (string)reader["Phone"];
                    countryID = (int)reader["CountryID"];
                    
                    IsFound = true;
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                // handle Exeption.
                IsFound = false;
            }
            finally
            {
                connection.Close();
            }
            return IsFound;
        }
    }
}
