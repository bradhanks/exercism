export const countWords = (string) => { return dictBuild(string.trim(' ').split(/\b[^a-zA-Z]+\b/)); };

const dictBuild = (list, dict = []) => {
  let word = '';
  [word, ...list] = list;
  if(dict.indexOf(word) == -1) {dict[word] = 1; } 
  else { dict[word] += 1; }
  return list ? dictBuild(list, dict) : dict;
};