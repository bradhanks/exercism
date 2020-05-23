fun trans(one: Char) : Char {
    when (one) {
            'G' ->  return 'C'
            'C' ->   return 'G'
            'T' ->   return 'A'
            'A' ->   return 'U'
            else ->  return one
    } 

}

fun transcribeToRna(dna: String) : String {
    if(dna == "") return ""
    val list: List<String> = dna.toCharArray().map{x: Char -> Character.toString(trans(x))} 
    val reducer: String = list.reduce{acc: String, char: String -> acc + char}
    return reducer
}