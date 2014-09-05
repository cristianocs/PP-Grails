package pp.grails

class Pensamento {
	
	String titulo
	String conteudo
	Date dataCriacao

	static hasMany = [realName: Person]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..150, blank:false
    	realName nullable: true
    }
}
