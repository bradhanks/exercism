export class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
    this.prev = null;
  }
}

const head = Symbol("head");
const tail = Symbol("tail");
export class LinkedList {
  constructor() {
    this[head] = null;
    this[tail] = null;
    this.size = 0;
  }

  push(data) {
    this.size += 1;
    // create a new node
    const newNode = new Node(data);
    // create head for objects with nothing stored in the linked list
    if(this[tail]) {
      // existing tail is new previous node
    this[tail].next = newNode;
    newNode.prev = this[tail];
    // newNode is new tail
    this[tail] = newNode; 
    } else {
      this[tail] = newNode;
    }
    if(this[head] == null) { this[head] = newNode; }
  }

  pop() {
    this.size = Math.max(0, this.size - 1);

    //pull of last value of the list
    const popNode = this[tail];
    //Update tail
    if(this[tail]) { 
      this[tail] = this[tail].prev; 
    } else {
      this[tail] = this[head];
    }
    if(this[head] == null) { this[head] = this[tail]; }

    return popNode ? popNode.data : popNode;
  }

  shift() {
    this.size = Math.max(0, this.size - 1);
    //pull of head node off the list
    const shiftNode = this[head];
    if(this[head]) { this[head] = this[head].next; }
    if(this[tail] == null) { this[tail] = this[head]; }
    return shiftNode ? shiftNode.data : shiftNode;
  }

  unshift(data) {
    this.size += 1;
    //put new node at the head
    const unshiftNode = new Node(data);
    
    if(this[head]) { 
      this[head].prev = unshiftNode;
      unshiftNode.next = this[head];
      this[head] = unshiftNode;
    } else {
      this[head] = unshiftNode;
    }
    if(this[tail] == null) { this[tail] = unshiftNode; }
  }

  delete(data) {
    //remove reference
    let search = this[head];
    let node = {};
    do{
      if(search.data === data){
        node = search;
        this.size = Math.max(this.size - 1);
        break;
      }
      search = search.next;
    }while(search)
    if(node.prev) { node.prev.next = node.next; } else { node.next = this[head]; }
    if(node.next) { node.next.prev = node.prev; } else { node.prev = this[tail]; }
  }

  count() {
    return this.size;
  }
}