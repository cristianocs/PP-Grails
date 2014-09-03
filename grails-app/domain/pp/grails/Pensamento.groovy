package pp.grails

class Pensamento {
	
	String titulo
	String conteudo
	Date dataCriacao

	static hasMany = [nomeAutor: Usuario]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..150, blank:false
    	nomeAutor nullable: true
    }
}
