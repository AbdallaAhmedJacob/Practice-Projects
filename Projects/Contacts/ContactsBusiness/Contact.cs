using ContactsDataAccess;
using System;
using System.Data;
using System.Numerics;

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
        public enMode Mode { get; set; }

        public enum enMode { Update = 1, Add = 2 }
        public Contact()
        {
            ContactID = -1;
            FirstNam = "";
            LastNam = "";
            Email = "";
            Phone = "";
            CountryID = -1;

            Mode = enMode.Add;
        }

        private Contact(int contactID, string firstNam, string lastNam, string email, string phone, int countryID)
        {
            ContactID = contactID;
            FirstNam = firstNam;
            LastNam = lastNam;
            Email = email;
            Phone = phone;
            CountryID = countryID;

            Mode = enMode.Update;
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
        public bool Add()
        {
            bool IsAdded = false;

            // To Do validation

            this.ContactID = ContactData.AddContact(this.FirstNam, this.LastNam, 
                this.Email, this.Phone, this.CountryID);
            if(this.ContactID != -1)
            {
                IsAdded = true;
            }
            return IsAdded;
        }


    }
}
