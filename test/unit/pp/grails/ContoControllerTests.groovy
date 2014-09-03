package pp.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(ContoController)
@Mock(Conto)
class ContoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contoInstanceList.size() == 0
        assert model.contoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contoInstance != null
        assert view == '/conto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conto/show/1'
        assert controller.flash.message != null
        assert Conto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conto/list'

        populateValidParams(params)
        def conto = new Conto(params)

        assert conto.save() != null

        params.id = conto.id

        def model = controller.show()

        assert model.contoInstance == conto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conto/list'

        populateValidParams(params)
        def conto = new Conto(params)

        assert conto.save() != null

        params.id = conto.id

        def model = controller.edit()

        assert model.contoInstance == conto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conto/list'

        response.reset()

        populateValidParams(params)
        def conto = new Conto(params)

        assert conto.save() != null

        // test invalid parameters in update
        params.id = conto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conto/edit"
        assert model.contoInstance != null

        conto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conto/show/$conto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conto.clearErrors()

        populateValidParams(params)
        params.id = conto.id
        params.version = -1
        controller.update()

        assert view == "/conto/edit"
        assert model.contoInstance != null
        assert model.contoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conto/list'

        response.reset()

        populateValidParams(params)
        def conto = new Conto(params)

        assert conto.save() != null
        assert Conto.count() == 1

        params.id = conto.id

        controller.delete()

        assert Conto.count() == 0
        assert Conto.get(conto.id) == null
        assert response.redirectedUrl == '/conto/list'
    }
}
