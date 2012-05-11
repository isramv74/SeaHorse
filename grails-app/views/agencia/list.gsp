
<%@ page import="com.nikko.model.Agencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agencia.label', default: 'Agencia')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'agencia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'agencia.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'agencia.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="iataCorpNo" title="${message(code: 'agencia.iataCorpNo.label', default: 'Iata Corp No')}" />

                            <g:sortableColumn property="saludo" title="${message(code: 'agencia.saludo.label', default: 'Saludo avisos')}" />
                            <g:sortableColumn property="nombreCompleto" title="${message(code: 'agencia.nombreCompleto.label', default: 'Nombre Contacto')}" />
                            <g:sortableColumn property="nombreAgencia" title="${message(code: 'agencia.nombreAgencia.label', default: 'Nombre Agencia')}" />
                        
                            <g:sortableColumn property="accountExpired" title="${message(code: 'agencia.accountExpired.label', default: 'Account Expired')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${agenciaInstanceList}" status="i" var="agenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${agenciaInstance.id}">${fieldValue(bean: agenciaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: agenciaInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: agenciaInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: agenciaInstance, field: "iataCorpNo")}</td>

                          <td>${fieldValue(bean: agenciaInstance, field: "saludo")}</td>
                             <td>${fieldValue(bean: agenciaInstance, field: "nombreCompleto")}</td>
                             <td>${fieldValue(bean: agenciaInstance, field: "nombreAgencia")}</td>
                        
                            <td><g:formatBoolean boolean="${agenciaInstance.accountExpired}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${agenciaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
