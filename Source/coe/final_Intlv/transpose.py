import numpy as np
import pandas as pd


def converter(fn, coefile, radix):
    data = []
    rf = open(coefile, 'r')
    context = rf.readlines()[2:]
    rf.close()

    for i in range(len(context)):
        data.append(int(context[i].rstrip()[:-1], radix))
    matrix = np.array(data)
    input_matrix = matrix.reshape((16, 16))

    input_data_frame = pd.DataFrame(input_matrix)
    output_data_frame = pd.DataFrame(input_matrix.T)

    input_data_frame.to_csv(fn + 'input_matrix.csv')
    output_data_frame.to_csv(fn + 'output_matrix.csv')


if __name__ == '__main__':
    FILE = input('please enter your input coe file name: ')
    file_name = input('please enter your output file name: ')
    converter(file_name, FILE, 2)
