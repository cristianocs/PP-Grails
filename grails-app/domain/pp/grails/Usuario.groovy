package pp.grails

class Usuario {

	String nomeAutor
	String userEmail

	static belongsTo = [Conto, Livro, Pensamento, Poema, Texto]

	static hasMany = [conto: Conto, livro: Livro, pensamento: Pensamento, poema: Poema, texto: Texto]

	

    static constraints = {
    	conto nullable: true
    	livro nullable: true
    	pensamento nullable: true
    	poema nullable: true
    	texto nullable: true
    }
}
