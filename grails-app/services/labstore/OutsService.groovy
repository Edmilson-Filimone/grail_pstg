package labstore

import grails.gorm.services.Service

@Service(Outs)
interface OutsService {

    Outs get(Serializable id)

    List<Outs> list(Map args)

    Long count()

    void delete(Serializable id)

    Outs save(Outs outs)
}
