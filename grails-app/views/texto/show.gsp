
<%@ page import="pp.grails.Texto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'texto.label', default: 'Texto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-texto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-texto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list texto">
			
				<g:if test="${textoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="texto.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${textoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textoInstance?.conteudo}">
				<li class="fieldcontain">
					<span id="conteudo-label" class="property-label"><g:message code="texto.conteudo.label" default="Conteudo" /></span>
					
						<span class="property-value" aria-labelledby="conteudo-label"><g:fieldValue bean="${textoInstance}" field="conteudo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textoInstance?.nomeAutor}">
				<li class="fieldcontain">
					<span id="nomeAutor-label" class="property-label"><g:message code="texto.nomeAutor.label" default="Nome Autor" /></span>
					
						<g:each in="${textoInstance.nomeAutor}" var="n">
						<span class="property-value" aria-labelledby="nomeAutor-label"><g:link controller="usuario" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${textoInstance?.dataCriacao}">
				<li class="fieldcontain">
					<span id="dataCriacao-label" class="property-label"><g:message code="texto.dataCriacao.label" default="Data Criacao" /></span>
					
						<span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${textoInstance?.dataCriacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${textoInstance?.id}" />
					<g:link class="edit" action="edit" id="${textoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
