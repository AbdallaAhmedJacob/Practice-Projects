#include<string>
#include<vector>
#include<fstream>
#include<iostream>
#include<iomanip>

using namespace std;

struct sClient
{
	string AccountNumber = "";
	string PinCode = "";
	string Name = "";
	string Phone = "";
	double AccountBalance = 0;
};

struct sUser
{
	string Name;
	string Passowrd;
	short Permissions = 0;
};

enum enPermissions
{
	epAll = -1, epClientList = 1, epAddClient = 2, epDeletClient = 4,
	epUpdateClient = 8, epFindClient = 16, epTransactions = 32, epManageUsers = 64
};

const string ClientsFileName = "Clients.text";
const string UsersFileName = "Users.txt";

sUser CurrentUser;

void ShowMainMenue();
void ShowTransactionMenuScreen();
short ReadOption(short From, short To);
void ShowloginScreen();
void ShowloginScreen();
void ShowManageUserMenueScreen();
void Logout();
void GoBackToMainMenu();

/*
* [1]- Show Client List.
*/

void AccessDenied()
{
	system("cls");

	cout << "\n\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n";
	cout << "Access Denied,\nYou Don't Have Permission To Do This,\nPlease Conact Your Admin.";
	cout << "\n\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n";
	GoBackToMainMenu();
}

bool GetPermission(enPermissions ePermission)
{
	return ((ePermission & CurrentUser.Permissions) == ePermission);
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

sClient ConvertLineToRecord(vector <string> vClient, string Separator = "#//#")
{
	sClient Client;

	Client.AccountNumber = vClient[0];
	Client.PinCode = vClient[1];
	Client.Name = vClient[2];
	Client.Phone = vClient[3];
	Client.AccountBalance = stod(vClient[4]);

	return Client;
}

vector <sClient> LoadClientDataFromFile()
{
	fstream File;
	vector <sClient> vClients;
	string Line = "";

	File.open(ClientsFileName, ios::in);

	if (File.is_open())
		while (getline(File, Line))
		{
			sClient stClient = ConvertLineToRecord(FillVectorWithString(Line));
			vClients.push_back(stClient);
		}
	File.close();

	return vClients;
}

void PrintClientRecord(sClient stClient)
{
	cout << "|" << left << setw(20) << stClient.AccountNumber;
	cout << "|" << left << setw(10) << stClient.PinCode;
	cout << "|" << left << setw(30) << stClient.Name;
	cout << "|" << left << setw(15) << stClient.Phone;
	printf("| %.*f", 5, stClient.AccountBalance);
}

void ShowAllClientsList()
{
	vector <sClient> vClients = LoadClientDataFromFile();

	cout << "\t\t\t\t\t\tClient list (" << vClients.size() << ") Client(s).";
	cout << "\n_________________________________________________________________";
	cout << "_____________________________________________________________________\n\n";
	cout << "|" << left << setw(20) << "Account Number";
	cout << "|" << left << setw(10) << "Pin code";
	cout << "|" << left << setw(30) << "Client Name";
	cout << "|" << left << setw(15) << "Pone";
	cout << "|" << left << setw(20) << "Balance";
	cout << "\n\n_________________________________________________________________";
	cout << "_____________________________________________________________________\n\n";

	if (vClients.size() == 0)
		cout << "\t\t\t\tNo Clients Available In the System!";
	else
		for (sClient Client : vClients)
		{
			PrintClientRecord(Client);
			cout << endl;
		}
}

void ShowAllClientsScreen()
{
	if (!GetPermission(enPermissions::epClientList))
		AccessDenied();

	vector <sClient> vClients = LoadClientDataFromFile();

	ShowAllClientsList();
}

/*
* [2]- Add Client.
*/

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

double ReadNumber(string message)
{
	double Number = 0;
	while (true)
	{
		cout << message;
		cin >> Number;
		if (cin.fail())
		{
			cin.clear();
			cin.ignore(numeric_limits<streamsize>::max(), '\n');
			cout << "Invalid input. Please enter a valid number.\n";
		}
		else if (Number > 0)
			return Number;
	}
}

sClient ReadClientInfo(string AccountNumber)
{
	sClient Client;

	Client.AccountNumber = AccountNumber;

	cout << "Please enter the pin code: ";
	getline(cin >> ws, Client.PinCode);

	cout << "Please enter name: ";
	getline(cin, Client.Name);

	cout << "Please enter Phone: ";
	getline(cin, Client.Phone);

	Client.AccountBalance = double(ReadNumber("Please enter account balance: "));

	return Client;
}

string ReadAcountNumber()
{
	sClient Client;

	cout << "Please enter the account number: ";
	getline(cin >> ws, Client.AccountNumber);

	return Client.AccountNumber;
}

sClient ReadNewClient()
{
	sClient Client;

	while (ClientExistsByAccountNumber(Client.AccountNumber = ReadAcountNumber(), ClientsFileName))
	{
		cout << "\nClient with [" << Client.AccountNumber << "] already exists.\n";
	}

	return ReadClientInfo(Client.AccountNumber);
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

void AddDataLineToFile(string FileName, string  stDataLine)
{
	fstream MyFile;
	MyFile.open(FileName, ios::out | ios::app);

	if (MyFile.is_open())
	{

		MyFile << stDataLine << endl;

		MyFile.close();
	}
}

void AddNewClient()
{
	vector <string> vFileContent;

	LoadDataFromFileToVector(ClientsFileName, vFileContent);
	AddDataLineToFile(ClientsFileName, ConvertRecordToLine(ReadNewClient(), "#//#"));
}

void AddClients()
{
	char AddMore;
	do
	{
		cout << "Adding New Client:\n\n";

		AddNewClient();

		cout << "\nClient Added Successfully, do you want to add more clients? Y/N: ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowAddNewClientsScreen()
{
	if (!GetPermission(enPermissions::epAddClient))
		AccessDenied();

	cout << "\n-------------------------------------------------\n";
	cout << "\t\tAdd New Client Screen";
	cout << "\n-------------------------------------------------\n";

	AddClients();
}

/*
* [3]- Delete Client.
*/

bool FindClientByAccountNumber(string AccountNumber, sClient& Client)
{
	fstream File;
	string Line = "";

	File.open(ClientsFileName, ios::in);
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, AccountNumber.length()) == AccountNumber)
			{
				File.close();
				Client = ConvertLineToRecord(FillVectorWithString(Line));
				return true;
			}
		}
	}
	return false;
}

void PrintInfoClient(sClient& Client)
{
	cout << "\n-----------------------------------\n";
	cout << "\t\Account Number : " << Client.AccountNumber << "\n";
	cout << "\t\PinCode        : " << Client.PinCode << "\n";
	cout << "\t\Name           : " << Client.Name << "\n";
	cout << "\t\Phone          : " << Client.Phone << "\n";
	printf("\tAccountBalance :%.*f \n", 5, Client.AccountBalance);
	cout << "-----------------------------------\n";
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

bool DeleteClientByAccountNumber(string AccountNumber)
{
	fstream File;
	string Line = "";

	File.open(ClientsFileName, ios::in); // Logic Write.
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, AccountNumber.length()) == AccountNumber) // Find Account number.
			{
				vector <string> vFileContent;

				string AccountClient = Line;

				LoadDataFromFileToVector(ClientsFileName, vFileContent);

				for (string& Line : vFileContent)
				{
					if (Line == AccountClient)
						Line = "";
				}
				SaveVectorToFile(ClientsFileName, vFileContent);

				File.close();
			}
		}
		return true;
	}
	return false;
}

void DeleteClient()
{
	string AccountNumber = "";

	do
	{
		cout << "\nPlease enter Account number: ";
		cin >> AccountNumber;

		sClient Client;

		if (FindClientByAccountNumber(AccountNumber, Client))
		{
			cout << "\n-----------------------------------------\n";
			PrintInfoClient(Client);
			cout << "\n-----------------------------------------\n";
			char Assert;

			cout << "Are you  sure Delete this client? Y/N: ";
			cin >> Assert;

			if (toupper(Assert) == 'Y')
			{
				if (DeleteClientByAccountNumber(AccountNumber))
				{
					cout << "\nClient Delete Successfully.\n";
					break;
				}
				else
				{
					cout << "\nError try agene\n";
					continue; // Back to start loop.
				}
			}
			else
				break;
		}
		else
			cout << "\nClient with Account number (" << AccountNumber << ") not found\n" << endl;
	} while (true);
}

void DeleteClients()
{
	char AddMore;
	do
	{
		DeleteClient();

		cout << "\nDo you want to delete more clients? Y/N: ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowDeleteClientScreen()
{
	if (!GetPermission(enPermissions::epDeletClient))
		AccessDenied();
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tDelete Client Info Screen";
	cout << "\n-------------------------------------------------\n";

	DeleteClients();
}

/*
* [4]- Update Client.
*/

bool UpdateClientByAccountNumber(string AccountNumber)
{
	fstream File;
	string Line = "";

	File.open(ClientsFileName, ios::in); // Logic Write.
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, AccountNumber.length()) == AccountNumber) // Find Account number.
			{
				vector <string> vFileContent;

				string AccountClient = Line;

				LoadDataFromFileToVector(ClientsFileName, vFileContent);

				for (string& Line : vFileContent)
				{
					if (Line == AccountClient)
						Line = ConvertRecordToLine(ReadClientInfo(AccountNumber), "#//#");
				}
				SaveVectorToFile(ClientsFileName, vFileContent);

				File.close();
			}
		}
		return true;
	}
	return false;
}

void UpdateClient()
{
	string AccountNumber = "";

	do
	{
		cout << "\nPlease enter Account number: ";
		cin >> AccountNumber;

		sClient Client;

		if (FindClientByAccountNumber(AccountNumber, Client))
		{
			cout << "\n-----------------------------------------\n";
			PrintInfoClient(Client);
			cout << "\n-----------------------------------------\n";
			char Assert;

			cout << "Are you  sure Update this client? Y/N: ";
			cin >> Assert;

			if (toupper(Assert) == 'Y')
			{
				if (UpdateClientByAccountNumber(AccountNumber))
					break;
				else
				{
					cout << "\nError try agene\n";
					continue; // Back to start loop.
				}
			}
			else
				ShowMainMenue();
		}
		else
			cout << "\nClient with Account number (" << AccountNumber << ") not found\n" << endl;
	} while (true);
}

void UpdateClients()
{
	char AddMore;
	do
	{
		UpdateClient();

		cout << "\nClient Update Successfully, do you want to update more clients? Y/N: ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowUpdateClientsScreen()
{
	if (!GetPermission(enPermissions::epUpdateClient))
		AccessDenied();

	cout << "\n-------------------------------------------------\n";
	cout << "\t\tUpdate Client Info Screen";
	cout << "\n-------------------------------------------------\n";

	UpdateClients();
}

/*
* [5]- Find Client.
*/

void FindClient()
{
	string AccountNumber = "";

	cout << "\nPlease enter Account number: ";
	cin >> AccountNumber;

	sClient Client;

	if (FindClientByAccountNumber(AccountNumber, Client))

		PrintInfoClient(Client);

	else
		cout << "\nClient with Account number (" << AccountNumber << ") not found\n" << endl;
}

void ShowFindClientScreen()
{
	if (!GetPermission(enPermissions::epFindClient))
		AccessDenied();

	cout << "\n-------------------------------------------------\n";
	cout << "\t\tFind Client Info Screen";
	cout << "\n-------------------------------------------------\n";

	FindClient();
}

/*
* [6]- Transaction.
*/

void GoToTransactionMenu()
{
	cout << "\n\nPress any key to go back to Transaction Menu...";
	system("pause>0");
	ShowTransactionMenuScreen();
}

// [1]- Deposit.

sClient AddDepositClientByAccountNumber(vector <string> vClient, double DepositAmount, double& AccountBalanceAfterDeposit)
{
	sClient Client;

	Client.AccountNumber = vClient[0];
	Client.PinCode = vClient[1];
	Client.Name = vClient[2];
	Client.Phone = vClient[3];
	Client.AccountBalance = stod(vClient[4]) + DepositAmount;

	AccountBalanceAfterDeposit = Client.AccountBalance;

	return Client;
}

bool ApdateDataAfterTheTransaction(string AccountNumber, double DepositAmount, double& ApdateDataAfterTheTransaction)
{
	fstream File;
	string Line = "";

	File.open(ClientsFileName, ios::in); // Logic Write.
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, AccountNumber.length()) == AccountNumber) // Find Account number.
			{
				vector <string> vFileContent;

				string AccountClient = Line;

				LoadDataFromFileToVector(ClientsFileName, vFileContent);

				sClient Client;

				for (string& Line : vFileContent)
				{
					if (Line == AccountClient)
					{
						Client = AddDepositClientByAccountNumber(FillVectorWithString(Line), DepositAmount, ApdateDataAfterTheTransaction);
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

void Deposit()
{
	sClient Client;

	while (!FindClientByAccountNumber(Client.AccountNumber = ReadAcountNumber(), Client))
	{
		cout << "\nClient with [" << Client.AccountNumber << "] dos not exist\n";
	}

	PrintInfoClient(Client);
	double DepositAmount = ReadNumber("\nPlease enter deposit amount : ");

	char Assert;
	cout << "\nAre you sure you want peerfrom this transaction? Y/N : ";
	cin >> Assert;

	double AccountBalanceAfterTransaction = 0;

	if (toupper(Assert) == 'Y')
	{
		if (ApdateDataAfterTheTransaction(Client.AccountNumber, DepositAmount, AccountBalanceAfterTransaction))
		{
			cout << "\nTransaction Successfully";
			cout << "\nAccount Balance = " << AccountBalanceAfterTransaction;
			GoToTransactionMenu();
		}
		else
			cout << "\nError try agene\n";
	}
	else
		ShowTransactionMenuScreen();

}

void ShowDeposetScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\Deposit Screen";
	cout << "\n-------------------------------------------------\n";
	Deposit();
}

/*
* [2]- Withdraw.
*/

void Withdraw()
{
	sClient Client;

	while (!FindClientByAccountNumber(Client.AccountNumber = ReadAcountNumber(), Client))
	{
		cout << "\nClient with [" << Client.AccountNumber << "] dos not exist\n";
	}

	PrintInfoClient(Client);

	double WithdrawAmount;
	do
	{
		WithdrawAmount = ReadNumber("\nPlease enter withdraw amount : ");

		if (Client.AccountBalance < WithdrawAmount)
			cout << "\nAmount Exceeds the balance, you can withjdrw up to: " << Client.AccountBalance;

	} while (Client.AccountBalance < WithdrawAmount);

	char Assert;
	cout << "\nAre you sure you want peerfrom this transaction? Y/N : ";
	cin >> Assert;

	double AccountBalanceAfterTransaction = 0;

	if (toupper(Assert) == 'Y')
	{
		if (ApdateDataAfterTheTransaction(Client.AccountNumber, WithdrawAmount *= -1, AccountBalanceAfterTransaction))
		{
			cout << "\nTransaction Successfully";
			cout << "\nAccount Balance = " << AccountBalanceAfterTransaction;
			GoToTransactionMenu();
		}
		else
			cout << "\nError try agene\n";
	}
	else
		ShowTransactionMenuScreen();
}

void ShowWithdrawScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\Withdraw Screen";
	cout << "\n-------------------------------------------------\n";
	Withdraw();
}

/*
* [3]- Total Balances
*/

void PrintClientList(sClient stClient, long double& TotalBalances)
{
	cout << "|" << left << setw(20) << stClient.AccountNumber;
	cout << "|" << left << setw(30) << stClient.Name;
	printf("| %.*f", 5, stClient.AccountBalance);

	TotalBalances += stClient.AccountBalance;
}

void ShowBalancesList()
{
	vector <sClient> vClients = LoadClientDataFromFile();

	cout << "\t\t\t\t\t\tBalances List (" << vClients.size() << ") Client(s).";
	cout << "\n_________________________________________________________________";
	cout << "_____________________________________________________________________\n\n";
	cout << "|" << left << setw(20) << "Account Number";
	cout << "|" << left << setw(30) << "Client Name";
	cout << "|" << left << setw(20) << "Balance";
	cout << "\n\n_________________________________________________________________";
	cout << "_____________________________________________________________________\n\n";

	long double TotalBalances = 0;

	if (vClients.size() == 0)
		cout << "\t\t\t\tNo Clients Available In the System!";
	else
		for (sClient Client : vClients)
		{
			PrintClientList(Client, TotalBalances);
			cout << endl;
		}
	cout << "\n\t\t\t\t" << std::fixed << TotalBalances;
}

enum enTransactionOptions { eDeposit = 1, eWithdraw = 2, eTotalBalance = 3, eMainMenu = 4 };

void PerformTransactionMenuOption(enTransactionOptions TransactionOptions)
{
	system("cls");
	system("color B5");

	switch (TransactionOptions)
	{
	case enTransactionOptions::eDeposit:
		ShowDeposetScreen();
		break;
	case enTransactionOptions::eWithdraw:
		ShowWithdrawScreen();
		break;
	case enTransactionOptions::eTotalBalance:
		ShowBalancesList();
		break;
	case enTransactionOptions::eMainMenu:
		break;
	}
}

void ShowTransactionMenuScreen()
{
	if (!GetPermission(enPermissions::epTransactions))
		AccessDenied();

	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tTransaction Menu Screen";
	cout << "\n=======================================================================\n\n";
	cout << "\t\t[1] Deposit.\n";
	cout << "\t\t[2] Withdraw.\n";
	cout << "\t\t[3] Total Balances.\n";
	cout << "\t\t[4] Main Menu.\n";
	cout << "\n=======================================================================\n\n";
	PerformTransactionMenuOption((enTransactionOptions)ReadOption(1, 4));
}

/*
* [7]- End.
*/

void ShowEndScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tProgram End   :)";
	cout << "\n-------------------------------------------------\n";
	system("pause>0");
}

/*
* Mien Menu.
*/

short ReadOption(short From, short To)
{
	short Choose = 0;

	do
	{
		cout << "\nChoose what do you want to do? [ " << From << " to " << To << " ]: ";
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

enum enMainMenueOptions
{
	eListClients = 1, eAddNewClient = 2,
	eDeleteClient = 3, eUpdateClient = 4,
	eFindClient = 5, eTransaction = 6,
	eManageUser = 7, eLogout = 8
};

void GoBackToMainMenu()
{
	cout << "\n\nPress any key to go back to Main Menu...";
	system("pause>0");
	ShowMainMenue();
}

void PerformMainMenueOptions(enMainMenueOptions MainMenuOption)
{
	system("cls");
	system("color F5");

	switch (MainMenuOption)
	{
	case enMainMenueOptions::eListClients:
		ShowAllClientsScreen();
		break;
	case enMainMenueOptions::eAddNewClient:
		ShowAddNewClientsScreen();
		break;
	case enMainMenueOptions::eDeleteClient:
		ShowDeleteClientScreen();
		break;
	case enMainMenueOptions::eUpdateClient:
		ShowUpdateClientsScreen();
		break;
	case enMainMenueOptions::eFindClient:
		ShowFindClientScreen();
		break;
	case enMainMenueOptions::eTransaction:
		ShowTransactionMenuScreen();
		break;
	case enMainMenueOptions::eManageUser:
		ShowManageUserMenueScreen();
		break;
	case enMainMenueOptions::eLogout:
		Logout();
		break;
	}
	GoBackToMainMenu();
}

void ShowMainMenue()
{
	system("cls");
	system("color E5");
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tMain Menue Screen";
	cout << "\n=======================================================================\n\n";
	cout << "\t\t[1] Show client list.\n";
	cout << "\t\t[2] Add New Client.\n";
	cout << "\t\t[3] Delete Client.\n";
	cout << "\t\t[4] Update Client Info\n";
	cout << "\t\t[5] Find Client\n";
	cout << "\t\t[6] Transactions\n";
	cout << "\t\t[7] Manage Users\n";
	cout << "\t\t[8] Logout\n";
	cout << "\n=======================================================================\n\n";
	PerformMainMenueOptions((enMainMenueOptions)ReadOption(1, 8));
}

/*
* [7]- Manage Users
*/

void GoBackToManageMenu()
{
	cout << "\n\nPress any key to go back to Manage Menu...";
	system("pause>0");
	system("cls");
	ShowManageUserMenueScreen();
}

// [1]- List Users

sUser ConvertVectorToUserRecord(vector <string> vUser)
{
	sUser User;

	User.Name = vUser[0];
	User.Passowrd = vUser[1];
	User.Permissions = stoi(vUser[2]);

	return User;
}

vector <sUser> LoadUsersDataFromFile()
{
	fstream File;
	vector <sUser> vUser;
	string Line = "";

	File.open(UsersFileName, ios::in);

	if (File.is_open())
		while (getline(File, Line))
		{
			sUser sUser = ConvertVectorToUserRecord(FillVectorWithString(Line));
			vUser.push_back(sUser);
		}
	File.close();

	return vUser;
}

void PrintUserRecord(sUser User)
{
	cout << "|" << left << setw(20) << User.Name;
	cout << "|" << left << setw(10) << User.Passowrd;
	printf("| %d", User.Permissions);
}

void ShowAllUsersScreen()
{
	vector <sUser> vUsers = LoadUsersDataFromFile();

	cout << "\n_______________________________________________________________________________________________\n\n";
	cout << "\t\t\t\t\tUsers list (" << vUsers.size() << ") User(s).";
	cout << "\n_______________________________________________________________________________________________\n\n";
	cout << "|" << left << setw(20) << "Username";
	cout << "|" << left << setw(10) << "Passowrd";
	cout << "|" << left << setw(30) << "Permissions";
	cout << "\n\n_______________________________________________________________________________________________\n\n";

	if (vUsers.size() == 0)
		cout << "\t\t\t\tNo User Available In the System!";
	else
		for (sUser User : vUsers)
		{
			PrintUserRecord(User);
			cout << endl;
		}
}  

// [2]- Add Users

bool UserExistsByName(string Name, string FileName)
{
	vector <sUser> vUser;
	fstream File;
	File.open(FileName, ios::in);  //read Mode

	if (File.is_open())
	{
		string Line;
		sUser User;

		while (getline(File, Line))
		{
			if (Line.substr(0, Name.length()) == Name) // Find Username.
			{
				File.close();
				return true;
			}
			vUser.push_back(User);
		}

		File.close();

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

bool ReadOption(string Message = "Enter Y/N: ")
{
	char Choose;

	cout << Message;
	cin >> Choose;

	return (Choose == 'Y' || Choose == 'y') ? true : false;
}

short ReadPermissions()
{
	short Permissions = 0;

	if (ReadOption("\nDo you want to give full access Y/N: "))
		Permissions = enPermissions::epAll;
	else
	{
		cout << "\nDo you want to give access to:\n";

		if (ReadOption("\nShow Clint List: [Y/N] ")) Permissions += enPermissions::epClientList;
		if (ReadOption("\nAdd Client: [Y/N] ")) Permissions += enPermissions::epAddClient;
		if (ReadOption("\nDelet Client: [Y/N] ")) Permissions += enPermissions::epDeletClient;
		if (ReadOption("\nUpdate Client: [Y/N] ")) Permissions += enPermissions::epUpdateClient;
		if (ReadOption("\nFind Client: [Y/N] ")) Permissions += enPermissions::epFindClient;
		if (ReadOption("\nTransactions: [Y/N] ")) Permissions += enPermissions::epTransactions;
		if (ReadOption("\nManage Users: [Y/N] ")) Permissions += enPermissions::epManageUsers;
	}

	return Permissions;
}

sUser ReadUserInfo(string Name)
{
	sUser User;

	User.Name = Name;
	User.Passowrd = ReadString("Please enter Password: ");
	User.Permissions = ReadPermissions();

	return User;
}

sUser ReadNewUser()
{
	sUser User;

	while (UserExistsByName(User.Name = ReadString("Please enter Username: "), UsersFileName))
	{
		cout << "\nUser with [" << User.Name << "] already exists.\n";
	}

	return ReadUserInfo(User.Name);
}

string ConvertRecordToLine(sUser User, string Separator = "#//#")
{
	string UserRecord = "";

	UserRecord += User.Name + Separator;
	UserRecord += User.Passowrd + Separator;
	UserRecord += to_string(User.Permissions);

	return UserRecord;
}

void AddNewUser()
{
	vector <string> vFileContent;

	LoadDataFromFileToVector(UsersFileName, vFileContent);
	AddDataLineToFile(UsersFileName, ConvertRecordToLine(ReadNewUser(), "#//#"));
}

void AddUsers()
{
	char AddMore;
	do
	{
		cout << "Adding New User:\n\n";

		AddNewUser();

		cout << "\nUser Added Successfully, do you want to add more users: [Y/N] ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowAddNewUsersScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tAdd New user Screen";
	cout << "\n-------------------------------------------------\n";

	AddUsers();
}

// [3]- Delet User.

bool FindUserByUsername(string Username, sUser& User)
{
	fstream File;
	string Line = "";

	File.open(UsersFileName, ios::in);

	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, Username.length()) == Username)
			{
				File.close();
				User = ConvertVectorToUserRecord(FillVectorWithString(Line));
				return true;
			}
		}
	}
	return false;
}

void PrintUserInfo(sUser& User)
{
	cout << "\n----------------------------------------------------------------\n";
	cout << "\t\tUsername       : " << User.Name << "\n";
	cout << "\t\tPassowrd       : " << User.Passowrd << "\n";
	cout << "\t\tPermission     : " << User.Permissions << "\n";
	cout << "\n----------------------------------------------------------------\n";
}

bool DeleteUserByUsername(string Username)
{
	fstream File;
	string Line = "";

	File.open(UsersFileName, ios::in); // Logic Write.
	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, Username.length()) == Username) // Find Username.
			{
				vector <string> vFileContent;

				string AccountUser = Line;

				LoadDataFromFileToVector(UsersFileName, vFileContent);

				for (string& Line : vFileContent)
				{
					if (Line == AccountUser)
						Line = "";
				}
				SaveVectorToFile(UsersFileName, vFileContent);

				File.close();
			}
		}
		return true;
	}
	return false;
}

void DeleteUser()
{
	string Username = "";

	do
	{
		cout << "\nPlease enter Username: ";
		cin >> Username;

		if (Username == "Admin")
		{
			cout << "\nYou cann't delete this user\n";
			GoBackToManageMenu();
		}

		sUser User;

		if (FindUserByUsername(Username, User))
		{
			cout << "\n-----------------------------------------\n";
			PrintUserInfo(User);
			cout << "\n-----------------------------------------\n";
			char Assert;

			cout << "Are you  sure Delete this user: [Y/N] ";
			cin >> Assert;

			if (toupper(Assert) == 'Y')
			{
				if (DeleteUserByUsername(Username))
				{
					cout << "\nUser Delete Successfully.\n";
					break;
				}
				else
				{
					cout << "\nError try agene\n";
					continue; // Back to start loop.
				}
			}
			else
				break;
		}
		else
			cout << "\n(" << Username << ") not found\n" << endl;
	} while (true);
}

void DeleteUsers()
{
	char AddMore;
	do
	{
		DeleteUser();

		cout << "\nDo you want to delete more users: [Y/N] ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowDeleteUsersScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tDelete Users Screen";
	cout << "\n-------------------------------------------------\n";

	DeleteUsers();
}

// [4]- Update User.

bool UpdateUserByUsername(string Username)
{
	fstream File;
	string Line = "";

	File.open(UsersFileName, ios::in); // Logic Write.

	if (File.is_open())
	{
		while (getline(File, Line))
		{
			if (Line.substr(0, Username.length()) == Username) // Find Account number.
			{
				vector <string> vFileContent;

				string AccountUser = Line;

				LoadDataFromFileToVector(UsersFileName, vFileContent);

				for (string& Line : vFileContent)
				{
					if (Line == AccountUser)
						Line = ConvertRecordToLine(ReadUserInfo(Username), "#//#");
				}
				SaveVectorToFile(UsersFileName, vFileContent);

				File.close();
			}
		}
		return true;
	}
	return false;
}

void UpdateUser()
{
	string Username = "";

	do
	{
		cout << "\nPlease enter Username: ";
		cin >> Username;

		sUser User;

		if (FindUserByUsername(Username, User))
		{
			cout << "\n-------------------------------------------------------------\n";
			PrintUserInfo(User);
			cout << "\n-------------------------------------------------------------\n";
			char Assert;

			cout << "Are you  sure Update this user: [Y/N] ";
			cin >> Assert;

			if (toupper(Assert) == 'Y')
			{
				if (UpdateUserByUsername(Username))
					break;
				else
				{
					cout << "\nError try agene\n";
					continue; // Back to start loop.
				}
			}
			else
				ShowMainMenue();
		}
		else
			cout << "\n(" << Username << ") not found\n" << endl;
	} while (true);
}

void UpdateUsers()
{
	char AddMore;
	do
	{
		UpdateUser();

		cout << "\nUser Update Successfully.\n do you want to update more clients: [Y/N] ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowUpdateUsersScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tUpdate User Info Screen";
	cout << "\n-------------------------------------------------\n";

	UpdateUsers();
}

// [5]- Find User.

void FindUser()
{
	string Username = "";

	cout << "\nPlease enter Username: ";
	cin >> Username;

	sUser User;

	if (FindUserByUsername(Username, User))
		PrintUserInfo(User);
	else
		cout << "\n(" << Username << ") not found\n" << endl;
}

void ShowFindUserScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tFind User Info Screen";
	cout << "\n-------------------------------------------------\n";

	FindUser();
}

enum enManageMenueOptions
{
	eLisUsers = 1, eAddNewUser = 2,
	eDelete = 3, eUpdateUser = 4,
	eFindUser = 5, eMainMenue = 6,
};

void PerformManageMenueOptions(enManageMenueOptions ManageMenueOptions)
{
	system("cls");

	switch (ManageMenueOptions)
	{
	case enManageMenueOptions::eLisUsers:
		ShowAllUsersScreen();
		break;
	case enManageMenueOptions::eAddNewUser:
		ShowAddNewUsersScreen();
		break;
	case enManageMenueOptions::eDelete:
		ShowDeleteUsersScreen();
		break;
	case enManageMenueOptions::eUpdateUser:
		ShowUpdateUsersScreen();
		break;
	case enManageMenueOptions::eFindUser:
		ShowFindUserScreen();
		break;
	case enManageMenueOptions::eMainMenue:
		ShowMainMenue();
		break;
	
	}
	GoBackToManageMenu();
}

void ShowManageUserMenueScreen()
{
	if (!GetPermission(enPermissions::epManageUsers))
		AccessDenied();

	system("color 8f");
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\Manage Users Menue Screen";
	cout << "\n\n=======================================================================\n\n";
	cout << "\t\t[1] List Usres.\n";
	cout << "\t\t[2] Add New User.\n";
	cout << "\t\t[3] Delet User.\n";
	cout << "\t\t[4] Update User.\n";
	cout << "\t\t[5] Find User.\n";
	cout << "\t\t[6] Main Menue\n";
	PerformManageMenueOptions((enManageMenueOptions)ReadOption(1, 6));
}

/* 
* [8]- Logout
*/

void Logout()
{
	ShowloginScreen();
}

/*
* Login
*/

bool IsValedUsernameAndPassowrd(string FileName)
{
	vector <sUser> vUsers;
	fstream MyFile;
	MyFile.open(FileName, ios::in);//read Mode

	if (MyFile.is_open())
	{
		string Line;
		sUser User;

		while (getline(MyFile, Line))
		{
			User = ConvertVectorToUserRecord(FillVectorWithString(Line));

			if (User.Name == CurrentUser.Name)
				if (User.Passowrd == CurrentUser.Passowrd)
				{
					CurrentUser.Permissions = User.Permissions;

					MyFile.close();
					return true;
				}
			vUsers.push_back(User);
		}

		MyFile.close();
	}
	return false;
}

void ReadLoginInfo()
{
	while (true)
	{
		CurrentUser.Name = ReadString("Enter Username: ");
		CurrentUser.Passowrd = ReadString("Enter Passowrd: ");

		if (IsValedUsernameAndPassowrd(UsersFileName))
			break;
		else
			cout << "\nInvlaid Username/Passowrd!\n";
	}
}

void ShowloginScreen()
{
	system("cls");
	system("color 65");

	cout << "\n-----------------------------------------------------------------------\n";
	cout << "\t\t\tLogin Screen";
	cout << "\n-----------------------------------------------------------------------\n\n";

	ReadLoginInfo();
	ShowMainMenue();
}

int main()
{
	ShowloginScreen();
}