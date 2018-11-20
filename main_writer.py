"""
    This program is part of a Used Car Recommender System using ASP and s(ASP).
    Developed by: Miguel de la Rocha
    CS 4v98, Fall 2018
"""
 
import csv
import datetime


# Function to verify if a given string has a digit
def hasNumbers(inputString):
     return any(char.isdigit() for char in inputString)

# Function to clean a given string
def cleanString(inputString):
    modifiedString = inputString

    if "-" in inputString:
        modifiedString = inputString.replace('-', '_')

    if "." in inputString:
        modifiedString = inputString.replace('.', '_')

    return modifiedString.lower()


if __name__ == '__main__':
    # Open a file for writing
    f = open("CarFacts.lp", "a")
    # Constant for year where the program is executed
    YEAR = datetime.datetime.now().year

    # Open the file for the car data
    with open('data/sample.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=",")
        line_count = 0
        name = ""

        # Go through each row of the document and write to a file
        for row in csv_reader:
            # Skip the header line
            if line_count == 0:
                print(f'Column names are {", ".join(row)}')
                line_count += 1
                continue

            # _car(Miles, Age, Brand, Model, Price).
            # 0 = ID, 1 = Price, 2 = Year, 3 = Mileage, 4 = City, 5 = State, 6 = VIN, 7 = Make, 8 = Model
            # Assign each field to a variable for pre-processing
            mileage = int(row[3])
            age = int(row[2])
            price = int(row[1])
            brand = str(row[7])
            model = str(row[8])

            # Reject any model that has a number in it
            # TODO: Make it so that car numbers are valid
            if hasNumbers(model) or hasNumbers(brand):
                continue

            # If not rejected, make sure to get the brand and model in lowercase
            brand = cleanString(brand)
            model = cleanString(model)

            # Get the age of the car
            age = YEAR - age

            # Format each car as an ASP fact
            line = "_car({0}, {1}, {2}, {3}, {4}).\n".format(mileage, age, brand, model, price)

            # Write the line to file
            f.write(line)
            line_count += 1

            print(line)

