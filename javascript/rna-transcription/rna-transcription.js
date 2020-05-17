export const toRna = (string) => {
    return [...string].map(x => rnaLookup(x)).join("");
}

const rnaLookup = (rna) => rnaTable[rna] || '';

export const rnaTable = {
    "C": "G",
    "G": "C",
    "T": "A",
    "A": "U" 
}
