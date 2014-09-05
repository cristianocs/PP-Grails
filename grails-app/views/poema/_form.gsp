<%@ page import="pp.grails.Poema" %>



<div class="fieldcontain ${hasErrors(bean: poemaInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="poema.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${poemaInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poemaInstance, field: 'conteudo', 'error')} required">
	<label for="conteudo">
		<g:message code="poema.conteudo.label" default="Conteudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="conteudo" cols="40" rows="5" maxlength="1500" required="" value="${poemaInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poemaInstance, field: 'realName', 'error')} ">
	<label for="realName">
		<g:message code="poema.realName.label" default="Real Name" />
		
	</label>
	<g:select name="realName" from="${pp.grails.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${poemaInstance?.realName*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poemaInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="poema.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${poemaInstance?.dataCriacao}"  />
</div>

