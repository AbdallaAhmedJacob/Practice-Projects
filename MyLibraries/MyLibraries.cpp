#include <iostream>
#include <vector>
#include "clsString.h";
#include "clsDate.h";
#include "clsPeriod.h";
#include "clsUtil.h";
#include "clsInputValidate.h";
		  
using  namespace std;

int main()
{
	clsUtil::SRAND();

	cout << clsInputValidate::InputStringOnly("Enter string");

	/*vector <string> vKeys = clsUtil::GenerateKeys(10, clsUtil::eCapitalLetter, 8, 5, "-");
	
	for (string k : vKeys)
		cout << k << endl;*/

	return 0;
}