def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Meaningful message indicating the source of the error") 
    #except ValueError:
        

    distance = 0
    for a, b in zip(strand_a, strand_b): 
        if a!=b:
            distance += 1
    
    return distance