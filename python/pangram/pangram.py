import re
def is_pangram(sentence):
    sentence = sentence.lower()
    inputset = [item for item in set(re.split(r'(\B|\b|\s)', sentence)) if re.compile(r'[a-z]').match(item)]
    return len(inputset) == 26   
