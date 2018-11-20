% ASP program automating Common Sense when Buying a used Car
% Developed by: Miguel de la Rocha, Nahian Afsari
% CS 4v98, Fall 2018

# include 'HighLevelFacts.lp'.
# include 'CarFacts.lp'.

% User defined budget
% TODO: implement that the user can input this fact
_budget(15000).

% Rules that define what are the best options from the knowledge base

_bestOption(Miles, Age, Brand, Model, Price) :- _car(Miles, Age, Brand, Model, Price), _reliable(Brand), _goodMileage(Age, Miles),
    _goodYearRange(Age), _priceRange(Price).

% Rules that define what is a fair option 

_fairOption(Miles, Age, Brand, Model, Price) :- _car(Miles, Age, Brand, Model, Price), _reliable(Brand), _decentMileage(Age, Miles),
    _decentYearRange(Age), _priceRange(Price). 

% Rules that define what is a bad option

_badOption(Miles, Age, Brand, Model, Price) :- _car(Miles, Age, Brand, Model, Price), not _reliable(Brand), _badMileage(Age, Miles),
    _badYearRange(Age), not _priceRange(Price).

% Rule that allows the user to have an input in terms of budget 

_priceRange(Price) :- _budget(N), Price =< N.

% Rules for mileages

_goodMileage(Age, Miles) :- not _decentMileage(Age, Miles), not _badMileage(Age, Miles).

_decentMileage(Age, Miles) :- (Age * 12000) < Miles, not _badMileage(Age, Miles).

_badMileage(Age, Miles) :- (Age * 14000) < Miles. 

% Rules for year ranges

_goodYearRange(Age) :- not _decentYearRange(Age), not _badYearRange(Age).

_decentYearRange(Age) :- 3 < Age, not _badYearRange(Age).

_badYearRange(Age) :- 10 < Age.

% Running the Query
?- _bestOption(A,B,C,D,E).
?- _fairOption(A,B,C,D,E).
?- _badOption(A,B,C,D,E).