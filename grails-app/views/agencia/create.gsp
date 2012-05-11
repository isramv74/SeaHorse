

<%@ page import="com.nikko.model.Agencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agencia.label', default: 'Agencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${agenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${agenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="agencia.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${agenciaInstance?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="agencia.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${agenciaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="iataCorpNo"><g:message code="agencia.iataCorpNo.label" default="Iata Corp No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'iataCorpNo', 'errors')}">
                                    <g:textField name="iataCorpNo" value="${agenciaInstance?.iataCorpNo}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="saludo"><g:message code="agencia.saludo.label" default="Saludo avisos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'saludo', 'errors')}">
                                    <g:textField name="saludo" value="${agenciaInstance?.saludo}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombreCompleto"><g:message code="agencia.nombreCompleto.label" default="Nombre Contacto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'nombreCompleto', 'errors')}">
                                    <g:textField name="nombreCompleto" value="${agenciaInstance?.nombreCompleto}" />
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombreAgencia"><g:message code="agencia.nombreAgencia.label" default="Nombre Agencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'nombreAgencia', 'errors')}">
                                    <g:textField name="nombreAgencia" value="${agenciaInstance?.nombreAgencia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountExpired"><g:message code="agencia.accountExpired.label" default="Account Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${agenciaInstance?.accountExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountLocked"><g:message code="agencia.accountLocked.label" default="Account Locked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${agenciaInstance?.accountLocked}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="agencia.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${agenciaInstance?.enabled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordExpired"><g:message code="agencia.passwordExpired.label" default="Password Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${agenciaInstance?.passwordExpired}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
