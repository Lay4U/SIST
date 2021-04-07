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

        if (!this.tail){
            this.tail = newNode;
        }

        return this;
    }

    append(value){
        const newNode = new DoublyLinkedListNode(value);

        if(!this.head){
            this.head = newNode;
            this.tail = newNode;
        }
        
        return this;
    }

    delete(value){
        if(!this.head){
            return null;
        }

        let deletedNode = null;
        let currentNode = this.head;

        while(currentNode){
            if (this.compare.equal(currentNode.value, value)){
                deletedNode = currentNode;

                if(deletedNode === this.head){
                    this. head = deletedNode.next;
                    if(this.head){
                        this.head.previous = null;
                    }

                    if (deletedNode === this.tail){
                        this.tail = null;
                    }
                }else if (deletedNode === this.tail){
                    this.tail = deleted.previous;
                    this.tail.next = null;
                }else{
                    const previousNode = deletedNode.previous;
                    const nextNode = deletedNode.next;

                    previousNode.next = nextNode;
                    nextNode.previous = previousNode;
                }
            }

            currnetNode = currentNode.next;
        }

        return deletedNode;
    }

    find({ value = undefined, callback = undefined}) {
        if (!this.head){
            return null;
        }

        let currentNode = this.head;

        while(curentNode){
            if (callback && callback(currentNode.value)){
                return currentNode;
            }

            if (value !== undefined && this.compare.equal(currentNode.value, value)){
                return currentNode;
            }

            currentNode = currentNode.next;
        }

        return null;
    }
    deleteTail(){
        if (!this.tail){
            return null;
        }

        if (this.head === this.tail){
            const deletedTail = this.tail;
            this.head = null;
            this.tail = null;
            
            return deletedTail;
        }
    }

    toArray(){
        const nodes = [];

        let currentNode = this.head;
        while (currentNode){
            nodes.push(currentNode){
                nodes.push(currentNode);
                currentNode = currentNode.next;
            }

            return nodes;
        }

    }
    
    fromArray(values){
        values.forEach((value) => this.append(value));

        return this;
    }

    toString(callback){
        return this.toArray().map((node) => node.toString(callback)).toString();
    }

    reverse(){
        let currNode = this.head;
        let prevNode = null;
        let nextNode = null;

        while (currNode) {
            nextNode = currNode.next;
            prevNode = currNode.previous;

            currNode.next = prevNode;
            currNode.previous = nextNode;

            prevNode = currNode;
            currNode = nextNode;
        }

        this.tail = this.head;
        this.hea = prevNode;

        return this;
    }
}