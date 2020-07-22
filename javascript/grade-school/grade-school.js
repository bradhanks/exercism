const GradeSchool = class {
  #roster;
  constructor() {
    this.#roster = {};
  }

  roster() {
    return Object.keys(this.#roster).reduce((rosterCopy, grade) => {
      rosterCopy[grade] = [...this.#roster[grade]];
      return rosterCopy;
    }, {});
  }

  add(name, grade) {
    if (this.#roster.hasOwnProperty(grade)) {
      this.#roster[grade] = this.#roster[grade].concat(name).sort();
    } else {
      this.#roster[grade] = [name];
    }
  }

  grade(grade) {
    const [...stuff] = this.#roster[grade] || [];
    return stuff;
  }
};

export default GradeSchool;
