using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactsConsoleApp.Screens
{
    internal class UpdateContactScreen : BaseScreen
    {
        public static void Show()
        {
            Header("Update Contact");

            Console.Write("\t\t\t\t\tEnter ID ");
            if (!int.TryParse(Console.ReadLine(), out int contactID))
            {
                Console.WriteLine("\t\t\t\t\tUpdate failed");
                return;
            }
            Contact contact = Contact.Find(contactID);
            if (contact != null)
            {
                PrintContactInfo(contact);
                Console.WriteLine($"\t\t\t\t\tUpdate Contact ID: {contact.ContactID}");
                ReadContactInfo(ref contact);
                Console.Write("\t\t\t\t\tAre you sur (Y/N) ");
                string con = Console.ReadLine().ToLower();
                if (con == "y")
                {
                    if (contact.Save())
                    {
                        Console.WriteLine("\t\t\t\t\tContact update Successfully\n\n");
                        Console.WriteLine("\t\t\t\t\tContact after update");
                        PrintContactInfo(contact);
                    }
                }
            }
        }
    }
}
