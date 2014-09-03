<%@ page import="pp.grails.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'conto', 'error')} ">
	<label for="conto">
		<g:message code="usuario.conto.label" default="Conto" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'livro', 'error')} ">
	<label for="livro">
		<g:message code="usuario.livro.label" default="Livro" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'pensamento', 'error')} ">
	<label for="pensamento">
		<g:message code="usuario.pensamento.label" default="Pensamento" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'poema', 'error')} ">
	<label for="poema">
		<g:message code="usuario.poema.label" default="Poema" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'texto', 'error')} ">
	<label for="texto">
		<g:message code="usuario.texto.label" default="Texto" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nomeAutor', 'error')} ">
	<label for="nomeAutor">
		<g:message code="usuario.nomeAutor.label" default="Nome Autor" />
		
	</label>
	<g:textField name="nomeAutor" value="${usuarioInstance?.nomeAutor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userEmail', 'error')} ">
	<label for="userEmail">
		<g:message code="usuario.userEmail.label" default="User Email" />
		
	</label>
	<g:textField name="userEmail" value="${usuarioInstance?.userEmail}"/>
</div>

