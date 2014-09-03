import pp.grails.*

class BootStrap {

    def init = { servletContext ->

    	if(!Person.count()){
    		createData()
    	}
    }
    def destroy = {
    }

    private void createData() {
    	def userRole = new Authority(authority: 'ROLE_USER').save()

    	/* The default password for all user. No need to encode here to avoid double encoding.*/
    	String password = 'password'

    	[cristiano:'Cristiano Costa', jonathan:'Jonathan Rufino', andre:'Andre Kalavero'].each { userName, realName -> 
    		def user = new Person(username: userName, realName:realName, password:password, enable: true).save()
    		PersonAuthority.create user, userRole, true

    	}
    }
}


