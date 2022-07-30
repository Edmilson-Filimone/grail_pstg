package labstore

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EntryServiceSpec extends Specification {

    EntryService entryService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Entry(...).save(flush: true, failOnError: true)
        //new Entry(...).save(flush: true, failOnError: true)
        //Entry entry = new Entry(...).save(flush: true, failOnError: true)
        //new Entry(...).save(flush: true, failOnError: true)
        //new Entry(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //entry.id
    }

    void "test get"() {
        setupData()

        expect:
        entryService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Entry> entryList = entryService.list(max: 2, offset: 2)

        then:
        entryList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        entryService.count() == 5
    }

    void "test delete"() {
        Long entryId = setupData()

        expect:
        entryService.count() == 5

        when:
        entryService.delete(entryId)
        sessionFactory.currentSession.flush()

        then:
        entryService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Entry entry = new Entry()
        entryService.save(entry)

        then:
        entry.id != null
    }
}
