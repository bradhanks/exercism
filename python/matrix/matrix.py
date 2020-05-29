import sys
sys.path.append("numpy_path")
import numpy as np

class Matrix:
    def __init__(self, matrix_string):
        self.matrix = [[int(j) for j in i.split()] for i in matrix_string.splitlines()]
    
    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        column = []
        [[column.append(self.matrix[i][index-1]) ] for i in range(len(self.matrix))]
        
        return column