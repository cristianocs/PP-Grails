package pp.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(PensamentoController)
@Mock(Pensamento)
class PensamentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pensamento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pensamentoInstanceList.size() == 0
        assert model.pensamentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pensamentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pensamentoInstance != null
        assert view == '/pensamento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pensamento/show/1'
        assert controller.flash.message != null
        assert Pensamento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pensamento/list'

        populateValidParams(params)
        def pensamento = new Pensamento(params)

        assert pensamento.save() != null

        params.id = pensamento.id

        def model = controller.show()

        assert model.pensamentoInstance == pensamento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pensamento/list'

        populateValidParams(params)
        def pensamento = new Pensamento(params)

        assert pensamento.save() != null

        params.id = pensamento.id

        def model = controller.edit()

        assert model.pensamentoInstance == pensamento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pensamento/list'

        response.reset()

        populateValidParams(params)
        def pensamento = new Pensamento(params)

        assert pensamento.save() != null

        // test invalid parameters in update
        params.id = pensamento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pensamento/edit"
        assert model.pensamentoInstance != null

        pensamento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pensamento/show/$pensamento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pensamento.clearErrors()

        populateValidParams(params)
        params.id = pensamento.id
        params.version = -1
        controller.update()

        assert view == "/pensamento/edit"
        assert model.pensamentoInstance != null
        assert model.pensamentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pensamento/list'

        response.reset()

        populateValidParams(params)
        def pensamento = new Pensamento(params)

        assert pensamento.save() != null
        assert Pensamento.count() == 1

        params.id = pensamento.id

        controller.delete()

        assert Pensamento.count() == 0
        assert Pensamento.get(pensamento.id) == null
        assert response.redirectedUrl == '/pensamento/list'
    }
}
