package pp.grails

class Livro {

	String titulo
	String conteudo
	Date dataCriacao

    static constraints = {
    	conteudo blank:false
    }
}
