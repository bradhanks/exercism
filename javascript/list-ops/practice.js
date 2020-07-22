class LineOps{
    constructor(list) {
        this.counter = 0;
        this.list = Array.from(list);
        this.head = null;
    }
    
    reverse() {
        let list = Array.from(this.list.slice(0));
        console.log(typeof(list));
        let head = null;
        let reverseList = [];
        while(reverseList.length < 10){
            {head, } = list;
            console.log(reverseList);
            reverseList.unshift(this.head);
        }
        return reverseList;
    }

    count() {
        let list = this.list.slice(0);
        do{
            if(list === []) {return counter;}
            [this.head, ...list] = list;
            counter += 1;
        } while(list);
    }

    map(mapper) {
        const list = this.list.slice(0);
        const mappedList = [];
        do {
            if(list === []) {return mappedList; }
            mappedList.append(mapper(list.shift()));
        } while(list);

    }
}

const test = new LineOps([1,2,3,4,5]);
console.log(test.reverse());