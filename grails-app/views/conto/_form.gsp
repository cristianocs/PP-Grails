<%@ page import="pp.grails.Conto" %>



<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="conto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${contoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'conteudo', 'error')} required">
	<label for="conteudo">
		<g:message code="conto.conteudo.label" default="Conteudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="conteudo" cols="40" rows="5" maxlength="4000" required="" value="${contoInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'nomeAutor', 'error')} ">
	<label for="nomeAutor">
		<g:message code="conto.nomeAutor.label" default="Nome Autor" />
		
	</label>
	<g:select name="nomeAutor" from="${pp.grails.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${contoInstance?.nomeAutor*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="conto.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${contoInstance?.dataCriacao}"  />
</div>

