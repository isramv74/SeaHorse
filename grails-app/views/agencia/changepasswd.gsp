

<%@ page import="com.nikko.model.Agencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agencia.label', default: 'Agencia')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${agenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${agenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${agenciaInstance?.id}" />
                <g:hiddenField name="version" value="${agenciaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="agencia.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'username', 'errors')}">
                                    ${agenciaInstance?.username}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="agencia.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="agencia.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'email', 'errors')}">
                                    ${agenciaInstance?.email}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iataCorpNo"><g:message code="agencia.iataCorpNo.label" default="Iata Corp No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agenciaInstance, field: 'iataCorpNo', 'errors')}">
                                    ${agenciaInstance?.iataCorpNo}
                                </td>
                            </tr>
                        

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updatepasswd" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><a class="cancel" href="/SeaHorse/comision">Cancelar</a></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
