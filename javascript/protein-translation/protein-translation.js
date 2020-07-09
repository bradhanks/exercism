export const translate = (rna) => {
  if(!rna) return [];
  const protein = [];
  return loop(rna, protein);
};

const loop = (rna, protein) => {
  const codon = rna.substring(0,3);
  console.log(codon);
  rna = rna.substring(4);
  protein.push(lookup(codon));
  console.log(protein);
  if(rna.length < 3) { return protein; } else { loop(rna, protein); }
};

const lookup = (codon) => {
  return lookupTable[codon];
};

const lookupTable = {
  'AUG': "Methionine",
  'UUU': "Phenylalanine",
  'UUC': "Phenylalanine",
  'UUA': "Leucine", 
  'UUG': "Leucine",
  'UCU': "Serine",
  'UCC': "Serine", 
  'UCA': "Serine",
  'UCG': "Serine",
  'UAU': "Tyrosine",
  'UAC': "Tyrosine",
  'UGU': "Cysteine", 
  'UGC': "Cysteine",
  'UGG': "Tryptophan",
  'UAA': "STOP", 
  'UAG': "STOP", 
  'UGA': "STOP"
};