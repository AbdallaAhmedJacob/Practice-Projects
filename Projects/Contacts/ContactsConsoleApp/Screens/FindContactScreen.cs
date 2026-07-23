using System;
using System.Data;
using ContactsBusiness;

namespace ContactConsoleApp.Screens
{
    internal class FindContactScreen : BaseScreen
    {
        public static void ShowFindContactScreen()
        {
            BaseScreen.Header("Find Contact");
            string con = "n";

            do
            {
                Console.Write("\n\t\t\t\t\t Enter ID: ");
                var ID = Console.ReadLine();
                // validation integer.
                Contact contact = Contact.Find(int.Parse(ID));
                if (contact != null)
                {
                    Console.WriteLine($"\t\t\t\t\t______________________________________");
                    Console.WriteLine($"\t\t\t\t\t ID        |{contact.ContactID}");
                    Console.WriteLine($"\t\t\t\t\t Name      |{contact.FirstNam + " " + contact.LastNam}");
                    Console.WriteLine($"\t\t\t\t\t Email     |{contact.Email}");
                    Console.WriteLine($"\t\t\t\t\t Phone     |{contact.Phone}");
                    Console.WriteLine($"\t\t\t\t\t Country ID|{contact.CountryID}");
                    Console.WriteLine($"\t\t\t\t\t______________________________________");
                }
                else
                {
                    Console.WriteLine($"\t\t\t\t\t______________________________________");
                    Console.WriteLine($"\t\t\t\t\tContact {ID} is not found :(");
                    Console.WriteLine($"\t\t\t\t\t______________________________________");
                }

                Console.Write("\t\t\t\t\tDo you want to find another ID? [Y/N] ");
                con = Console.ReadLine();
            } while (con == "y" || con == "Y");
        }
    }
}
