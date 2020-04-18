const toRna = (string) => {
  let stringNew = '';
  for(let rna of string){
    stringNew = stringNew + transcribe(rna);
  }

  return stringNew;
};

const transcribe = (block) => {
  switch(block){
    case "C": return "G";
    case "G": return "C";
    case "T": return "A";
    case "A": return "U";
  }
};

transcribe("CGAT");
