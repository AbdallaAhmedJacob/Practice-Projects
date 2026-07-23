using System;
using System.Data;
using ContactsDataAccess;

namespace ContactsBusiness
{
    public class Contact
    {
        public int ContactID { get; set; }
        public string FirstNam { get; set; }
        public string LastNam { get; set; } 
        public string Email { get; set; }
        public string Phone { get; set; }
        public int CountryID { get; set; }

        Contact(int contactID, string firstNam, string lastNam, string email, string phone, int countryID)
        {
            ContactID = contactID;
            FirstNam = firstNam;
            LastNam = lastNam;
            Email = email;
            Phone = phone;
            CountryID = countryID;
        }

        public static Contact Find(int ID)
        {
            string FirstName = "", LastName = "", Email = "", Phone = "";
            int CountryID = -1;

            if(ContactData.GetContactInfoByID(ref ID, ref FirstName, ref LastName, ref Email, ref Phone, ref CountryID))             
            {
                return new Contact(ID, FirstName, LastName, Email, Phone, CountryID);
            }
            else
            {
                return null;
            }
        }
    }
}
