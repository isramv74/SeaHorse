
<%@ page import="com.nikko.model.Comision" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comision.label', default: 'Comision')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.bookerName.label" default="Booker Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "bookerName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.source.label" default="Source" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "source")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.origen.label" default="Origen" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "origen")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.confirmationCxlNo.label" default="Confirmation Cxl No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "confirmationCxlNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.crsNo.label" default="Crs No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "crsNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.notas.label" default="Notas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "notas")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.address1.label" default="Address1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "address1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.address2.label" default="Address2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "address2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.address3.label" default="Address3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "address3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.address4.label" default="Address4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "address4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.arrival.label" default="Arrival" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${comisionInstance?.arrival}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.bankId.label" default="Bank Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "bankId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.commissionableRevenue.label" default="Commissionable Revenue" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.commissionableRevenue}" format="###,##0.00" locale="es_MX" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.commissionableRevenueNew.label" default="Commissionable Revenue New" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.commissionableRevenueNew}" format="###,##0.00" locale="es_MX" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "country")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.currencyCode.label" default="Currency Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "currencyCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.departure.label" default="Departure" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${comisionInstance?.departure}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.facturada.label" default="Facturada" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${comisionInstance?.facturada}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.grossCommAmt.label" default="Gross Comm Amt" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.grossCommAmt}" format="###,##0.00" locale="es_MX" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.grossCommAmtNew.label" default="Gross Comm Amt New" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.grossCommAmtNew}" format="###,##0.00" locale="es_MX" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.guestFirstName.label" default="Guest First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "guestFirstName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.guestLastName.label" default="Guest Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "guestLastName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.iataCorpNo.label" default="Iata Corp No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "iataCorpNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.marketCode.label" default="Market Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "marketCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.pagada.label" default="Pagada" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${comisionInstance?.pagada}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.periodo.label" default="Periodo" /></td>
                            
                            <td valign="top" class="value">${comisionInstance?.periodo?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.prepaidComm.label" default="Prepaid Comm" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.prepaidComm}" format="###,##0.00" locale="es_MX" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.rateAmount.label" default="Rate Amount" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.rateAmount}" format="###,##0.00" locale="es_MX" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.rateAmountNew.label" default="Rate Amount New" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.rateAmountNew}" format="###,##0.00" locale="es_MX" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.rateCode.label" default="Rate Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "rateCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.resvNameId.label" default="Resv Name Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "resvNameId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.room.label" default="Room" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "room")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "state")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.taCommCode.label" default="Ta Comm Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "taCommCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.travelAgentDisplayName.label" default="Travel Agent Display Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "travelAgentDisplayName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.travelAgentId.label" default="Travel Agent Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "travelAgentId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.travelAgentName.label" default="Travel Agent Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "travelAgentName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.vatAmount.label" default="Vat Amount" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.vatAmount}" format="###,##0.00" locale="es_MX" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.vatAmountNew.label" default="Vat Amount New" /></td>

                            <td valign="top" class="value"><g:formatNumber number="${comisionInstance.vatAmountNew}" format="###,##0.00" locale="es_MX" /></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comision.zipCode.label" default="Zip Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: comisionInstance, field: "zipCode")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
          <sec:ifAllGranted roles="ROLE_ADMIN">
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${comisionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
          </sec:ifAllGranted>
        </div>
    </body>
</html>
