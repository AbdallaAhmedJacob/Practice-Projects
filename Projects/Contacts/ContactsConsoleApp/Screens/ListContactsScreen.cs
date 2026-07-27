using ContactConsoleApp.Screens;
using ContactsBusiness;
using System.Data;
namespace ContactsConsoleApp.Screens
{
    internal class ListContactsScreen : BaseScreen
    {
        public static void Show()
        {
            Header("List Contact");

            DataTable dataTable = Contact.GetAllContacts();

            foreach (DataRow row in dataTable.Rows)
            {
                Console.WriteLine($"\t\t\t\t\t{row["FirstName"]} {row["LastName"]}, {row["Phone"]},  {row["Email"]}");
            }
        }
    }
}
