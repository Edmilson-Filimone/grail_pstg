package labstore

class Entry {
    Material material;
    Store store;
    Double quantity;
    Date date = new Date();

    Double setQuantity(Double quantity){
        if(quantity > 0){this.quantity = quantity}
    }

    static hasMany = [material:Material]
    static belongsTo = [store:Store]

    static constraints = {
        material(nullable:false, blank:false);
        store(nullable:false, blank:false);
        quantity(nullable:false, blank:false);
        date();
    }

    static mapping = {
        version:false
    }
}
