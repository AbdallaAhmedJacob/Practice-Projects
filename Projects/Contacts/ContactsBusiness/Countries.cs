using ContactsDataAccess;
using System.Numerics;

namespace ContactsBusiness
{
    public class Countries
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }

        private Countries(int CountryID, string CountryName)
        {
            this.CountryID = CountryID;
            this.CountryName = CountryName;
        }
        public static Countries Find(int ID)
        {
            string CountryName = "";

            if (CountriesData.GetCountryInfoByID(ref ID, ref CountryName))
            {
                return new Countries(ID, CountryName);
            }
            else
            {
                return null;
            }
        }
    }
}
