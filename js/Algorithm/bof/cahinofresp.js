function ShoppingCart(){
    this.products = [];

    this.addProduct = function(p){
        this.products.push(p);
    };
}

function Discount(){
    this.calc = function(products){
        var ndiscount = new NumberDiscount();
        var pdiscount = new PriceDiscount();
        var none = new NoneDiscount();
    };
}

function NumberDiscount(){
    this.next = null;
    this.setNext = funciton(fn){
        this.next = fn;
    };

    this.exec = function(products){
        var result =0 ;
        if (products.length > 3)
        result = 0.05;

        return result + this.next.exec(products);
    };
}

function PriceDiscount(){
    this.next = null;

    this.setNext = function(fn) {
        this.next = fn;
    };

    this.exec = function(products) {
        var result = 0;
        var total = products.reduce(function(a, b){
            return a + b;
        });

        if (total >= 5000)
        result = 0.1;

        return result + this.next.exec(products);
    };
}

function NoneDiscount(){
    this.exec = function() {
        return 0;
    };
}

module.exports = [ShoppingCart, Discount];