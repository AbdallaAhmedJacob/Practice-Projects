using ContactsBusiness;

namespace ContactConsoleApp.Screens
{
    internal abstract class BaseScreen
    {
        protected static void Header(string Title, string SubTitle = "")
        {
            Console.WriteLine($"\t\t\t\t\t______________________________________");
            Console.WriteLine($"\n\n\t\t\t\t\t  {Title}");
            if (SubTitle != "")
            {
                Console.WriteLine($"\n\t\t\t\t\t  {SubTitle}");
            }

            Console.WriteLine($"\n\t\t\t\t\tDate: {DateTime.Now}");
            Console.WriteLine($"\n\t\t\t\t\t______________________________________\n\n");
        }
        public static void PrintContactInfo(Contact contact)
        {
            if (contact == null) return;

            Console.WriteLine($"\t\t\t\t\t______________________________________");
            Console.WriteLine($"\t\t\t\t\t ID        |{contact.ContactID}");
            Console.WriteLine($"\t\t\t\t\t Name      |{contact.FirstNam + " " + contact.LastNam}");
            Console.WriteLine($"\t\t\t\t\t Email     |{contact.Email}");
            Console.WriteLine($"\t\t\t\t\t Phone     |{contact.Phone}");
            Console.WriteLine($"\t\t\t\t\t Country ID|{contact.CountryID}");
        }

    }
}
