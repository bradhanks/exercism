def convert(number):
    return f'{pling(number)}{plang(number)}{plong(number)}' if f'{pling(number)}{plang(number)}{plong(number)}' else f'{number}'

def pling(number):
    return 'Pling' if not number%3 else ''

def plang(number):
    return 'Plang' if not number%5 else ''

def plong(number):
    return 'Plong' if not number%7 else ''
