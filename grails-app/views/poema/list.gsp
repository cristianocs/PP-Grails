
<%@ page import="pp.grails.Poema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poema.label', default: 'Poema')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-poema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-poema" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'poema.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="conteudo" title="${message(code: 'poema.conteudo.label', default: 'Conteudo')}" />
					
						<g:sortableColumn property="dataCriacao" title="${message(code: 'poema.dataCriacao.label', default: 'Data Criacao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${poemaInstanceList}" status="i" var="poemaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${poemaInstance.id}">${fieldValue(bean: poemaInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: poemaInstance, field: "conteudo")}</td>
					
						<td><g:formatDate date="${poemaInstance.dataCriacao}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${poemaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
