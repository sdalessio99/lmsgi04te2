<?xml version="1.0" encoding='utf-8'?>
<!-- ******************************************************************************************************************
Autor: Sara D'Alessio
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2. XSLT. (60%)
Enlace autoevaluacion: https://docs.google.com/document/d/1uQzfRYKZVeqswt9VgaedkrHDL35cP650fsKpq8XUlK8/edit?usp=sharing

Hoja de estilo xsl para la pagina teatro, usando los datos de teatro.xml.
Cumple con los siguientes requisitos:
-Listado de las obras de teatro de enero de 2023 ordenadas por fecha, de la más recientes a menos. Y además, las obras 
con precio menor de 20€ se mostrarán subrayadas.
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
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
				<ul>
					<!-- Seleccion de las obras a las que aplicar la plantilla -->
                    <xsl:apply-templates select="teatro/fechahora[contains(@dia , '2023-01')]">
						<!-- Orden de los elementos usando el atributo dia en orden descendiente -->
                        <xsl:sort select="fechahora/@dia" order="descending"/>
                    </xsl:apply-templates>
				</ul>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Plantilla para las obras de teatro -->
<xsl:template match="teatro">
	<!-- uso de choose para usar la clase subrayado a las obras cuyo precio es menor de 20 euros -->
    <xsl:choose>
        <xsl:when test="precio&lt;20">
            <li class="subrayado"><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></li>
        </xsl:when>
        <xsl:otherwise>
            <li><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></li>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>
