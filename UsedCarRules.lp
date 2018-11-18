% ASP program automating Common Sense when Buying a used Car
% Developed by: Miguel de la Rocha
% CS 4v98, Fall 2018

% include 'HighLevelFacts.lp'.
% include 'CarFact_TEST2.lp'.

%inputs to ask from user
_budget(7000).
preference(luxury).

%query : _bestOption(A,B,C,D,E).

_bestOption(Miles, Year, Brand, Model, Price) :- _car(Miles, Year, Brand, Model, Price), _goodMileage(Miles, Year), _priceRange(Price), _goodYearRange(Year), _reliable(Brand).

%add this to bestOption : _priceRange(Price, Budget)

_bestOption2(Miles, Year, Brand, Model, Price) :- _car(Miles, Year, Brand, Model, Price).

% Rules regarding Mileage

_badMileage(Miles, Year) :-  14000 * Year < Miles.

_decentMileage(Miles, Year) :-  12000 * Year  < Miles, 14000 * Year > Miles.

_goodMileage(Miles, Year) :- not _decentMileage(Miles, Year), not _badMileage(Miles, Year).



% Rules regarding the Price Range

%_priceRange(Price) :- Price =< budget.
_priceRange(Price) :- _budget(N), Price =< N. 

% Rules regarding the Year Ranges

_badYearRange(Year) :- 10 < Year.

_decentYearRange(Year) :-  10 =< Year, 5 < Year.

_goodYearRange(Year) :- not _decentYearRange(Year), not _badYearRange(Year).


% Rules to determine what is the Best Option, and Fair Options for a Used Car 

_fairOption(Miles, Year, Brand, Budget, Price) :- _decentMileage(Miles, Year), _decentYearRange(Year), _priceRange(Price, Budget), _luxury(Brand), not _bestOption(Miles, Year, Brand, Budget, Price).

_car(18681, 8, toyota, encore_onvenience, 6472).
_car(27592, 11, toyota, encore_fwd, 15749).
_car(130, 2, toyota, encore_leather, 16998).
_car(25195, 5, toyota, encore_fwd, 5777).
_car(22800, 10, toyota, encore_convenience, 16784).
_car(15, 2, lamborghini, sample_best_option, 15784).



_luxury(acura).
_luxury(alfa).
_luxury(aston).
_luxury(audi).
_luxury(bentley).
_luxury(bugatti).
_luxury(bmw).
_luxury(cadillac).
_luxury(ferrari).
_luxury(genesis).
_luxury(infiniti).
_luxury(jaguar).
_luxury(lamborghini).
_luxury(land).
_luxury(lincoln).
_luxury(lexus).
_luxury(maserati).
_luxury(mercedes_benz).
_luxury(porsche).
_luxury(rolls_royce).
_luxury(tesla).
_luxury(volvo).


_reliable(mercedes_benz).
_reliable(mazda).
_reliable(audi).
_reliable(honda).
_reliable(nissan).
_reliable(lincoln).
_reliable(toyota).
_reliable(bmw).
_reliable(hyundai).
_reliable(chevrolet).
_reliable(kia).
_reliable(infiniti).
_reliable(buick).
_reliable(porsche).
_reliable(lexus).

