class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
    this.prev = null;
  }
}
const head = Symbol("head");
const tail = Symbol("tail");
export class LinkedList {
  constructor() {
    this[head] = {value: null};
    this[tail] = {value: null};
    this[head].next = this[tail];
    this[tail].prev = this[head];
    this.length = 0;
  }
  // Helper methods
  isNotEmpty(node)  { return node.value !== null;  }
  createNode(value) { return new Node(value); }
  addNode(prevNode, newNode, nextNode)  {
    newNode.prev = prevNode;
    newNode.next = nextNode;
    prevNode.next = nextNode.prev =  newNode;
    this.length += 1;
  }
  removeNode(node)  {
    node.prev.next = node.next;
    node.next.prev = node.prev;
    this.length -= 1;
  }
  removeNodeCheck(node, returnValue = true) {
    if(this.isNotEmpty(node)) {
      this.removeNode(node);
      if(returnValue) { return node.value;  }
    }
  }
  findNodeByValue(value)  {
    let searchNode = this[head];
    do {
      searchNode = searchNode.next;
      if(searchNode.value === value)  { return searchNode;  }
    } while(searchNode.next);
    return {value: null};
  }
  // Methods
  count()           { return this.length;                                                 }
  delete(value)     { this.removeNodeCheck(this.findNodeByValue(value), false);           }
  pop()             { return this.removeNodeCheck(this[tail].prev);                       }
  push(value)       { this.addNode(this[tail].prev, this.createNode(value), this[tail]);  }
  shift()           { return this.removeNodeCheck(this[head].next);                       }
  unshift(value)    { this.addNode(this[head], this.createNode(value), this[head].next);  }
}