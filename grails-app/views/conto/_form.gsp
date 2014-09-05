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

<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="conto.realName.label" default="Real Name" />
		
	</label>
	<g:select name="realName" from="${pp.grails.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${contoInstance?.realName*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="conto.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${contoInstance?.dataCriacao}"  />
</div>

