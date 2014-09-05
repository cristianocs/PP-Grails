
<%@ page import="pp.grails.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="person.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${personInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="person.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${personInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.conto}">
				<li class="fieldcontain">
					<span id="conto-label" class="property-label"><g:message code="person.conto.label" default="Conto" /></span>
					
						<g:each in="${personInstance.conto}" var="c">
						<span class="property-value" aria-labelledby="conto-label"><g:link controller="conto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="person.livro.label" default="Livro" /></span>
					
						<g:each in="${personInstance.livro}" var="l">
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.pensamento}">
				<li class="fieldcontain">
					<span id="pensamento-label" class="property-label"><g:message code="person.pensamento.label" default="Pensamento" /></span>
					
						<g:each in="${personInstance.pensamento}" var="p">
						<span class="property-value" aria-labelledby="pensamento-label"><g:link controller="pensamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.poema}">
				<li class="fieldcontain">
					<span id="poema-label" class="property-label"><g:message code="person.poema.label" default="Poema" /></span>
					
						<g:each in="${personInstance.poema}" var="p">
						<span class="property-value" aria-labelledby="poema-label"><g:link controller="poema" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.texto}">
				<li class="fieldcontain">
					<span id="texto-label" class="property-label"><g:message code="person.texto.label" default="Texto" /></span>
					
						<g:each in="${personInstance.texto}" var="t">
						<span class="property-value" aria-labelledby="texto-label"><g:link controller="texto" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="person.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${personInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="person.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${personInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${personInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="person.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${personInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.realName}">
				<li class="fieldcontain">
					<span id="realName-label" class="property-label"><g:message code="person.realName.label" default="Real Name" /></span>
					
						<span class="property-value" aria-labelledby="realName-label"><g:fieldValue bean="${personInstance}" field="realName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
