
<%@ page import="pp.grails.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.conto}">
				<li class="fieldcontain">
					<span id="conto-label" class="property-label"><g:message code="usuario.conto.label" default="Conto" /></span>
					
						<g:each in="${usuarioInstance.conto}" var="c">
						<span class="property-value" aria-labelledby="conto-label"><g:link controller="conto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="usuario.livro.label" default="Livro" /></span>
					
						<g:each in="${usuarioInstance.livro}" var="l">
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.pensamento}">
				<li class="fieldcontain">
					<span id="pensamento-label" class="property-label"><g:message code="usuario.pensamento.label" default="Pensamento" /></span>
					
						<g:each in="${usuarioInstance.pensamento}" var="p">
						<span class="property-value" aria-labelledby="pensamento-label"><g:link controller="pensamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.nomeAutor}">
				<li class="fieldcontain">
					<span id="nomeAutor-label" class="property-label"><g:message code="usuario.nomeAutor.label" default="Nome Autor" /></span>
					
						<span class="property-value" aria-labelledby="nomeAutor-label"><g:fieldValue bean="${usuarioInstance}" field="nomeAutor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.userEmail}">
				<li class="fieldcontain">
					<span id="userEmail-label" class="property-label"><g:message code="usuario.userEmail.label" default="User Email" /></span>
					
						<span class="property-value" aria-labelledby="userEmail-label"><g:fieldValue bean="${usuarioInstance}" field="userEmail"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
