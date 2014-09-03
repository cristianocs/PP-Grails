package pp.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(PoemaController)
@Mock(Poema)
class PoemaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/poema/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.poemaInstanceList.size() == 0
        assert model.poemaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.poemaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.poemaInstance != null
        assert view == '/poema/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/poema/show/1'
        assert controller.flash.message != null
        assert Poema.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/poema/list'

        populateValidParams(params)
        def poema = new Poema(params)

        assert poema.save() != null

        params.id = poema.id

        def model = controller.show()

        assert model.poemaInstance == poema
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/poema/list'

        populateValidParams(params)
        def poema = new Poema(params)

        assert poema.save() != null

        params.id = poema.id

        def model = controller.edit()

        assert model.poemaInstance == poema
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/poema/list'

        response.reset()

        populateValidParams(params)
        def poema = new Poema(params)

        assert poema.save() != null

        // test invalid parameters in update
        params.id = poema.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/poema/edit"
        assert model.poemaInstance != null

        poema.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/poema/show/$poema.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        poema.clearErrors()

        populateValidParams(params)
        params.id = poema.id
        params.version = -1
        controller.update()

        assert view == "/poema/edit"
        assert model.poemaInstance != null
        assert model.poemaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/poema/list'

        response.reset()

        populateValidParams(params)
        def poema = new Poema(params)

        assert poema.save() != null
        assert Poema.count() == 1

        params.id = poema.id

        controller.delete()

        assert Poema.count() == 0
        assert Poema.get(poema.id) == null
        assert response.redirectedUrl == '/poema/list'
    }
}
