#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <iomanip>

using namespace std;

struct sClient
{
	string AccountNumber = "";
	string PinCode = "";
	string Name = "";
	string Phone = "";
	float AccountBalance = 0;
};

enum enQuickWithdrawOption { e20 = 1, e50 = 2, e100 = 3, e200 = 4, e400 = 5, e600 = 6, e800 = 7, e1000 = 8, eExit = 9 };

const string ClientsFileName = "Clients.text";

sClient CurrentClient;

void Login();
void ShowATMMainMenueScreen();
void ShowQuickWithdrawScreen();

short ReadOption(string Message, short From, short To)
{
	short Choose = 0;

	do
	{
		cout << Message << "[ " << From << " to " << To << " ]: ";
		cin >> Choose;

		while (cin.fail())
		{
			// user didn't input a number
			cin.clear();
			cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

			cout << "Invalid Number, enter valid one" << endl;
			cin >> Choose;
		}
	} while (Choose < From || Choose > To);

	return Choose;
}

vector <string> FillVectorWithString(string S1, string Separators = "#//#")
{
	vector <string> vS1;
	string sWord;
	short pos = 0;

	while ((pos = (short)S1.find(Separators)) != std::string::npos)
	{
		sWord = S1.substr(0, pos);
		if (sWord != "")
			vS1.push_back(sWord);
		S1.erase(0, pos + Separators.length());
	}

	if (S1 != "")
		vS1.push_back(S1);

	return vS1;
}
sClient ConvertVectorToRecord(vector <string> vClient, string Separator = "#//#")
{
	sClient Client;

	Client.AccountNumber = vClient[0];
	Client.PinCode = vClient[1];
	Client.Name = vClient[2];
	Client.Phone = vClient[3];
	Client.AccountBalance = stof(vClient[4]);

	return Client;
}

float GetBalanceByAccontNumber(string AccontNumber, string FileName)
{
	vector <sClient> vClients;
	fstream MyFile;
	MyFile.open(FileName, ios::in); //read Mode

	if (MyFile.is_open())
	{
		string Line;
		sClient Client;

		while (getline(MyFile, Line))
		{
			if (Line.substr(0, AccontNumber.length()) == AccontNumber) // Find AccontNumber.
			{
				CurrentClient = ConvertVectorToRecord(FillVectorWithString(Line));
				MyFile.close();

				return CurrentClient.AccountBalance;
			}
			vClients.push_back(Client);
		}
		MyFile.close();
	}
}

void LoadDataFromFileToVector(string FileName, vector <string>& vFileCounted)
{
	fstream MyFile;

	MyFile.open(FileName, ios::in);
	if (MyFile.is_open())
	{
		string Line;
		while (getline(MyFile, Line))
		{
			vFileCounted.push_back(Line);
		}
	}

	MyFile.close();
}

sClient UpdateAccountBalance(vector <string> vClient)
{
	sClient Client;

	Client.AccountNumber = vClient[0];
	Client.PinCode = vClient[1];
	Client.Name = vClient[2];
	Client.Phone = vClient[3];
	Client.AccountBalance = CurrentClient.AccountBalance;

	return Client;
}

string ConvertRecordToLine(sClient Client, string Separator = "#//#")
{
	string ClientRecord = "";

	ClientRecord += Client.AccountNumber + Separator;
	ClientRecord += Client.PinCode + Separator;
	ClientRecord += Client.Name + Separator;
	ClientRecord += Client.Phone + Separator;
	ClientRecord += to_string(Client.AccountBalance);

	return ClientRecord;
}

void SaveVectorToFile(string FileName, vector <string>& vFileContent)
{
	fstream MyFile;

	MyFile.open(FileName, ios::out); // Writ Logic.

	if (MyFile.is_open())
	{
		for (string& Line : vFileContent)
			if (Line != "")
				MyFile << Line << endl;
		MyFile.close();
	}
}

// [1] Quick Withdraw.

void GoBackToATMMainMenueScreen()
{
	cout << "\n\nPress any key to go back to Manage Menu...";
	system("pause>0");
	system("cls");
	ShowATMMainMenueScreen();
}

bool UpdateAccountBalanceAfterTheTransaction()
{
	fstream File;
	string Line = "";

	File.open(ClientsFileName, ios::in); // Logic Write.
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, CurrentClient.AccountNumber.length()) == CurrentClient.AccountNumber) // Find Account number.
			{
				vector <string> vFileContent;

				string AccountClient = Line;

				LoadDataFromFileToVector(ClientsFileName, vFileContent);

				sClient Client;

				for (string& Line : vFileContent)
				{
					if (Line == AccountClient)
					{
						Client = UpdateAccountBalance(FillVectorWithString(Line));
						Line = ConvertRecordToLine(Client, "#//#");
					}
				}
				SaveVectorToFile(ClientsFileName, vFileContent);

				File.close();
				return true;
			}
		}
	}
	return false;
}

bool Diboset(float AmountDeboset)
{
	CurrentClient.AccountBalance += AmountDeboset;
	return UpdateAccountBalanceAfterTheTransaction();
}

bool Withdraw(float AmountWithdraw)
{
	return Diboset(AmountWithdraw * -1);
}

bool CheckBalance(string AccontNumber, float SizeWithdraw)
{
	return (GetBalanceByAccontNumber(AccontNumber, ClientsFileName) >= SizeWithdraw);
}

float QuickWithdrawOption(enQuickWithdrawOption eQuickWithdraw)
{
	switch (eQuickWithdraw)
	{
	case enQuickWithdrawOption::e20:
		return 20;
	case enQuickWithdrawOption::e50:
		return 50;
	case enQuickWithdrawOption::e100:
		return 100;
	case enQuickWithdrawOption::e200:
		return 200;
	case enQuickWithdrawOption::e400:
		return 400;
	case enQuickWithdrawOption::e600:
		return 600;
	case enQuickWithdrawOption::e800:
		return 800;
	case enQuickWithdrawOption::e1000:
		return 1000;
	case enQuickWithdrawOption::eExit:
		GoBackToATMMainMenueScreen();
		break;
	}
}

void AmountExceed()
{
	cout << "\n\nThe amount exceeds your balance, make another choice.\n";
}

void QuickWithdraw()
{
	float AmountQuickWithdraw = 0;

	while (!CheckBalance(CurrentClient.AccountNumber, AmountQuickWithdraw = QuickWithdrawOption((enQuickWithdrawOption)ReadOption("\n\nChoose what to withdraw ", 1, 9))))
	{
		AmountExceed();
		cout << "\nPris anykey to continue...";
		system("pause>0");
	}

	char Confirmation = 'n';

	cout << "\n\nAre you sure you want perfrom this transaction: [Y/N] ";
	cin >> Confirmation;

	if (Confirmation == 'y' || Confirmation == 'Y')
	{
		if (Withdraw(AmountQuickWithdraw))
			cout << "\nDone successfully. New balance is " << CurrentClient.AccountBalance;
		else
			cout << "\nError system!";

		GoBackToATMMainMenueScreen();
	}
	else
		ShowQuickWithdrawScreen();

}

void ShowQuickWithdrawScreen()
{
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tQuick Withdraw Screen";
	cout << "\n\n=======================================================================\n";
	cout << "\n\t\t[1] " << setw(3) << left << 20 << "\t\t[2] " << setw(3) << left << 50;
	cout << "\n\t\t[3] " << setw(3) << left << 100 << "\t\t[4] " << setw(3) << left << 200;
	cout << "\n\t\t[5] " << setw(3) << left << 400 << "\t\t[6] " << setw(3) << left << 600;
	cout << "\n\t\t[7] " << setw(3) << left << 800 << "\t\t[8] " << setw(4) << left << 1000;
	cout << "\n\n\t\t\t[9] Exit.";
	cout << "\n=======================================================================\n\n";

	cout << "Your Balance is: "; printf("%.*f", 4, GetBalanceByAccontNumber(CurrentClient.AccountNumber, ClientsFileName));

	QuickWithdraw();
}

// [2] Normal Withdraw.

int ReadNumber()
{
	int Number = 0;

	cin >> Number;

	while (cin.fail())
	{
		// user didn't input a number
		cin.clear();
		cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

		cout << "Invalid Number, enter valid one" << endl;
		cin >> Number;
	}

	return Number;
}

int GetAmountWithdraw()
{
	int AmountWithdraw = 1;

	while(AmountWithdraw % 5 != 0)
	{
		cout << "\n\nEnter amont multiple of 5's: ";
		AmountWithdraw = ReadNumber();
	}
	
	return AmountWithdraw;
}

void NormalWithdraw()
{
	float AmountWithdraw = 0;

	while (!CheckBalance(CurrentClient.AccountNumber, AmountWithdraw = GetAmountWithdraw()))
	{
		AmountExceed();
		cout << "\nPris anykey to continue...";
		system("pause>0");
	}

	char Confirmation = 'n';

	cout << "\n\nAre you sure you want perfrom this transaction: [Y/N] ";
	cin >> Confirmation;

	if (Confirmation == 'y' || Confirmation == 'Y')
	{
		if (Withdraw(AmountWithdraw))
			cout << "\nDone successfully. New balance is " << CurrentClient.AccountBalance;
		else
			cout << "\nError system!";

		GoBackToATMMainMenueScreen();
	}
	else
		ShowQuickWithdrawScreen();
}

void ShowNormalWithdrawScreen()
{
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tNormal Withdraw Screen";
	cout << "\n\n=======================================================================\n";
	
	cout << "Your Balance is: "; printf("%.*f", 4, GetBalanceByAccontNumber(CurrentClient.AccountNumber, ClientsFileName));

	NormalWithdraw();
}

// [3] Deposit.

int GetAmountDiboset()
{
	int AmountWithdraw = 1;

	while (AmountWithdraw % 5 != 0)
	{
		cout << "\n\nEnter amont diboset: ";
		AmountWithdraw = ReadNumber();
	}

	return AmountWithdraw;
}

void MainDiboset()
{
	float AmountWithdraw = GetAmountWithdraw();
	char Confirmation = 'n';

	cout << "\n\nAre you sure you want perfrom this transaction: [Y/N] ";
	cin >> Confirmation;

	if (Confirmation == 'y' || Confirmation == 'Y')
	{
		if (Diboset(AmountWithdraw))
			cout << "\nDone successfully. New balance is " << CurrentClient.AccountBalance;
		else
			cout << "\nError system!";

		GoBackToATMMainMenueScreen();
	}
	else
		ShowQuickWithdrawScreen();
}

void ShowDibosetScreen()
{
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tDiboset Screen";
	cout << "\n\n=======================================================================\n";

	cout << "Your Balance is: "; printf("%.*f", 4, GetBalanceByAccontNumber(CurrentClient.AccountNumber, ClientsFileName));

	MainDiboset();
}

// [4] Check Balance.

void ShowCheckBalanceScreen()
{
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tCheck Balance Screen";
	cout << "\n\n=======================================================================\n\n";
	cout << "Your Balance is: "; printf("%.*f",4, GetBalanceByAccontNumber(CurrentClient.AccountNumber, ClientsFileName));
}

// [5] Logout.

void Logout()
{
	Login();
}

/* 
* ATM Screen.
*/

enum enATMMenueOptions
{
	eQuickWithdraw = 1, eNormalWithdraw = 2,
	eDeposit = 3, eCheckBalance = 4,
	eLogout = 5
};

void PerformATMMenueOptions(enATMMenueOptions ManageMenueOptions)
{
	system("cls");

	switch (ManageMenueOptions)
	{
	case enATMMenueOptions::eQuickWithdraw:
		ShowQuickWithdrawScreen();
		break;
	case enATMMenueOptions::eNormalWithdraw:
		ShowNormalWithdrawScreen();
		break;
	case enATMMenueOptions::eDeposit:
		ShowDibosetScreen();
			break;
	case enATMMenueOptions::eCheckBalance:
		ShowCheckBalanceScreen();
		break;
	case enATMMenueOptions::eLogout:
		Logout();
		break;
	}

	GoBackToATMMainMenueScreen();
}

void ShowATMMainMenueScreen()
{
	system("cls");
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tATM Main Menue Screen";
	cout << "\n\n=======================================================================\n\n";
	cout << "\t\t[1] Quick Withdraw.\n";
	cout << "\t\t[2] Normal Withdraw.\n";
	cout << "\t\t[3] Deposit.\n";
	cout << "\t\t[4] Check Balance.\n";
	cout << "\t\t[5] Logout.\n";

	PerformATMMenueOptions((enATMMenueOptions)ReadOption("\nChoose what do you want to do: ", 1, 5));
}

/*
* Login
*/

bool ClientExistsByAccountNumberandPincode(string AccountNumber, string Pincode, string FileName)
{
	vector <sClient> vClients;
	fstream MyFile;
	MyFile.open(FileName, ios::in); //read Mode

	if (MyFile.is_open())
	{
		string Line;
		sClient Client;

		while (getline(MyFile, Line))
		{
			Client = ConvertVectorToRecord(FillVectorWithString(Line, "#//#"));

			if(Client.AccountNumber == AccountNumber && Client.PinCode == Pincode)
			{
				MyFile.close();
				return true;
			}
			vClients.push_back(Client);
		}

		MyFile.close();

	}
	return false;
}

bool ClientExistsByAccountNumber(string AccountNumber, string FileName)
{
	vector <sClient> vClients;
	fstream MyFile;
	MyFile.open(FileName, ios::in);//read Mode

	if (MyFile.is_open())
	{
		string Line;
		sClient Client;

		while (getline(MyFile, Line))
		{
			if (Line.substr(0, AccountNumber.length()) == AccountNumber) // Find Account number.
			{
				MyFile.close();
				return true;
			}
			vClients.push_back(Client);
		}

		MyFile.close();

	}
	return false;
}

string ReadString(string Message = "Enter String")
{
	string S1;

	cout << Message;
	getline(cin >> ws, S1);
	return S1;
}

void ShowloginScreen()
{
	system("cls");
	system("color 74");

	cout << "\n-----------------------------------------------------------------------\n";
	cout << "\t\t\tLogin Screen";
	cout << "\n-----------------------------------------------------------------------\n\n";
}

void ReadLoginInfo()
{
	bool Find = false;

	while (true)
	{
		ShowloginScreen();
		if(Find)
			cout << "\nInvlaid Accountnamber/Pincodre!\n";

		CurrentClient.AccountNumber = ReadString("Enter AccountNumber: ");
		CurrentClient.PinCode = ReadString("Enter Pincode: ");

		if (ClientExistsByAccountNumberandPincode(CurrentClient.AccountNumber, CurrentClient.PinCode, ClientsFileName))
			break;

		Find = true;
	}
}

void Login()
{
	ShowloginScreen();
	ReadLoginInfo();
	ShowATMMainMenueScreen();
}

int main()
{
	Login();
}