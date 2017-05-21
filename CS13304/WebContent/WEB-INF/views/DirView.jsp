<jsp: include p�gina = "../includes/TagLibs.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%-- 2(a). Importa los CSS y JS de Twitter Bootstrap --%>
	<jsp: include p�gina = "../includes/Bootstrap.jsp" />
	<title>Directorios de ${path}</title>
</head>
<body>
	<div class="container">
		<h2>Administrador de Archivos</h2>
		<%-- 
			 6(a)Si el tama�o de la variable path
			 es menor que uno, 
			 no se encontraron elementos 
		--%>
		<c:if test="${ path < 1}">
			<br>
			<div class="alert alert-info">
			No se encontraron elementos en la
				b�squeda</div>
		</c:if>
		<%-- Si el tama�o es mayor a 0, hay al menos un elemento --%>
		<c:if test="${fn:length(requestScope.paths) gt 0}">
			<p>Listando contenidos de <b>${path }</b> con
			   <b>${fn:length(requestScope.paths)}</b> elementos.</p>
			   
			 <%-- Inicia la creaci�n de la tabla --%>
			<table class="table table-striped">
				<tr>
					<th>Nombre</th>
					<th>Path</th>
					<th>Tama�o (B)</th>
				</tr>
				<%--
					6(b)Se obtiene cada uno de los atributos
					 y se genera el URI para descargar el
					 archivo
				 --%>
				<c:forEach var="element" begin="0" end="${param.n}">
					<tr>
						<td><a href="Download.do?archivo=${element}"><%--nombre de archivo --%></a></td>
						<td><%--path --%></td>
						<td><%--tama�o --%>/td>

					</tr>
				</c:forEach>
			</table>
		</c:if>
		<%-- Form para volver a buscar --%>
        <form action ="Admin.do">            
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Volver
                </button>
       </form>
	</div>
</body>
</html>