using Microsoft.Data.SqlClient;
using System.Data;
using System.Net;

namespace ContactsDataAccess
{
    public class ContactData
    {
        public static bool GetContactInfoByID(ref int contactID, ref string firstName, ref string lastName,
            ref string email, ref string phone,ref string address, ref int countryID)
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
                    firstName = (string)reader["FirstName"];
                    lastName = (string)reader["LastName"];
                    email = (string)reader["Email"];
                    phone = (string)reader["Phone"];
                    address = (string)reader["Address"];
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

        // The function restore the added record id.
        public static int AddContact(string FirstName, string LastName,
                string Email, string Phone, string Address, int CountryID)
        {
            int ID = -1;

            SqlConnection connection = new SqlConnection(ContactsDataAccessSettings.ConnectionString);
            string sql = @"INSERT INTO Contacts(FirstName, LastName, Email, Phone,Address, CountryID)
                           VALUES (@FirstName, @LastName, @Email, @Phone, @Address, @CountryID)
                           SELECT SCOPE_IDENTITY()";
                              
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@FirstName", FirstName);

            if (LastName != null)
                command.Parameters.AddWithValue("@LastName", LastName);
            else
                command.Parameters.AddWithValue("@lastName", DBNull.Value);

            command.Parameters.AddWithValue("@Email", Email);
            command.Parameters.AddWithValue("@Phone", Phone);
            if (Address != null)
                command.Parameters.AddWithValue("@Address", Address);
            else
                command.Parameters.AddWithValue("@Address", DBNull.Value);
            command.Parameters.AddWithValue("@CountryID", CountryID);


            try
            {
                connection.Open();
                object result = command.ExecuteScalar();
                if (result != null && int.TryParse(result.ToString(), out int insertedID))
                {
                    ID = insertedID;
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return ID;
        }
        public static bool UpdateContact(int ContactID, string FirstName, string LastName,
                string Email, string Phone, string Address, int CountryID)
        {
            bool IsUpdated = false;

            SqlConnection connection = new SqlConnection(ContactsDataAccessSettings.ConnectionString);
            string sql = @"UPDATE Contacts
                           SET
                                FirstName=@FirstName,
                                LastName=@LastName,
                                Phone=@Phone,
                                Email=@Email,
                                Address=@Address,
                                CountryID=@CountryID
                            WHERE ContactID=@ContactID";
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@ContactID",ContactID);
            command.Parameters.AddWithValue("@FirstName", FirstName);
            command.Parameters.AddWithValue("@LastName", LastName);
            command.Parameters.AddWithValue("@Phone", Phone);
            command.Parameters.AddWithValue("@Email", Email);
            command.Parameters.AddWithValue("@Address", Address);
            command.Parameters.AddWithValue("@CountryID", CountryID);

            try
            {
                connection.Open();
                int result = command.ExecuteNonQuery();
                if (result != 0) IsUpdated = true;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return IsUpdated;
        }
        public static bool DeleteContact(int ContactID)
        {
            bool IsDeleted = false;
            SqlConnection connection = new(ContactsDataAccessSettings.ConnectionString);
            string sql = @"DELETE FROM Contacts
                           WHERE ContactID = @ContactID";
            SqlCommand command = new(sql, connection);
            command.Parameters.AddWithValue("@ContactID", ContactID);

            try
            {
                connection.Open();
                int RowsAffected = command.ExecuteNonQuery();
                if (RowsAffected > 0) IsDeleted = true;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return IsDeleted;
        }
        public static DataTable GetAllContacts()
        {
            SqlConnection connection = new(ContactsDataAccessSettings.ConnectionString);
            string sql = @"SELECT Contacts.ContactID AS ID,
                                  Contacts.FirstName + ' ' + Contacts.LastName AS Name, 
                                  Contacts.Phone,
                                  Contacts.Email,
                                  Contacts.Address,
                                  Countries.CountryName AS Country
                           FROM Contacts
                           INNER JOIN Countries ON Contacts.CountryID = Countries.CountryID";
                           
            SqlCommand command = new(sql, connection);
            DataTable dataTable = new();
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    dataTable.Load(reader);
                }
                reader.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return dataTable;
        }
        public static bool IsExist(int ContactID)
        {
            bool IsExist = false;

            SqlConnection connection = new(ContactsDataAccessSettings.ConnectionString);
            string sql = @"SELECT FOUND =1 FROM Contacts WHERE ContactID = @ContactID";
            SqlCommand command = new(sql, connection);
            command.Parameters.AddWithValue("@ContactID", ContactID);

            try
            {
                connection.Open();
                object result = command.ExecuteScalar();
                if (result != null) IsExist = true;
            }
            catch (Exception ex)
            {
            }
            finally
            {
                connection.Close();
            }

            return IsExist;
        }

       
    }
}
