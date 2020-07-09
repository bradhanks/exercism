import re
def count_words(sentence):
    split_on = re.compile('[^a-zA-Z0-9]+')
    word_list = re.split(split_on, sentence.lower())
    return {word: word_list.count(word) for word in set(word_list) if word != ''}