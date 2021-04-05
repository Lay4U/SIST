import DoublyLinkedListNode from './DoublyLinkedListNode';
import Comparator from './Comparator'

export defautl calss DoublyLinkedList{
    constructor(comparatorFunction){
        this.head = null;
        this.tail = null;
        this.compare = new Comparator(comparatorFunction);
    }

    prepend(value){
        const newNode = new DoublyLinkedListNode(value, this.head);

        if (this.head){
            this.head.previous = newNode;
        }
        this.head = newNode;

        
    }
}