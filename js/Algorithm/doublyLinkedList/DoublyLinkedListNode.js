export default class DoublyLinkedListNode{
    constructor(value, next = null, previos = null){
        this.value = value;
        this.next= next;
        this.previouse = previous;
    }

    toString(callback){
        return callback ? callback(this.value) : `$(this.value)`;
    }
}
//https://www.daleseo.com/js-babel-node/