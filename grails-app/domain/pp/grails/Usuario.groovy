package pp.grails

class Usuario {

	String nomeAutor
	String userEmail

	static belongsTo = [Conto, Livro, Pensamento, Poema]

	static hasMany = [conto: Conto, livro: Livro, pensamento: Pensamento, poema: Poema]

	

    static constraints = {
    	conto nullable: true
    	livro nullable: true
    	pensamento nullable: true
    	poema nullable: true
    }
}
