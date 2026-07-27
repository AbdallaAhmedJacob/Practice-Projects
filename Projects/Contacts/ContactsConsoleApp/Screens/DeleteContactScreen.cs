using ContactConsoleApp.Screens;
using ContactsBusiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactsConsoleApp.Screens
{
    internal class DeleteContactScreen : BaseScreen
    {
        public static void Show()
        {
            Header("Delete Contact");
            Console.Write("\t\t\t\t\tEnter ID: ");
            int.TryParse(Console.ReadLine(), out int ContactID);

            if (Contact.Delete(ContactID) == true)
            {
                Console.WriteLine("\n\t\t\t\t\tContact Deleted Successfully");
            }
            else
            {
                Console.WriteLine("\n\t\t\t\t\tContact Deletion Failed");
            }
        }
    }
}
