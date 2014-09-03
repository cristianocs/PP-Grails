package pp.grails

class Texto {

    String titulo
	String conteudo
	Date dataCriacao
	
	static hasMany = [nomeAutor: Usuario]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..15000, blank:false
    	nomeAutor nullable: true
    }
}
