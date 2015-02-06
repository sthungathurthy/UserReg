package registartion



import org.junit.*
import grails.test.mixin.*

@TestFor(UserRegistrationController)
@Mock(UserRegistration)
class UserRegistrationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userRegistration/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userRegistrationInstanceList.size() == 0
        assert model.userRegistrationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userRegistrationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userRegistrationInstance != null
        assert view == '/userRegistration/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userRegistration/show/1'
        assert controller.flash.message != null
        assert UserRegistration.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userRegistration/list'

        populateValidParams(params)
        def userRegistration = new UserRegistration(params)

        assert userRegistration.save() != null

        params.id = userRegistration.id

        def model = controller.show()

        assert model.userRegistrationInstance == userRegistration
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userRegistration/list'

        populateValidParams(params)
        def userRegistration = new UserRegistration(params)

        assert userRegistration.save() != null

        params.id = userRegistration.id

        def model = controller.edit()

        assert model.userRegistrationInstance == userRegistration
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userRegistration/list'

        response.reset()

        populateValidParams(params)
        def userRegistration = new UserRegistration(params)

        assert userRegistration.save() != null

        // test invalid parameters in update
        params.id = userRegistration.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userRegistration/edit"
        assert model.userRegistrationInstance != null

        userRegistration.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userRegistration/show/$userRegistration.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userRegistration.clearErrors()

        populateValidParams(params)
        params.id = userRegistration.id
        params.version = -1
        controller.update()

        assert view == "/userRegistration/edit"
        assert model.userRegistrationInstance != null
        assert model.userRegistrationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userRegistration/list'

        response.reset()

        populateValidParams(params)
        def userRegistration = new UserRegistration(params)

        assert userRegistration.save() != null
        assert UserRegistration.count() == 1

        params.id = userRegistration.id

        controller.delete()

        assert UserRegistration.count() == 0
        assert UserRegistration.get(userRegistration.id) == null
        assert response.redirectedUrl == '/userRegistration/list'
    }
}
