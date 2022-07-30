package labstore

class Store {
    String name;


    String toString(){
        "$name"
    }
    static hasMany = [material: Material]

    static constraints = {
        name(nullable:false, blank:false);
    }
    static mapping = {
        version:false
    }
}
