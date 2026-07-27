using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactsConsoleApp.Screens
{
    internal class IsExistContactScreen : BaseScreen
    {
        public static void Show()
        {
            Header("Is Exist Contact");

            Console.Write("\t\t\t\t\tEnter ID: ");
            int.TryParse(Console.ReadLine(), out int ContactID);
            if (Contact.IsExist(ContactID))
            {
                Console.WriteLine("\t\t\t\t\tYes, contact is Exist");
            }
            else
            {
                Console.WriteLine("\t\t\t\t\tNo, contact is not Exist");
            }
        }
    }
}
