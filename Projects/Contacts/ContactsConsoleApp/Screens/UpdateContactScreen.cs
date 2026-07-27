using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactsConsoleApp.Screens
{
    internal class UpdateContactScreen : BaseScreen
    {
        public static void Show()
        {
            Header("Update Contact");

            Console.WriteLine("\t\t\t\t\tEnter ID ");
            if (!int.TryParse(Console.ReadLine(), out int contactID))
            {
                Console.WriteLine("Update failed");
                return;
            }
            Contact contact = Contact.Find(contactID);
            if (contact != null)
            {

            }
        }
    }
}
