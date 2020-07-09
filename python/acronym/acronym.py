import re
def abbreviate(words):
    prep = re.sub(r'(\'S)?[^A-Z]+', " ", words.upper()).split(" ")
    char_list = list(map(lambda x: x[0], prep))
    return ''.join(char_list)
    
    
