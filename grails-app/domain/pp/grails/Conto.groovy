package pp.grails

class Conto {

	String titulo
	String conteudo
	Date dataCriacao 
	
	static hasMany = [realName: Person]

    static constraints = {
    	titulo blank:false
    	conteudo size:2..4000, blank:false
    	realName nullable: true, editable: false
    }
}
