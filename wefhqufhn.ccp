/***********************************************************
*   Автор: Кадесников Михаил                               *
*   Дата: 27.12.2022                                       *
*   Название: Каледнарь                                    *
************************************************************/

#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

struct calendar{
  string monthName;
  int amountDays;
  int amountDays2;
};

int const numberOfMonths = 12;
calendar months[numberOfMonths];

int main() {
  months[0] = { "January", 31, 30 };
  months[1] = { "February", 28, 27 };
  months[2] = { " March", 31, 30 };
  months[3] = { "April", 30, 29 };
  months[4] = { "   May", 31, 30 };
  months[5] = { "      June", 30, 29 };
  months[6] = { "July", 31, 30 };
  months[7] = { "   August", 31, 30 };
  months[8] = { "   September", 30, 29 };
  months[9] = { "October", 31, 30 };
  months[10] = { "November", 30, 29 };
  months[11] = { "December", 31, 30 };
  
  int const numberOfdaysWeek = 5;
  string week[numberOfdaysWeek] {"вс", "пн", "вт", "ср", "чт"};
  
  int year, yearForWeek, factorWeek, dayOfWeek;
  cout << "введите необходимый год: ";
  cin >> year;
  
  if ((year % 4  == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)){
    ++months[1].amountDays;
  }

  factorWeek = (1 + ((11 * 1) - 1) / 5 + (year - 1) + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400);
  dayOfWeek = factorWeek % numberOfdaysWeek;
  
  for(int month = 0; month < numberOfMonths; month += 3){
    int monthForWeek = month;
    
    cout << "         " << months[month].monthName << "         ";
    cout << "         " << months[month + 1].monthName << "         ";
    cout << "         " << months[month + 2].monthName << "         ";
    cout << endl;
    
    for(int monthLine = month; monthLine < month + 3; ++monthLine){
      for(int column = 0; column < numberOfdaysWeek; ++column) {
        int weekDay = dayOfWeek % numberOfdaysWeek;
        cout << "|" << week[weekDay] << "|";
        ++dayOfWeek;
      }
      cout << "        ";
      dayOfWeek += months[monthForWeek].amountDays - numberOfdaysWeek;
      ++monthForWeek;
    }

    cout << endl;
    int maxDayInMonth = months[0].amountDays;
    for(int month = 1; month < numberOfMonths; ++month){
      if((months[month].amountDays) > maxDayInMonth){
        maxDayInMonth = months[month].amountDays;
      }
    }
    
    int const dayColumn = maxDayInMonth / numberOfdaysWeek + 1;
    for(int dayLine = 0; dayLine < dayColumn; ++dayLine){  
      for(int dayInLine = month; dayInLine < month + 3; ++dayInLine){
        for(int daysColumn = 0; daysColumn < numberOfdaysWeek; ++daysColumn){
          if(months[dayInLine].amountDays <= 0){
            cout << "    ";
          } else {
              if((abs(months[dayInLine].amountDays - months[dayInLine].amountDays2)) > months[dayInLine].amountDays){
                cout << "    ";
              } else {
                  printf("|%02d|", abs(months[dayInLine].amountDays - months[dayInLine].amountDays2));
                  months[dayInLine].amountDays2 -= 1;
                }
              }
          }
        cout << "        "; 
        }
      cout << endl;
      }
    cout << "        " << endl;
  }
  return 0;
}

