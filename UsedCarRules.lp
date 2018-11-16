% ASP program automating Common Sense when Buying a used Car
% Developed by: Miguel de la Rocha
% CS 4v98, Fall 2018

#include 'HighLevelFacts.lp'.
# include 'CarFact.lp'.
%include budget as a fact

%inputs to ask from user
budget(1200).
preference(luxury).



_bestOption(Miles, Year, Brand, Model, Price) :- _goodMileage(Miles, Year), _goodYearRange(Year), _reliable(Brand), _priceRange(Price, Budget).

% Rules regarding Mileage

_badMileage(Miles, Years) :- Miles >= 14000 * Years.

_decentMileage(Miles, Years) :- Miles >= 12000 * Years, 14000 * Years > Miles.

_goodMileage(Miles, Years) :- not _decentMileage(Miles, Years), not _badMileage(Miles, Years).



% Rules regarding the Price Range

_priceRange(Price, Budget) :- Price =< Budget. 

% Rules regarding the Year Ranges

_badYearRange(Year) :- 2008 > Year.

_decentYearRange(Year) :- Year >= 2008, 2013 > Year.

_goodYearRange(Year) :- not _decentYearRange(Year), not _badYearRange(Year).


% Rules to determine what is the Best Option, and Fair Options for a Used Car 

_fairOption(Miles, Year, Brand, Budget, Price) :- _decentMileage(Miles, Year), _decentYearRange(Year), _priceRange(Price, Budget), _luxury(Brand), not _bestOption(Miles, Year, Brand, Budget, Price).

_bestOption(Miles, Year, Brand, Budget, Price) :- _goodMileage(Miles, Year), _goodYearRange(Year), _reliable(Brand), _priceRange(Price, Budget).