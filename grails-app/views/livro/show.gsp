
<%@ page import="pp.grails.Livro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-livro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list livro">
			
				<g:if test="${livroInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="livro.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${livroInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livroInstance?.conteudo}">
				<li class="fieldcontain">
					<span id="conteudo-label" class="property-label"><g:message code="livro.conteudo.label" default="Conteudo" /></span>
					
						<span class="property-value" aria-labelledby="conteudo-label"><g:fieldValue bean="${livroInstance}" field="conteudo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livroInstance?.realName}">
				<li class="fieldcontain">
					<span id="realName-label" class="property-label"><g:message code="livro.realName.label" default="Real Name" /></span>
					
						<g:each in="${livroInstance.realName}" var="r">
						<span class="property-value" aria-labelledby="realName-label"><g:link controller="person" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${livroInstance?.dataCriacao}">
				<li class="fieldcontain">
					<span id="dataCriacao-label" class="property-label"><g:message code="livro.dataCriacao.label" default="Data Criacao" /></span>
					
						<span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${livroInstance?.dataCriacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${livroInstance?.id}" />
					<g:link class="edit" action="edit" id="${livroInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
