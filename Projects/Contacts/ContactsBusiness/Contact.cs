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
        public string Address { get; set; }
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

        private Contact(int contactID, string firstNam, string lastNam, string email, string phone, string address, int countryID)
        {
            ContactID = contactID;
            FirstNam = firstNam;
            LastNam = lastNam;
            Email = email;
            Phone = phone;
            CountryID = countryID;
            Address = address;

            Mode = enMode.Update;
        }

        public static Contact Find(int ID)
        {
            string FirstName = "", LastName = "", Email = "", Phone = "", Address = "";
            int CountryID = -1;

            if (ContactData.GetContactInfoByID(ref ID, ref FirstName, ref LastName, ref Email, ref Phone, ref Address, ref CountryID))
            {
                return new Contact(ID, FirstName, LastName, Email, Phone, Address, CountryID);
            }
            else
            {
                return null;
            }
        }
        private int _Add()
        {
            // To Do validation

            this.ContactID = ContactData.AddContact(this.FirstNam, this.LastNam,
                this.Email, this.Phone, this.Address, this.CountryID);
            if (this.ContactID != -1)
            {
                this.Mode = enMode.Update;
                return this.ContactID;
            }
            return -1;
        }
        private bool _Update()
        {
            this.Mode = enMode.Update;

            return ContactData.UpdateContact(this.ContactID, this.FirstNam,
                this.LastNam, this.Phone, this.Email, this.Address, this.CountryID);
        }
        public static bool Delete(int ID)
        {
            return ContactData.DeleteContact(ID);
        }
        public static DataTable GetAllContacts()
        {
            return ContactData.GetAllContacts();
        }
        public static bool IsExist(int ContactID)
        {
            return ContactData.IsExist(ContactID);
        }

        public bool Save()
        {
            switch (this.Mode)
            {
                case enMode.Update:
                    return this._Update();
                case enMode.Add:
                    return (this._Add() != -1);
                default:
                    return false;
            }
        }
    }
}
