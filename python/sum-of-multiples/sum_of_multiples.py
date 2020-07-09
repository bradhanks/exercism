def sum_of_multiples(limit, multiples):
    set_to_sum = Set()
    for i in range(limit):
        for mult in multiples:
            if i*mult < limit: 
                set_to_sum.add(i*mult)
    print(lambda set_to_sum: reduce(lambda z, x: z + [y + [x] for y in z], set_to_sum, [[]]))     
    return lambda set_to_sum: reduce(lambda z, x: z + [y + [x] for y in z], set_to_sum, [[]])

sum_of_multiples = lambda 
        
