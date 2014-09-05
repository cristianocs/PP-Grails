package pp.grails

class Livro {

	String titulo
	String conteudo
	Date dataCriacao

	static hasMany = [realName: Person]

    static constraints = {
    	titulo blank:false
    	conteudo blank:false
    	realName nullable: true
    }
}
