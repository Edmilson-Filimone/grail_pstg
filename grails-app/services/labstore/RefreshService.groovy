package labstore

import grails.gorm.transactions.Transactional
import labstore.Material
import labstore.Outs
import grails.gorm.DetachedCriteria

@Transactional
class RefreshService{

    Boolean updateMaterial(Outs outs) {
        def criteria = new DetachedCriteria(Material).build{
        eq ("name", outs.material.name)
    } 
    
    def listMaterial = criteria.list()

    for(item in listMaterial){
        if(item.getQuantity() < outs.getQuantity()){
            return true
            }
            else{
                item.setQuantity(item.getQuantity() - outs.getQuantity())
                item.save()
            }
        }
        return false
    }
}
