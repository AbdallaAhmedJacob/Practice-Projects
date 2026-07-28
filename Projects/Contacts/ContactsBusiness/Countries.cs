using ContactsDataAccess;
using System.Numerics;

namespace ContactsBusiness
{
    public class Countries
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }
        public string Code { get; set; }
        public string PhoneCode { get; set; }

        private Countries(int CountryID, string CountryName, string Code, string PhoneCode)
        {
            this.CountryID = CountryID;
            this.CountryName = CountryName;
            this.Code = Code;
            this.PhoneCode = PhoneCode;
        }
        public static Countries Find(int ID)
        {
            int CountryID = ID;
            string CountryName = "", Code = "", PhoneCode = "";

            if (CountriesData.GetCountryInfoByID(ref CountryID, ref CountryName, ref Code, ref PhoneCode))
            {
                return new Countries(CountryID, CountryName, Code, PhoneCode);
            }
            else
            {
                return null;
            }
        }
        public static Countries Find(string CountryName)
        {
            string Code = "", PhoneCode = "";
            int CountryID = -1;

            if (CountriesData.GetCountryInfoByName(ref CountryID, ref CountryName, ref Code, ref PhoneCode))
            {
                return new Countries(CountryID, CountryName, Code, PhoneCode);
            }
            else
            {
                return null;
            }
        }
        public static bool IsExist(string CountryName)
        {
            return CountriesData.IsExist(CountryName);
        }
    }
}
