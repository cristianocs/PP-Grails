package pp.grails

class Conto {

	String titulo
	String conteudo
	Date dataCriacao
	
	static hasMany = [nomeAutor: Usuario]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..4000, blank:false
    	nomeAutor nullable: true
    }
}
