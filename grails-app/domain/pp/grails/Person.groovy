package pp.grails

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.*

@Secured(['IS_AUTHENTICATED_FULLY'])

class Person {

	transient springSecurityService

	String realName
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	
	static belongsTo = [Conto, Livro, Pensamento, Poema, Texto]

	static hasMany = [conto: Conto, livro: Livro, pensamento: Pensamento, poema: Poema, texto: Texto]

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		conto nullable: true
    	livro nullable: true
    	pensamento nullable: true
    	poema nullable: true
    	texto nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
