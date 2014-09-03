package pp.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(TextoController)
@Mock(Texto)
class TextoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/texto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.textoInstanceList.size() == 0
        assert model.textoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.textoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.textoInstance != null
        assert view == '/texto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/texto/show/1'
        assert controller.flash.message != null
        assert Texto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/texto/list'

        populateValidParams(params)
        def texto = new Texto(params)

        assert texto.save() != null

        params.id = texto.id

        def model = controller.show()

        assert model.textoInstance == texto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/texto/list'

        populateValidParams(params)
        def texto = new Texto(params)

        assert texto.save() != null

        params.id = texto.id

        def model = controller.edit()

        assert model.textoInstance == texto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/texto/list'

        response.reset()

        populateValidParams(params)
        def texto = new Texto(params)

        assert texto.save() != null

        // test invalid parameters in update
        params.id = texto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/texto/edit"
        assert model.textoInstance != null

        texto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/texto/show/$texto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        texto.clearErrors()

        populateValidParams(params)
        params.id = texto.id
        params.version = -1
        controller.update()

        assert view == "/texto/edit"
        assert model.textoInstance != null
        assert model.textoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/texto/list'

        response.reset()

        populateValidParams(params)
        def texto = new Texto(params)

        assert texto.save() != null
        assert Texto.count() == 1

        params.id = texto.id

        controller.delete()

        assert Texto.count() == 0
        assert Texto.get(texto.id) == null
        assert response.redirectedUrl == '/texto/list'
    }
}
