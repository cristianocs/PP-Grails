<%@ page import="pp.grails.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento">
		<g:message code="usuario.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${usuarioInstance?.dataNascimento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nickName', 'error')} ">
	<label for="nickName">
		<g:message code="usuario.nickName.label" default="Nick Name" />
		
	</label>
	<g:textField name="nickName" value="${usuarioInstance?.nickName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${usuarioInstance?.nome}"/>
</div>

