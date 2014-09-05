package pp.grails

class Poema {

	String titulo
	String conteudo
	Date dataCriacao
	
	static hasMany = [realName: Person]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..1500, blank:false
    	realName nullable: true
    }
}
