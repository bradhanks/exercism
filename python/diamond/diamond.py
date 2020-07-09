def rows(letter):
    # dimensions are side x side
    side = 2*(ord(letter)-65)+1
    
    # A
    spaces(ord(letter)-65)
    letter(65)
    spaces(ord(letter)-65)
    
    ascii = 66
    for i in range(66, 66+side, 1):
        spaces(side - (ord(i) - 65))
        letter(i)
        spaces(side - 2 - 2*(side - (ord(i) - 65)))
        letter(i)
        spaces(side - (ord(i) - 65))
    
    for i in range(66+side, 66, -1):
        spaces(side - (ord(ascii) - 65))
        letter(ascii)
        spaces(side - 2 - 2*(side - (ord(ascii) - 65)))
        letter(ascii)
        spaces(side - (ord(ascii) - 65))
        
    # A
    spaces(ord(letter)-65)
    letter(65)
    spaces(ord(letter)-65)
        


def spaces(n):
    for i in range(n):
        print(" ")

def letter(n):
    print(chr(n))