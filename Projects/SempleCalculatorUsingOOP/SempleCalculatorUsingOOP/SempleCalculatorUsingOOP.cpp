#include <iostream>

using namespace std;

class clsCalculator
{
private:
    enum _enOp { eClear = 0, eAdd = 1, eSubsract = 2, eMultipli = 3, eDivide = 4 };

    float _Result = 0;
    float _LastNum = 0;
    _enOp _LastOp = _enOp::eClear;

    string _GetTextOp(_enOp eOp)
    {
        string sOp[]{ "Clearing", "Adding","Substracting","Multiplying","Dividing" };

        return sOp[eOp];
    }

public:

    void PrintResult()
    {
        cout << "Result after " << _GetTextOp(_LastOp) << " " << _LastNum << " is: " << _Result << "\n";
    }

    void Add(int Num) 
    {
        _LastOp = _enOp::eAdd;
        _LastNum = Num;
        _Result += Num;
    }

    void Sustract(int Num) 
    {
        _LastOp = _enOp::eSubsract;
        _LastNum = Num;
        _Result -= Num;
    }

    void Multiply(int Num) 
    {
        _LastOp = _enOp::eMultipli;
        _LastNum = Num;
        _Result *= Num;
    }

    void Divide(int Num) 
    {
        _LastOp = _enOp::eDivide;
        _LastNum = Num;
        if (Num == 0)
            _Result /= 1;
        else
            _Result /= Num;
    }

    void Clear()
    {
        _LastOp = _enOp::eClear;
        _LastNum = 0;
        _Result = 0;
    }
};

int main()
{
    clsCalculator Calculator1;

    Calculator1.Add(10);
    Calculator1.PrintResult();
    Calculator1.Add(100);
    Calculator1.PrintResult();
    Calculator1.Sustract(20);
    Calculator1.PrintResult();
    Calculator1.Divide(0);
    Calculator1.PrintResult();
    Calculator1.Divide(2);
    Calculator1.PrintResult();
    Calculator1.Multiply(3);
    Calculator1.PrintResult();
    Calculator1.Clear();
    Calculator1.PrintResult();
}