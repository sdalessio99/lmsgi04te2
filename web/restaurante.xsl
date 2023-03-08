<?xml version="1.0" encoding='utf-8'?>
<!-- ******************************************************************************************************************
Autor: Sara D'Alessio
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2. XSLT. (60%)
Enlace autoevaluacion: https://docs.google.com/document/d/1uQzfRYKZVeqswt9VgaedkrHDL35cP650fsKpq8XUlK8/edit?usp=sharing

Hoja de estilo xsl para la pagina restaurante, usando los datos de restaurante.xml.
Cumple con los siguientes requisitos:
-Mostrar nombre del restaurante y ciudad, así como todos los menús que dispone el restaurante. Conocido el nombre del 
restaurante, el resto de datos se obtendrán del XML.
-Al clicar encima del nombre del restaurante se abrirá un link a la página oficial. Su URL también se obtendrá del XML
-Se deberá guardar el nombre del restaurante en una variable. De manera que si se modifica el nombre del restaurante en 
la variable, los platos, nombre, ciudad y link también deberán modificarse de forma automática en la página
********************************************************************************************************************-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match="/reservaeventos">
<!-- copia y pega del contenido del html -->
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main>
			<!-- definicion de la variable literal con el nombre del restaurante -->
            <xsl:variable name="nombre">El clarete</xsl:variable>
			<!-- uso la variable para seleccionar que a que restaurante aplicar la plantilla -->
            <xsl:apply-templates select="restaurante[nombrerestaurante=$nombre]"/>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- plantilla para los restaurantes -->
<xsl:template match="restaurante">
	<!-- uso de etiqueta <a> para hacer que el <h1> sea un enlace externo, y lo obtengo del xml -->
    <h1><a href="{informacion/@web}"><xsl:value-of select="nombrerestaurante"/> - <xsl:value-of select="ciudad"/></a></h1>
    <!-- seleccion de menus a los que aplicar la plantilla -->
	<xsl:apply-templates select="menu"/>
</xsl:template>

<!-- plantilla para los menus -->
<xsl:template match="menu">
    <article class="restaurante">
		<h3><xsl:value-of select="@tipo"/></h3>
		<!-- uso de for-each para tener todos los platos del menu -->
		<xsl:for-each select="plato">
			<p><xsl:value-of select="."/></p>
		</xsl:for-each>
	</article>
</xsl:template>

</xsl:stylesheet>