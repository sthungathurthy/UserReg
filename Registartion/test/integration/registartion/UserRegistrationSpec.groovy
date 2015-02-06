package registartion

import grails.plugin.spock.IntegrationSpec

/**
 * test for UserRegistration
 */
class UserRegistrationSpec extends IntegrationSpec {

    def "test persisting of user registration by giving all mandatory data"() {
        when: "I create a registration"
        def userRegistration = new UserRegistration(firstName: 'Saidulu', lastName: 'Thunga', email: 'sai@gmail.com', password: 'test', userName: 'test',address: 'hyd')
        userRegistration.save()

        then:'registration is saved successfully'
        userRegistration.id != null
        userRegistration.firstName == 'Saidulu'
    }

    def "test persisting of user registration without giving all mandatory data"() {
        when: "I create a registration, without giving first name and last name"
        def userRegistration = new UserRegistration(email: 'sai@gmail.com', password: 'test', userName: 'test',address: 'hyd')
        userRegistration.save()

        then:'registration saved failed'
        userRegistration.id == null
        userRegistration.validate() == false
    }
}
