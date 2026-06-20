// 2_2_GameMath.cpp 

#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

enum enOperationType { Add = 1, Sub = 2, Mul = 3, Div = 4, MixOp = 5 };
enum enQuestionLevel { Easy = 1, Med = 2, Hard = 3, Mix = 4 };

struct stQuestion
{
    int Number1 = 0;
    int Number2 = 0;
    enOperationType OperationType = enOperationType::Add;
    enQuestionLevel QuestionLevel = enQuestionLevel::Easy;
    int CorrectAnswer = 0;
    int PlayerAnswer = 0;
    bool AnswerResult = false;
};

struct stQuiz
{
    stQuestion QuestionList[100];
    short NumbersOfQuestions = 5;
    enQuestionLevel QuestionsLevel = enQuestionLevel::Easy;
    enOperationType OpType = enOperationType::Add;
    short NumberOfWrongAnswers = 0;
    short NumberOfRightAnswers = 0;
    bool IsPass = false;
};

int RandomNumber(int From, int To)
{
    return rand() % (To - From + 1) + From;
}

short ReadHowManyQuestion()
{
    short NumberOfQuestion = 0;
    do
    {
        cout << "How Many Question do you want to answer ? ";
        cin >> NumberOfQuestion;
    } while (NumberOfQuestion < 1 || NumberOfQuestion > 100);

    return NumberOfQuestion;
}

string  GetQuestionLevelText(enQuestionLevel QuestionLevel)
{
    string arrQuestionLevelText[4] = { "Easy", "Med", "Hard", "Mix" };
    return arrQuestionLevelText[QuestionLevel - 1];
}

enQuestionLevel ReadQuestionLevel()
{
    short QuestionLevel = 0;
    do
    {
        cout << "Enter Question Level [1] Easy, [2] Med, [3] Hard, [4] Mix ? ";
        cin >> QuestionLevel;
    } while (QuestionLevel < 1 || QuestionLevel > 4);

    return (enQuestionLevel)QuestionLevel;
}

enOperationType ReadOpType()
{
    short OpType = 0;
    do
    {
        cout << "Enter Operation Type [1] Add, [2] Sub, [3] Mul, [4] Div, [5] Mix ? ";
        cin >> OpType;
    } while (OpType < 1 || OpType > 5);

    return (enOperationType) OpType;
}

void SetScreenColor(bool Right)
{
    if (Right)
        system("color 2F");
    else
    {
        system("color 4F");
        cout << "\a";
    }
}

char GetOpTypeSymbol(enOperationType OpType)
{
    char OpT[5]{ '+', '-', '*', '/', 'Mix'};
    return OpT[OpType - 1];
}

void PrintTheQuestion(stQuiz& Quiz, short QuistionNumber)
{
    cout << "\n";
    cout << "Question [" << QuistionNumber + 1 << "/" << Quiz.NumbersOfQuestions << "]\n\n";
    cout << Quiz.QuestionList[QuistionNumber].Number1 << endl;
    cout << Quiz.QuestionList[QuistionNumber].Number2 << " ";
    cout << GetOpTypeSymbol(Quiz.QuestionList[QuistionNumber].OperationType);
    cout << "\n_______________" << endl;
}

int ReadQuistionAnswer()
{
    int Answer = 0;
    cin >> Answer;
    return Answer;
}

void CorrectQuestionListAnswer(stQuiz& Quiz, short QuestionNumber)
{
    if (Quiz.QuestionList[QuestionNumber].PlayerAnswer != Quiz.QuestionList[QuestionNumber].CorrectAnswer)
    {
        Quiz.QuestionList[QuestionNumber].AnswerResult = false;
        Quiz.NumberOfWrongAnswers++;

        cout << "Wrong Answer :( \n";
        cout << "The right Answer is: ";
        cout << Quiz.QuestionList[QuestionNumber].CorrectAnswer;
        cout << "\n";
    }
    else
    {
        Quiz.QuestionList[QuestionNumber].AnswerResult = true;
        Quiz.NumberOfRightAnswers++;

        cout << "Right Answer :)\n";
    }
    cout << endl;

    SetScreenColor(Quiz.QuestionList[QuestionNumber].AnswerResult);
}

void AskAndCorrectQuistionListAnswers(stQuiz& Quiz)
{
    for (short QuistionNumber = 0; QuistionNumber < Quiz.NumbersOfQuestions; QuistionNumber++)
    {
        PrintTheQuestion(Quiz, QuistionNumber);
        Quiz.QuestionList[QuistionNumber].PlayerAnswer = ReadQuistionAnswer();
        CorrectQuestionListAnswer(Quiz, QuistionNumber);
    }
    Quiz.IsPass = (Quiz.NumberOfRightAnswers >= Quiz.NumberOfWrongAnswers);
}

int SimpleCalculator(int Number1, int Number2, enOperationType OperationType)
{
    switch (OperationType)
    {
    case enOperationType::Add:
        return Number1 + Number2;
    case enOperationType::Sub:
        return Number1 - Number2;
    case enOperationType::Mul:
        return Number1 * Number2;
    case enOperationType::Div:
        return Number1 / Number2;
    default:
        return Number1 + Number2;
    }
}

enOperationType GetRandomOperaterType()
{
    short Op = RandomNumber(1, 4);
    return (enOperationType)Op;
}

stQuestion GenerateQuestion(enQuestionLevel QuestionsLevel, enOperationType OpType)
{
    stQuestion Question;

    if (QuestionsLevel == enQuestionLevel::Mix)
        QuestionsLevel = (enQuestionLevel)RandomNumber(1, 3);

    if (OpType == enOperationType::MixOp)
        OpType = GetRandomOperaterType();

    Question.OperationType = OpType;

    switch (QuestionsLevel)
    {
    case enQuestionLevel::Easy:
    {
        Question.Number1 = RandomNumber(1, 10);
        Question.Number2 = RandomNumber(1, 10);

        Question.CorrectAnswer = SimpleCalculator(Question.Number1, Question.Number2, Question.OperationType);
        Question.QuestionLevel = QuestionsLevel;
        return Question;
    }
    case enQuestionLevel::Med:
    {
        Question.Number1 = RandomNumber(10, 50);
        Question.Number2 = RandomNumber(10, 50);

        Question.CorrectAnswer = SimpleCalculator(Question.Number1, Question.Number2, Question.OperationType);
        Question.QuestionLevel = QuestionsLevel;
        return Question;
    }
    case enQuestionLevel::Hard:
    {
        Question.Number1 = RandomNumber(50, 100);
        Question.Number2 = RandomNumber(50, 100);

        Question.CorrectAnswer = SimpleCalculator(Question.Number1, Question.Number2, Question.OperationType);
        Question.QuestionLevel = QuestionsLevel;
        return Question;
    }
    }

    return Question;
}

void GenerateQuizQuestions(stQuiz& Quiz)
{
    for (short Question = 0; Question < Quiz.NumbersOfQuestions; Question++)
    {
        Quiz.QuestionList[Question] = GenerateQuestion(Quiz.QuestionsLevel, Quiz.OpType);
    }
}

string GetFinalResultText(bool Pass)
{
    if (Pass)
        return "PASS :)";
    else
        return "Fail :(";
}

void PrintQuizResult(stQuiz Quiz)
{
    cout << "\n";
    cout << "_________________________________________\n\n";
    cout << "Final Result is " << GetFinalResultText(Quiz.IsPass) << endl;
    cout << "_________________________________________\n\n";


    cout << "Number of Question: " << Quiz.NumbersOfQuestions << endl;
    cout << "Question Level    : " << GetQuestionLevelText(Quiz.QuestionsLevel) << endl;
    cout << "OpType            : " << GetOpTypeSymbol(Quiz.OpType) << endl;
    cout << "Number of Right Answer: " << Quiz.NumberOfRightAnswers << endl;
    cout << "Number of Wrong Answer: " << Quiz.NumberOfWrongAnswers << endl;
    cout << "_________________________________________\n\n";


}

void PlayMathGame()
{
    stQuiz Quiz;

    Quiz.NumbersOfQuestions = ReadHowManyQuestion();
    Quiz.QuestionsLevel = ReadQuestionLevel();
    Quiz.OpType = ReadOpType();

    GenerateQuizQuestions(Quiz);

    AskAndCorrectQuistionListAnswers(Quiz);


    PrintQuizResult(Quiz);
}

void ResetScreen()
{
#if  _WIN32
    system("cls");
#else 
    system("clear");

#endif //  _WIN32

    system("color B0");
}

void StartGameMath()
{
    char PlayAgain = 'Y';
    do
    {
        ResetScreen();
        PlayMathGame();

        cout << endl << "Do you want to play again? Y/N: ";
        cin >> PlayAgain;

    } while(PlayAgain == 'Y' || PlayAgain == 'y');
}

int main()
{
    srand((unsigned)time(NULL));

    StartGameMath();
}