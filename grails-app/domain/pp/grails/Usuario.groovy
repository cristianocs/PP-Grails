package pp.grails

class Usuario {

	String nomeAutor
	String userEmail

	static belongsTo = [Conto, Livro, Pensamento]

	static hasMany = [conto: Conto, livro: Livro, pensamento: Pensamento]

	

    static constraints = {
    	conto nullable: true
    	livro nullable: true
    	pensamento nullable: true

    }
}
