enum RnaLookupTable {
    C = "G",
    G = "C",
    T = "A",
    A = "U",
};
type dnaCodon = "C" | "G" | "T" | "A";
class Transcriptor {

    toRna(dnaString: string): string {
        let typedDna = dnaString.split("") as Array<RnaLookupTable>;
        const rnaString: string = typedDna.map((x: RnaLookupTable) => 
            {
            try {
                return RnaLookupTable[x as keyof typeof RnaLookupTable];
            }
            catch(error)
            {
                console.log(error);
                throw new Error('Invalid input DNA.')
            }

        }).join(""); 
        return rnaString;
    }

}
export default Transcriptor;