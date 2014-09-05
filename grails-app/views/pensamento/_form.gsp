<%@ page import="pp.grails.Pensamento" %>



<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="pensamento.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${pensamentoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'conteudo', 'error')} required">
	<label for="conteudo">
		<g:message code="pensamento.conteudo.label" default="Conteudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="conteudo" maxlength="150" required="" value="${pensamentoInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="pensamento.realName.label" default="Real Name" />
		
	</label>
	<g:select name="realName" from="${pp.grails.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${pensamentoInstance?.realName*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="pensamento.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${pensamentoInstance?.dataCriacao}"  />
</div>

