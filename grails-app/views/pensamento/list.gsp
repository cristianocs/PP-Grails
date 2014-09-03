
<%@ page import="pp.grails.Pensamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pensamento.label', default: 'Pensamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pensamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pensamento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'pensamento.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="conteudo" title="${message(code: 'pensamento.conteudo.label', default: 'Conteudo')}" />
					
						<g:sortableColumn property="dataCriacao" title="${message(code: 'pensamento.dataCriacao.label', default: 'Data Criacao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pensamentoInstanceList}" status="i" var="pensamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pensamentoInstance.id}">${fieldValue(bean: pensamentoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: pensamentoInstance, field: "conteudo")}</td>
					
						<td><g:formatDate date="${pensamentoInstance.dataCriacao}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pensamentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
