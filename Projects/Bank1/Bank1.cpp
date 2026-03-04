#include<string>
#include<vector>
#include<fstream>
#include<iostream>
#include<iomanip>

using namespace std;

struct sClient
{
	string AccountNumber;
	string PinCode;
	string Name;
	string Phone;
	double AccountBalance = 0;
};

const string ClientsFileName = "Clients.text";

void ShowMainMenu();
short ReadOption(short From, short To);

/*
* [1]- Show Client List.
*/

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

vector <sClient> LoadClientsDataFromFile()
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
	vector <sClient> vClients = LoadClientsDataFromFile();

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
	vector <sClient> vClients = LoadClientsDataFromFile();

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
		else
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

void PrintRecord(sClient& Client)
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
			PrintRecord(Client);
			cout << "\n-----------------------------------------\n";
			char Assert = 'y';

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
				break; // Back to start loop.
		}
		else
			cout << "\nClient with Account number (" << AccountNumber << ") not found\n" << endl;
	} while (true);
}

void DeleteClients()
{
	char AddMore = 'y';
	do
	{
		DeleteClient();

		cout << "\nDo you want to delete more clients? Y/N: ";
		cin >> AddMore;

	} while (toupper(AddMore) == 'Y');
}

void ShowDeleteClientScreen()
{
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
			PrintRecord(Client);
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
				ShowMainMenu();
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
		
			PrintRecord(Client);
		
		else
			cout << "\nClient with Account number (" << AccountNumber << ") not found\n" << endl;
}

void ShowFindClientScreen()
{
		system("cls");

		cout << "\n-------------------------------------------------\n";
		cout << "\t\tFind Client Info Screen";
		cout << "\n-------------------------------------------------\n";

		FindClient();
}

/*
* [6]- End.
*/

void ShowEndScreen()
{
	cout << "\n-------------------------------------------------\n";
	cout << "\t\tProgram End   :)";
	cout << "\n-------------------------------------------------\n";
	system("pause>0"); // Wait to click.
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

enum enMainMenuOptions
{
	eListClients = 1, eAddNewClient = 2,
	eDeleteClient = 3, eUpdateClient = 4,
	eFindClient = 5, eExit = 6
};

void GoBackToMainMenu()
{
	cout << "\n\nPress any key to go back to Main Menu...";
	system("pause>0");
	ShowMainMenu();
}

void PerformMainMenuOption(enMainMenuOptions MainMenuOption)
{
	system("cls");
	system("color F5");

	switch (MainMenuOption)
	{
	case enMainMenuOptions::eListClients:
		ShowAllClientsScreen();
		break;
	case enMainMenuOptions::eAddNewClient:
		ShowAddNewClientsScreen();
		break;
	case enMainMenuOptions::eDeleteClient:
		ShowDeleteClientScreen();
		break;
	case enMainMenuOptions::eUpdateClient:
		ShowUpdateClientsScreen();
		break;
	case enMainMenuOptions::eFindClient:
		ShowFindClientScreen();
		break;
	case enMainMenuOptions::eExit:
		ShowEndScreen();
		break;
	}
	
	if (MainMenuOption != enMainMenuOptions::eExit)
		GoBackToMainMenu();
}

void ShowMainMenu()
{
	system("cls"); // Clear Screen.
	system("color E5"); // Light Yellow.
	cout << "\n=======================================================================\n\n";
	cout << "\t\t\tMain Manu Screen";
	cout << "\n=======================================================================\n\n";
	cout << "\t\t[1] Show client list.\n";
	cout << "\t\t[2] Add New Client.\n";
	cout << "\t\t[3] Delete Client.\n";
	cout << "\t\t[4] Update Client Info\n";
	cout << "\t\t[5] Find Client\n";
	cout << "\t\t[6] Exit\n";
	cout << "\n=======================================================================\n\n";
	PerformMainMenuOption((enMainMenuOptions)ReadOption(1, 6));
}

int main()
{
	ShowMainMenu();
	return 0;
}