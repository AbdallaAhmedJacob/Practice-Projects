namespace ContactConsoleApp.Screens
{
    internal class BaseScreen
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
    }
}
