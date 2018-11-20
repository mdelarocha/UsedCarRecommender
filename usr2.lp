% ASP program automating Common Sense when Buying a used Car
% Developed by: Miguel de la Rocha
% CS 4v98, Fall 2018

% include 'HighLevelFacts.lp'.
% include 'CarFact_TEST2.lp'.

%inputs to ask from user
budget(17000).
preference(luxury).

%query : _bestOption(A,B,C,D,E).

_bestOption(Miles, Year, Brand, Model, Price) :- _car(Miles, Year, Brand, Model, Price), _luxury(Brand).

_car(18681, 8, toyota, encore_onvenience, 16472).
_car(27592, 11, toyota, encore_fwd, 15749).
_car(130, 2, toyota, encore_leather, 16998).
_car(25195, 5, toyota, encore_fwd, 15777).
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








