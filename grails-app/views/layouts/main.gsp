<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery-ui-1.8.4.custom.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'fancybox/jquery.fancybox-1.3.1.css')}" media="screen"/>
		
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

        <g:javascript library="application" />
        <g:javascript src='lib/jquery-1.4.2.min.js'/>
        <g:javascript src='lib/jquery.blockUI.js'/>



		<g:javascript src='lib/jquery-ui-1.8.4.custom.min.js'/>
        <g:javascript src='lib/jquery.mousewheel-3.0.2.pack.js'/>
        <g:javascript src='lib/jquery.fancybox-1.3.1.js'/>

        <g:layoutHead />
    </head>
    <body>
	
	

	
	
	
	
	
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href=""><img src="${resource(dir:'images',file:'LogoNikko.png')}" alt="Hotel Nikko Mexico" border="0" /></a></div>




		<script type="text/javascript">
			$(function() {
				$("button, input:submit, a", ".menubar").button();

				//$("a", ".demo").click(function() { return false; });
			});
			</script>
			<style>

			</style>

        <div class="menubar">
        <sec:ifAllGranted roles="ROLE_USER">

			<a href="/SeaHorse/comision">Comisiones</a>
        </sec:ifAllGranted>

        <sec:ifAllGranted roles="ROLE_ADMIN">

			<a href="/SeaHorse/agencia">Administrar Agencias</a>
			<a href="/SeaHorse/comision/importar">Importar</a>
            <a href="/SeaHorse/comision/pagar">Marcar como Pagadas todas</a>
            <a href="/SeaHorse/comision/facturar">Marcar como Facturadas todas</a>
            <a href="/SeaHorse/comision/procesar">Procesar</a>
            <!--a href="/SeaHorse/comision/eliminarImportadas" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'All imported commission from current period are going to be deleted, Are you sure?')}');">Eliminar</a-->

        </sec:ifAllGranted>


        <sec:ifLoggedIn>

          (<sec:username />) <g:link controller="logout">Salir</g:link>
          <g:link controller="agencia" action="changepasswd">Password</g:link>

        </sec:ifLoggedIn>
		</div>

        <g:layoutBody />
    </body>
</html>