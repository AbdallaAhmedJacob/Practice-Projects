using Microsoft.Data.SqlClient;

namespace ContactsDataAccess
{
    public class CountriesData
    {
        public static bool GetCountryInfoByID(ref int CountryID, ref string CountryName)
        {
            bool IsFound = false;

            SqlConnection connection = new SqlConnection(ContactsDataAccessSettings.ConnectionString);
            string sql = @"SELECT * FROM Countries WHERE CountryID = @CountryID";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("CountryID", CountryID);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    CountryID = (int)reader["CountryID"];
                    CountryName = (string)reader["CountryName"];

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
