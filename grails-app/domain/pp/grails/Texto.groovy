package pp.grails

class Texto {

    String titulo
	String conteudo
	Date dataCriacao
	
	static hasMany = [realName: Person]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..15000, blank:false
    	realName nullable: true
    }
}
