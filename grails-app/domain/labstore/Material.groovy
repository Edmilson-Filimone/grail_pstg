package labstore

class Material {
    String name;
    Store store;
    Date expireDate;
    Double quantity;

    String toString(){
        "$name"
    }

    void setQuantity(Double quantity){
        if(quantity >= 0){
            this.quantity = quantity
        } 
    }

    static constraints = {
        name(nullable:false, blank:false);
        store(nullable:false, blank:false);
        quantity(nullable:false, blank: false);
        expireDate();
    }
    static mapping = {
        version:false
    }
}
