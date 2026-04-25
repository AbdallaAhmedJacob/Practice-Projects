#pragma once
#include "clsDate.h";

class clsPeriod
{
private:

	clsDate _StartDate;
	clsDate _EndDate;

public:

	clsPeriod(clsDate StartDate, clsDate EndDate) {
		if (clsDate::DateCombarer(StartDate, EndDate) == clsDate::eDateCompare::After)
			clsDate::ReversDate(StartDate, EndDate); 

		_StartDate = StartDate;
		_EndDate = EndDate;
	}

	void SetPeriod(clsDate StartDate, clsDate EndDate) {
		clsPeriod(StartDate, EndDate);
	}

	clsPeriod GetPriod() {
		return clsPeriod(_StartDate, _EndDate);
	}

	static bool IsPeriodsOverLap(clsPeriod Period1, clsPeriod Period2) {

		return (!(clsDate::DateCombarer(Period1._StartDate, Period2._EndDate) == clsDate::eDateCompare::After ||
			clsDate::DateCombarer(Period1._EndDate, Period2._StartDate) == clsDate::eDateCompare::Befour));
	}

	bool IsPeriodsOverLap(clsPeriod Period2) {
		return IsPeriodsOverLap(*this, Period2);
	}

	static short PeriodLingthInDays(clsPeriod Period){
		return clsDate::GetDefference(Period._StartDate, Period._EndDate);
	}

	short PeriodLingthInDays() {
		return PeriodLingthInDays(*this);
	}

	static bool IsDateInPeriod(clsPeriod Period, clsDate Date){
		short PeriodLingth = 0;
		while (!clsDate::IsDate1EqualDate2(Period._StartDate, Period._EndDate)){
			if (clsDate::IsDate1EqualDate2(Period._StartDate, Date))
				return true;

			Period._StartDate = clsDate::AddOneDay(Period._StartDate);
		}
		return false;
	}

	bool IsDateInPeriod(clsDate Date) {
		return IsDateInPeriod(*this, Date);
	}

	static short GetOverlapDaysInTwoPeriods(clsPeriod Period1, clsPeriod Period2)
	{
		if (!IsPeriodsOverLap(Period1, Period2))
			return 0;

		short CountOverLapDays = 0;

		if (PeriodLingthInDays(Period1) < PeriodLingthInDays(Period2)){
			while (!clsDate::IsDate1EqualDate2(Period1._StartDate, Period1._EndDate)){
				if (IsDateInPeriod(Period2, Period1._StartDate))
					CountOverLapDays++;

				Period1._StartDate = clsDate::AddOneDay(Period1._StartDate);
			}
		}
		else{
			while (!clsDate::IsDate1EqualDate2(Period2._StartDate, Period2._EndDate)){
				if (IsDateInPeriod(Period1, Period2._StartDate))
					CountOverLapDays++;

				Period2._StartDate = clsDate::AddOneDay(Period2._StartDate);
			}
		}

		return CountOverLapDays;
	}

	short GetOverlapDaysInTwoPeriods(clsPeriod Period2) {
		return GetOverlapDaysInTwoPeriods(*this, Period2);
	}
	
};