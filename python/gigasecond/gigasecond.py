import datetime
def add(moment):
    seconds = moment.timestamp() + 10**6
    date = moment.fromtimestamp(seconds)
    return date
