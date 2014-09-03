package pp.grails

class Poema {

	String titulo
	String conteudo
	Date dataCriacao
	
	static hasMany = [nomeAutor: Usuario]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..1500, blank:false
    	nomeAutor nullable: true
    }
}
