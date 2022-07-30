package labstore

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class OutServiceSpec extends Specification {

    OutService outService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Out(...).save(flush: true, failOnError: true)
        //new Out(...).save(flush: true, failOnError: true)
        //Out out = new Out(...).save(flush: true, failOnError: true)
        //new Out(...).save(flush: true, failOnError: true)
        //new Out(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //out.id
    }

    void "test get"() {
        setupData()

        expect:
        outService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Out> outList = outService.list(max: 2, offset: 2)

        then:
        outList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        outService.count() == 5
    }

    void "test delete"() {
        Long outId = setupData()

        expect:
        outService.count() == 5

        when:
        outService.delete(outId)
        sessionFactory.currentSession.flush()

        then:
        outService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Out out = new Out()
        outService.save(out)

        then:
        out.id != null
    }
}
