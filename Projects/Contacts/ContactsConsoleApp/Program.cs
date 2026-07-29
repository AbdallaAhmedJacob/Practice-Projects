using ContactConsoleApp.Screens;
using ContactsBusiness;
using System.Data;

namespace ContactConsoleApp
{
    internal class Program
    {
        private static void testFindCountryByID(int ID)
        {
            Countries country = Countries.Find(ID);
            if (country != null)
                Console.WriteLine($"Cuontry Info " +
                    $"\nID: {country.CountryID} " +
                    $"\nName: {country.CountryName} " +
                    $"\nCode: {country.Code} " +
                    $"\nPhone Code: {country.PhoneCode}");
        }
        private static void testFindCountryByName(string CountryID)
        {
            Countries country = Countries.Find(CountryID);
            if (country != null)
                Console.WriteLine($"{country.CountryID} {country.CountryName}");
        }
        private static void testIsExistCountry(string CountryNmae)
        {
            if (Countries.IsExist(CountryNmae))
                Console.WriteLine("Yes, Contry is here.");
            else
                Console.WriteLine("No, Contry is not here.");
        }
        private static void testGetNamesAllCountries()
        {
            DataTable dataTable = Countries.GetNamesAllCountries();
            foreach (DataRow row in dataTable.Rows)
            {
                Console.WriteLine($"\t\t\t\t\t{row["Country"]}");
            }
        }
        static void Main(string[] args)
        {
            //Contact tests

            //FindContactScreen.ShowFindContactScreen();
            //AddContactScreen.Show();
            //UpdateContactScreen.Show();
            //DeleteContactScreen.Show();
            //ListContactsScreen.Show();
            //IsExistContactScreen.Show();

            // Countries tests

            //testFindCountryByID(3);
            //testFindCountryByName("canada");
            //testIsExistCountry("germany");
            //testIsExistCountry("qatar");
            testGetNamesAllCountries();


        }
    }
}
