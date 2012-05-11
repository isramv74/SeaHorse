

<%@ page import="com.nikko.model.Comision" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comision.label', default: 'Comision')}" />
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
            <g:hasErrors bean="${comisionInstance}">
            <div class="errors">
                <g:renderErrors bean="${comisionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bookerName"><g:message code="comision.bookerName.label" default="Booker Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'bookerName', 'errors')}">
                                    <g:textField name="bookerName" value="${comisionInstance?.bookerName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source"><g:message code="comision.source.label" default="Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'source', 'errors')}">
                                    <g:textField name="source" value="${comisionInstance?.source}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="origen"><g:message code="comision.origen.label" default="Origen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'origen', 'errors')}">
                                    <g:textField name="origen" value="${comisionInstance?.origen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmationCxlNo"><g:message code="comision.confirmationCxlNo.label" default="Confirmation Cxl No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'confirmationCxlNo', 'errors')}">
                                    <g:textField name="confirmationCxlNo" value="${comisionInstance?.confirmationCxlNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crsNo"><g:message code="comision.crsNo.label" default="Crs No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'crsNo', 'errors')}">
                                    <g:textField name="crsNo" value="${comisionInstance?.crsNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notas"><g:message code="comision.notas.label" default="Notas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'notas', 'errors')}">
                                    <g:textField name="notas" value="${comisionInstance?.notas}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="comision.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${comisionInstance.constraints.status.inList}" value="${comisionInstance?.status}" valueMessagePrefix="comision.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address1"><g:message code="comision.address1.label" default="Address1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'address1', 'errors')}">
                                    <g:textField name="address1" value="${comisionInstance?.address1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address2"><g:message code="comision.address2.label" default="Address2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'address2', 'errors')}">
                                    <g:textField name="address2" value="${comisionInstance?.address2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address3"><g:message code="comision.address3.label" default="Address3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'address3', 'errors')}">
                                    <g:textField name="address3" value="${comisionInstance?.address3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address4"><g:message code="comision.address4.label" default="Address4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'address4', 'errors')}">
                                    <g:textField name="address4" value="${comisionInstance?.address4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="arrival"><g:message code="comision.arrival.label" default="Arrival" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'arrival', 'errors')}">
                                    <g:datePicker name="arrival" precision="day" value="${comisionInstance?.arrival}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bankId"><g:message code="comision.bankId.label" default="Bank Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'bankId', 'errors')}">
                                    <g:textField name="bankId" value="${fieldValue(bean: comisionInstance, field: 'bankId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="comision.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${comisionInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="commissionableRevenue"><g:message code="comision.commissionableRevenue.label" default="Commissionable Revenue" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'commissionableRevenue', 'errors')}">
                                    <g:textField name="commissionableRevenue" value="${fieldValue(bean: comisionInstance, field: 'commissionableRevenue')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="comision.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'country', 'errors')}">
                                    <g:textField name="country" value="${comisionInstance?.country}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currencyCode"><g:message code="comision.currencyCode.label" default="Currency Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'currencyCode', 'errors')}">
                                    <g:textField name="currencyCode" value="${comisionInstance?.currencyCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="departure"><g:message code="comision.departure.label" default="Departure" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'departure', 'errors')}">
                                    <g:datePicker name="departure" precision="day" value="${comisionInstance?.departure}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="facturada"><g:message code="comision.facturada.label" default="Facturada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'facturada', 'errors')}">
                                    <g:checkBox name="facturada" value="${comisionInstance?.facturada}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grossCommAmt"><g:message code="comision.grossCommAmt.label" default="Gross Comm Amt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'grossCommAmt', 'errors')}">
                                    <g:textField name="grossCommAmt" value="${fieldValue(bean: comisionInstance, field: 'grossCommAmt')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="guestFirstName"><g:message code="comision.guestFirstName.label" default="Guest First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'guestFirstName', 'errors')}">
                                    <g:textField name="guestFirstName" value="${comisionInstance?.guestFirstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="guestLastName"><g:message code="comision.guestLastName.label" default="Guest Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'guestLastName', 'errors')}">
                                    <g:textField name="guestLastName" value="${comisionInstance?.guestLastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="iataCorpNo"><g:message code="comision.iataCorpNo.label" default="Iata Corp No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'iataCorpNo', 'errors')}">
                                    <g:textField name="iataCorpNo" value="${comisionInstance?.iataCorpNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="marketCode"><g:message code="comision.marketCode.label" default="Market Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'marketCode', 'errors')}">
                                    <g:textField name="marketCode" value="${comisionInstance?.marketCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pagada"><g:message code="comision.pagada.label" default="Pagada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'pagada', 'errors')}">
                                    <g:checkBox name="pagada" value="${comisionInstance?.pagada}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="periodo"><g:message code="comision.periodo.label" default="Periodo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'periodo', 'errors')}">
                                    <g:select name="periodo.id" from="${com.nikko.model.Periodo.list()}" optionKey="id" value="${comisionInstance?.periodo?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prepaidComm"><g:message code="comision.prepaidComm.label" default="Prepaid Comm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'prepaidComm', 'errors')}">
                                    <g:textField name="prepaidComm" value="${fieldValue(bean: comisionInstance, field: 'prepaidComm')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rateAmount"><g:message code="comision.rateAmount.label" default="Rate Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'rateAmount', 'errors')}">
                                    <g:textField name="rateAmount" value="${fieldValue(bean: comisionInstance, field: 'rateAmount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rateCode"><g:message code="comision.rateCode.label" default="Rate Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'rateCode', 'errors')}">
                                    <g:textField name="rateCode" value="${comisionInstance?.rateCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="resvNameId"><g:message code="comision.resvNameId.label" default="Resv Name Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'resvNameId', 'errors')}">
                                    <g:textField name="resvNameId" value="${fieldValue(bean: comisionInstance, field: 'resvNameId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="room"><g:message code="comision.room.label" default="Room" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'room', 'errors')}">
                                    <g:textField name="room" value="${comisionInstance?.room}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="comision.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${comisionInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="taCommCode"><g:message code="comision.taCommCode.label" default="Ta Comm Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'taCommCode', 'errors')}">
                                    <g:textField name="taCommCode" value="${comisionInstance?.taCommCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="travelAgentDisplayName"><g:message code="comision.travelAgentDisplayName.label" default="Travel Agent Display Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'travelAgentDisplayName', 'errors')}">
                                    <g:textField name="travelAgentDisplayName" value="${comisionInstance?.travelAgentDisplayName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="travelAgentId"><g:message code="comision.travelAgentId.label" default="Travel Agent Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'travelAgentId', 'errors')}">
                                    <g:textField name="travelAgentId" value="${fieldValue(bean: comisionInstance, field: 'travelAgentId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="travelAgentName"><g:message code="comision.travelAgentName.label" default="Travel Agent Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'travelAgentName', 'errors')}">
                                    <g:textField name="travelAgentName" value="${comisionInstance?.travelAgentName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vatAmount"><g:message code="comision.vatAmount.label" default="Vat Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'vatAmount', 'errors')}">
                                    <g:textField name="vatAmount" value="${fieldValue(bean: comisionInstance, field: 'vatAmount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zipCode"><g:message code="comision.zipCode.label" default="Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: comisionInstance, field: 'zipCode', 'errors')}">
                                    <g:textField name="zipCode" value="${comisionInstance?.zipCode}" />
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
