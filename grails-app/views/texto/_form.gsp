<%@ page import="pp.grails.Texto" %>



<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="texto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${textoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'conteudo', 'error')} required">
	<label for="conteudo">
		<g:message code="texto.conteudo.label" default="Conteudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="conteudo" cols="40" rows="5" maxlength="15000" required="" value="${textoInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="texto.realName.label" default="Real Name" />
		
	</label>
	<g:select name="realName" from="${pp.grails.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${textoInstance?.realName*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="texto.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${textoInstance?.dataCriacao}"  />
</div>

