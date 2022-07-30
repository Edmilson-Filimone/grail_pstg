package labstore

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class OutsServiceSpec extends Specification {

    OutsService outsService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Outs(...).save(flush: true, failOnError: true)
        //new Outs(...).save(flush: true, failOnError: true)
        //Outs outs = new Outs(...).save(flush: true, failOnError: true)
        //new Outs(...).save(flush: true, failOnError: true)
        //new Outs(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //outs.id
    }

    void "test get"() {
        setupData()

        expect:
        outsService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Outs> outsList = outsService.list(max: 2, offset: 2)

        then:
        outsList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        outsService.count() == 5
    }

    void "test delete"() {
        Long outsId = setupData()

        expect:
        outsService.count() == 5

        when:
        outsService.delete(outsId)
        sessionFactory.currentSession.flush()

        then:
        outsService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Outs outs = new Outs()
        outsService.save(outs)

        then:
        outs.id != null
    }
}
