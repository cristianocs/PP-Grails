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

<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'nomeAutor', 'error')} ">
	<label for="nomeAutor">
		<g:message code="pensamento.nomeAutor.label" default="Nome Autor" />
		
	</label>
	<g:select name="nomeAutor" from="${pp.grails.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${pensamentoInstance?.nomeAutor*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pensamentoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="pensamento.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${pensamentoInstance?.dataCriacao}"  />
</div>

