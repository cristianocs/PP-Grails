<%@ page import="pp.grails.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="person.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${personInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="person.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${personInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'conto', 'error')} ">
	<label for="conto">
		<g:message code="person.conto.label" default="Conto" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'livro', 'error')} ">
	<label for="livro">
		<g:message code="person.livro.label" default="Livro" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'pensamento', 'error')} ">
	<label for="pensamento">
		<g:message code="person.pensamento.label" default="Pensamento" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'poema', 'error')} ">
	<label for="poema">
		<g:message code="person.poema.label" default="Poema" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'texto', 'error')} ">
	<label for="texto">
		<g:message code="person.texto.label" default="Texto" />
		
	</label>
	
</div>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="person.realName.label" default="Real Name" />
		
	</label>
	<g:textField name="realName" value="${personInstance?.realName}"/>
</div>

