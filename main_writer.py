"""
    This program is part of a Used Car Recommender System using ASP and s(ASP).
    Developed by: Miguel de la Rocha
    CS 4v98, Fall 2018
"""
 
import csv

if __name__ == '__main__':
    # Open a file for writing
    f = open("CarFact_TEST.lp", "a")
    # Open the file for the car data
    with open('data/tc20171021.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=",")
        line_count = 0
        name = ""
        for row in csv_reader:
            # _car(Miles, Year, Brand, Model, Price).
            # 0 = ID, 1 = Price, 2 = Year, 3 = Mileage, 4 = City, 5 = State, 6 = VIN, 7 = Make, 8 = Model
            brand = str(row[7])
            model = str(row[8])
            if "-" in brand:
                brand = brand.replace('-', '_')
            if "-" in model:
                model = model.replace('-', '_')
            elif "." in model:
                model = model.replace('.', '_')
            
            if line_count == 0:
                print(f'Column names are {", ".join(row)}')
                line_count += 1
            elif line_count > 0:
                if name == row[7]:
                    continue
                else:
                    name = row[7]
                    line = "_car(" + row[3] + ", " + row[2] + ", " + brand + ", " + model + ", " + row[1] + ").\n"
                    f.write(line)
            else:
                line = "_car(" + row[3] + ", " + row[2] + ", " + brand + ", " + model + ", " + row[1] + ").\n"

                f.write(line)
                print("Writing line: ", line)

                line_count += 1