package registartion

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(UserRegistrationController)
@Mock([UserRegistration])
class UserRegistrationControllerSpec extends Specification{

    def userRegistration
    def setup() {
        userRegistration = new UserRegistration(firstName: 'Saidulu', lastName: 'Thunga', email: 'sai@gmail.com', password: 'test', userName: 'test',address: 'hyd')
        userRegistration.save()
    }
    def "test index action"() {
        when:
        controller.index()
        then:
        "/userRegistration/list" == response.redirectedUrl
    }

    def "test list action"() {
        when:
        controller.list()
        then:
        view == "/userRegistration/list"
        model.userRegistrationInstanceList.size() == 1
        model.userRegistrationInstanceTotal == 1
    }

    def "test create action"() {
        when:
        controller.create()
        then:
        model.userRegistration !=null
    }

    def "test save action "() {
        when:'call save action by giving all mandatory fields'
        params.firstName = 'sai'
        params.lastName = 'kumar'
        params.userName = 'naven'
        params.password = 'test'
        controller.save()
        then:
        response.redirectedUrl.contains('/userRegistration/show/')
        response.reset()
        params.clear()

        when:'call save action by without giving all mandatory fields'
        params.firstName = 'sai'
        params.lastName = 'kumar'
        controller.save()
        then:
        model.userRegistrationInstance != null
        view == '/userRegistration/create'
    }

    def "test show"() {
        when:'call show action without passing id'
        controller.show()
        then:
        flash.message != null
        response.redirectedUrl == '/userRegistration/list'

        when:'call show action with passing action'
        params.id = userRegistration.id
        controller.show()
        then:
        model.userRegistrationInstance == userRegistration
    }

    def  "test edit action"() {
        when:'call edit action without id'
        controller.edit()
        then:
        flash.message != null
        response.redirectedUrl == '/userRegistration/list'

        when: 'call edit action with id'
        params.id = userRegistration.id
        def model = controller.edit()

        then:
        model.userRegistrationInstance == userRegistration
    }

    def "test update action"() {
        when:
        controller.update()
        then:
        flash.message != null
        response.redirectedUrl == '/userRegistration/list'
        response.reset()

        when:'update first name'
        params.id = userRegistration.id
        params.firstName = 'Patrick'
        controller.update()
        then:
        response.redirectedUrl == "/userRegistration/show/${userRegistration.id}"
        userRegistration.firstName == 'Patrick'
        response.reset()

        when:
        params.id = userRegistration.id
        params.version = -1
        controller.update()
        then:
        view == "/userRegistration/edit"
        model.userRegistrationInstance != null
        model.userRegistrationInstance.errors.getFieldError('version')
        flash.message != null
    }

    def 'test delete action'() {
        when:
        controller.delete()
        then:
        flash.message != null
        response.redirectedUrl == '/userRegistration/list'
        response.reset()

        when:
        params.id = userRegistration.id
        controller.delete()
        then:
        UserRegistration.count() == 0
        UserRegistration.get(userRegistration.id) == null
        response.redirectedUrl == '/userRegistration/list'
    }
}
