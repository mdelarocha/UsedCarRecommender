"""
    This program is part of a Used Car Recommender System using ASP and s(ASP).
    Developed by: Miguel de la Rocha
    CS 4v98, Fall 2018
"""

import csv

def __main__: 
    with open('data/tc20171021.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=",")
        line_count = 0
        for row in csv_reader: 
            if line_count == 0:
                print(f'Column names are {", ".join(row)}')
                line_count += 1
            else:
                print(f'\t{row[0]} and {row[1]}')
                line_count += 1
        print(f'Processed {line_count} lines.')
        


