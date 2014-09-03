package pp.grails

class Livro {

	String titulo
	String conteudo
	Date dataCriacao

	static hasMany = [nomeAutor: Usuario]

    static constraints = {
    	titulo blank:false
    	conteudo blank:false
    	nomeAutor nullable: true
    }
}
