using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactsConsoleApp.Screens
{
    internal class AddContactScreen : BaseScreen
    {
        public static void Show()
        {
            BaseScreen.Header("Add Contact");

            Contact contact = new Contact();

            ReadContactInfo(ref contact);

            string result = (contact.Save()) ? "Successfully :)" : "fild :(";
            Console.WriteLine($"\n\t\t\t\t\tContact Add {result}");
        }
    }
}
