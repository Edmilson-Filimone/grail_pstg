package labstore

import grails.gorm.services.Service

@Service(Entry)
interface EntryService {

    Entry get(Serializable id)

    List<Entry> list(Map args)

    Long count()

    void delete(Serializable id)

    Entry save(Entry entry)

}