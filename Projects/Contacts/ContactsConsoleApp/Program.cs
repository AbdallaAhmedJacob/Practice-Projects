using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactConsoleApp
{
    internal class Program
    {
        /*
         
        المطلوب هو
(ID)البحث عن البلد عن طريق *
(Name)البحث عن البلد عن طريق *
(ID)هل البلد موجود  عن طريق *
(Name)هل البلد موجود  عن طريق *
اضافة بلد*
عرض لائحة البلدان*
(countact) نفس مافعلناه مع
         */

        private static void testFindCountryByID(int ID)
        {
            Countries country = Countries.Find(ID);
            if (country != null)
                Console.WriteLine($"{country.CountryID} {country.CountryName}");
        }
        private static void testFindCountryByName(string CountryID)
        {
            Countries country = Countries.Find(CountryID);
            if (country != null)
                Console.WriteLine($"{country.CountryID} {country.CountryName}");
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
            testFindCountryByName("canada");



        }
    }
}
