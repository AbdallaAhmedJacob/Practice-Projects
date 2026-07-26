using ContactConsoleApp.Screens;
using ContactsBusiness;

namespace ContactsConsoleApp.Screens
{
    internal class AddContactScreen : BaseScreen
    {
        private static void _ReadContactInfo(ref Contact contact)
        {
            Console.Write("\t\t\t\t\tEnter first name       | ");
            contact.FirstNam = Console.ReadLine();                
            Console.Write("\t\t\t\t\tEnter last name        | ");
            contact.LastNam = Console.ReadLine();                 
            Console.Write("\t\t\t\t\tEnter phone number     | ");
            contact.Phone = Console.ReadLine();                   
            Console.Write("\t\t\t\t\tEnter email            | ");
            contact.Email = Console.ReadLine();                   
            Console.Write("\t\t\t\t\tEnter Country id (int) | ");

            if (int.TryParse(Console.ReadLine(), out int countryid))
                contact.CountryID = countryid;
        }
        public static void Show()
        {
            BaseScreen.Header("Add Contact");

            Contact contact = new Contact();

            _ReadContactInfo(ref contact);

            string result = (contact.Add()) ? "Successfully :)" : "fild :(";
            Console.WriteLine($"\n\t\t\t\t\tContact Add {result}");
          

        }
    }
}
