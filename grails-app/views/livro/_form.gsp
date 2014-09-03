<%@ page import="pp.grails.Livro" %>



<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="livro.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${livroInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'conteudo', 'error')} required">
	<label for="conteudo">
		<g:message code="livro.conteudo.label" default="Conteudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="conteudo" required="" value="${livroInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="livro.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${livroInstance?.dataCriacao}"  />
</div>

