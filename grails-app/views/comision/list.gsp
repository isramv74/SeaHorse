
<%@ page import="com.nikko.model.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comision.label', default: 'Comision')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>


      <script type="text/javascript">
          $(document).ready(function() {
              /*
              *   Examples - images
              */

              $("a#example1").fancybox({
                  'titleShow'		: false
              });

              $("a#example2").fancybox({
                  'titleShow'		: false,
                  'transitionIn'	: 'elastic',
                  'transitionOut'	: 'elastic'
              });

              $("a#example3").fancybox({
                  'titleShow'		: false,
                  'transitionIn'	: 'none',
                  'transitionOut'	: 'none'
              });

              $("a#example4").fancybox();

              $("a#example5").fancybox({
                  'titlePosition'	: 'inside'
              });

              $("a#example6").fancybox({
                  'titlePosition'	: 'over'
              });

              $("a[rel=example_group]").fancybox({
                  'transitionIn'		: 'none',
                  'transitionOut'		: 'none',
                  'titlePosition' 	: 'over',
                  'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
                      return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                  }
              });

              /*
              *   Examples - various
              */

              $("#various1").fancybox({
                  'titlePosition'		: 'inside',
                  'transitionIn'		: 'none',
                  'transitionOut'		: 'none'
              });

              $("#various2").fancybox();

              $("#various3").fancybox({
                  'width'				: '75%',
                  'height'			: '75%',
                  'autoScale'			: false,
                  'transitionIn'		: 'none',
                  'transitionOut'		: 'none',
                  'type'				: 'iframe'
              });

              $("#various4").fancybox({
                  'padding'			: 0,
                  'autoScale'			: false,
                  'transitionIn'		: 'none',
                  'transitionOut'		: 'none'
              });

              $("#various5").fancybox({
                  'width'				: '75%',
                  'height'			: '75%',
                  'autoScale'			: false,
                  'transitionIn'		: 'none',
                  'transitionOut'		: 'none',
                  'type'				: 'iframe'
              });




          });
      </script>





    </head>
    <body>
        <div class="nav">
            <!--span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span-->
            <g:form method="post" >
              Periodo: <g:select name="periodo"
                from="${Periodo.listOrderByFechaImportacion(order:'desc')}"
                value="${periodo?.id}"
                optionKey="id" />

              <p>Pagada: <g:radioGroup name="pagada" labels="['Si','No','Ambas']" values="[true,false,null]" value="${params.pagada}">
              ${it.label} ${it.radio}
              </g:radioGroup></p>

              <p>Estatus: <g:radioGroup name="status" labels="['Procesada','Importada','Ambas']" values="['PROCESADA','IMPORTADA',null]" value="${params.status}" >
              ${it.label} ${it.radio}
              </g:radioGroup></p>

              <p>IATA: <g:textField name="iata"  value="${params.iata}"/></p>

              <p>Nacionales: <g:radioGroup name="nacionales" labels="['Si','No','Todas']" values="[true,false,null]" value="${params.nacionales}">
              ${it.label} ${it.radio}
              </g:radioGroup></p>

              <p>Corte: <g:radioGroup name="corte" labels="['Si','No']" values="[true,false]" value="${params.corte}">
              ${it.label} ${it.radio}
              </g:radioGroup></p>


                <span class="button"><g:actionSubmit class="search" action="list" value="${message(code: 'default.button.search.label', default: 'Buscar')}" /></span>

                <span class="menuButton"><button class="reset" type="reset" >Limpiar Filtro</button> </span>

            </g:form>



            <sec:ifAllGranted roles="ROLE_ADMIN">
              <!--span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span-->
            </sec:ifAllGranted>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'comision.id.label', default: 'Id')}" />

                            <sec:ifAllGranted roles="ROLE_ADMIN">
                              <g:sortableColumn property="travelAgentName" title="${message(code: 'comision.travelAgentName.label', default: 'Agencia')}" />
                              <g:sortableColumn property="iataCorpNo" title="${message(code: 'comision.iataCorpNo.label', default: 'Iata')}" />
                            </sec:ifAllGranted>
                        
                            <g:sortableColumn property="guestLastName" title="${message(code: 'comision.guestLastName.label', default: 'Huesped')}" />
                        
                            <g:sortableColumn property="arrival" title="${message(code: 'comision.arrival.label', default: 'Llegada')}" />
                        
                            <g:sortableColumn property="departure" title="${message(code: 'comision.departure.label', default: 'Salida')}" />
                        
                           <th><g:message code="comision.nights.label" default= 'Noches'/></th>
                        
                            <g:sortableColumn property="rateAmount" title="${message(code: 'comision.rateAmount.label', default: 'Tarifa')}" />

                            <g:sortableColumn property="commissionableRevenue" title="${message(code: 'comision.commissionableRevenue.label', default: 'Monto Comisionable')}" />


                            <g:sortableColumn property="grossCommAmt" title="${message(code: 'comision.grossCommAmt.label', default: 'Comision Neta')}" />
                            <g:sortableColumn property="vatAmount" title="${message(code: 'comision.vatAmount.label', default: 'Impuesto Comision')}" />

                            <th><g:message code="comision.commAmt.label" default= 'Comision'/></th>

                            <g:sortableColumn property="pagada" title="${message(code: 'comision.pagada.label', default: 'Pagada')}" />
                            <g:sortableColumn property="facturada" title="${message(code: 'comision.facturada.label', default: 'Facturada')}" />

                            <g:sortableColumn property="currencyCode" title="${message(code: 'comision.currencyCode.label', default: 'Moneda')}" />

                            <g:sortableColumn property="status" title="${message(code: 'comision.status.label', default: 'Estatus')}" />

                            <th></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${comisionInstanceList}" status="i" var="comisionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >
                        
                            <td><g:link action="show" id="${comisionInstance.id}">${fieldValue(bean: comisionInstance, field: "id")}</g:link></td>

                            <sec:ifAllGranted roles="ROLE_ADMIN">
                              <td>${fieldValue(bean: comisionInstance, field: "travelAgentName")}</td>
                              <td>${fieldValue(bean: comisionInstance, field: "iataCorpNo")}</td>
                            </sec:ifAllGranted>
                        
                            <td>${fieldValue(bean: comisionInstance, field: "guestLastName")}, ${fieldValue(bean: comisionInstance, field: "guestFirstName")}</td>
                        
                            <td>${comisionInstance.arrival.format('yyyy-MM-dd')}</td>
                        
                            <td>${comisionInstance.departure.format('yyyy-MM-dd')}</td>
                        
                            <td class="number">${fieldValue(bean: comisionInstance, field: "nights")}</td>
                        

                            <g:if test="${comisionInstance.rateAmountNew == null}">
                              <td class="number"><g:formatNumber number="${comisionInstance.rateAmount}" format="###,##0.00" locale="es_MX" /></td>
                            </g:if>
                            <g:if test="${comisionInstance.rateAmountNew != null}">
                              <td class="number"><g:formatNumber number="${comisionInstance.rateAmountNew}" format="###,##0.00" locale="es_MX" /></td>
                            </g:if>

                            <g:if test="${comisionInstance.commissionableRevenueNew == null}">
                            <td class="number"><g:formatNumber number="${comisionInstance.commissionableRevenue}" format="###,##0.00" locale="es_MX"/></td>
                            </g:if>
                            <g:if test="${comisionInstance.commissionableRevenueNew != null}">
                            <td class="number"><g:formatNumber number="${comisionInstance.commissionableRevenueNew}" format="###,##0.00" locale="es_MX"/></td>
                            </g:if>

                          <g:if test="${comisionInstance.grossCommAmtNew == null}">
                            <td class="number"><g:formatNumber number="${comisionInstance.grossCommAmt}" format="###,##0.00" locale="es_MX"/></td>
                          </g:if>
                          <g:if test="${comisionInstance.grossCommAmtNew != null}">
                            <td class="number"><g:formatNumber number="${comisionInstance.grossCommAmtNew}" format="###,##0.00" locale="es_MX"/></td>
                          </g:if>

                            <g:if test="${comisionInstance.vatAmountNew == null}">
                              <td class="number"><g:formatNumber number="${comisionInstance.vatAmount}" format="###,##0.00" locale="es_MX"/></td>
                            </g:if>
                            <g:if test="${comisionInstance.vatAmountNew != null}">
                              <td class="number"><g:formatNumber number="${comisionInstance.vatAmountNew}" format="###,##0.00" locale="es_MX"/></td>
                            </g:if>

                            <td class="number"><g:formatNumber number="${comisionInstance.commAmt}" format="###,##0.00" locale="es_MX"/></td>

                            <td><g:formatBoolean boolean="${comisionInstance.pagada}" /></td>
                            <td><g:formatBoolean boolean="${comisionInstance.facturada}" /></td>

                            <td>${fieldValue(bean: comisionInstance, field: "currencyCode")}</td>

                            <td>${fieldValue(bean: comisionInstance, field: "status")}</td>

                            <td><g:link class="show" action="show" id="${comisionInstance.id}">Mostrar</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${comisionInstanceList.totalCount}" params="[periodo:periodo?.id]"/>
            </div>




<sec:ifAllGranted roles="ROLE_ADMIN">
<g:form controller="comision">
  <g:hiddenField name="periodo" value="${params.periodo}" />
  <g:hiddenField name="pagada" value="${params.pagada}" />
  <g:hiddenField name="status" value="${params.status}" />
  <g:hiddenField name="iata" value="${params.iata}" />
  <g:hiddenField name="nacionales" value="${params.nacionales}" />
  <g:actionSubmit value="Fodor" action="csv"/>
  
</g:form>
</sec:ifAllGranted>

<g:jasperReport controller="comision" action="report" jasper="Comisiones" format="PDF" name="Reporte">
	<g:hiddenField name="periodo" value="${params.periodo}" />
  <g:hiddenField name="pagada" value="${params.pagada}" />
  <g:hiddenField name="status" value="${params.status}" />
  <g:hiddenField name="iata" value="${params.iata}" />
  <g:hiddenField name="nacionales" value="${params.nacionales}" />
</g:jasperReport>

        </div>

    </body>
</html>
