object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        var hamCount: Int = 0
        if(leftStrand.length != rightStrand.length) { throw Exception("left and right strands must be of equal length")}
        return if(isEmpty(leftStrand, rightStrand)) oneEmpty(leftStrand, rightStrand) else hamming(leftStrand, rightStrand, hamCount)
    }

    fun isEmpty(leftStrand: String, rightStrand: String): Boolean {
        return if (leftStrand == "" ||  rightStrand == "") true else false
    }

    fun oneEmpty(leftStrand: String, rightStrand: String): Int = if(leftStrand == rightStrand) 0 else 1

    fun hamming(leftStrand: String, rightStrand: String, hamCount: Int): Int {
        val leftList: List<String>  = leftStrand.split("")
        val rightList: List<String> = rightStrand.split("")
        val (nextLeft, restLeft)   = leftList
        if (isEmpty(restLeft,"x")) return hamCount
        val (nextRight, restRight) = rightList
        return if (nextLeft != nextRight) hamming(restLeft, restRight, hamCount + 1) else hamming(restLeft, restRight, hamCount)
    }
}


