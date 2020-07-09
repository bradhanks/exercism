def is_isogram(string):
    foo = string.lower().replace(" ", "").replace("-", "")
    return  len(foo) == len(set(foo))