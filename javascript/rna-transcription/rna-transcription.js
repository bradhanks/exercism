export const toRna = (string) => {
    return [...string].map(x => rnaLookup(x)).join("");
}

function rnaLookup(rna) {
    try {
        return rnaTable[rna];
    } catch {
        throw 'rnaLookup function has a problem!';
    }
}

export const rnaTable = {
    "C": "G",
    "G": "C",
    "T": "A",
    "A": "U"
}
