class Matrix:
    def __init__(self, matrix_string):
        self.matrix = matrix_string
        self.rows = matrix_string.count('\n') + 1
        self.columns = matrix_string.index('\n', 0, len(matrix_string))

    def row(self, index):
        return self.matrix

    def column(self, index):
        
