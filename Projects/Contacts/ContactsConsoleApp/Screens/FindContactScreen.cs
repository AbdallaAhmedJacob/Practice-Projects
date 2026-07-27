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
                    BaseScreen.PrintContactInfo(contact);
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
