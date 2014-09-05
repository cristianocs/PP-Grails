
<%@ page import="pp.grails.Conto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conto.label', default: 'Conto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conto">
			
				<g:if test="${contoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="conto.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${contoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contoInstance?.conteudo}">
				<li class="fieldcontain">
					<span id="conteudo-label" class="property-label"><g:message code="conto.conteudo.label" default="Conteudo" /></span>
					
						<span class="property-value" aria-labelledby="conteudo-label"><g:fieldValue bean="${contoInstance}" field="conteudo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contoInstance?.realName}">
				<li class="fieldcontain">
					<span id="realName-label" class="property-label"><g:message code="conto.realName.label" default="Real Name" /></span>
					
						<g:each in="${contoInstance.realName}" var="r">
						<span class="property-value" aria-labelledby="realName-label"><g:link controller="person" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contoInstance?.dataCriacao}">
				<li class="fieldcontain">
					<span id="dataCriacao-label" class="property-label"><g:message code="conto.dataCriacao.label" default="Data Criacao" /></span>
					
						<span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${contoInstance?.dataCriacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
