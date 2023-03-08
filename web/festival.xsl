<?xml version="1.0" encoding='utf-8'?>
<!-- ******************************************************************************************************************
Autor: Sara D'Alessio
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2. XSLT. (60%)
Enlace autoevaluacion: https://docs.google.com/document/d/1uQzfRYKZVeqswt9VgaedkrHDL35cP650fsKpq8XUlK8/edit?usp=sharing

Hoja de estilo xsl para la pagina restaurante, usando los datos de restaurante.xml.
Cumple con los siguientes requisitos:
-Concierto por tipo de música: Mostrar el nombre de festival, nombre de grupo de música(concierto), fecha, hora y lugar 
de todos los conciertos de "rock" que existan.
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
		
		<section class="festival">
			<h1>Festivales de rock</h1>
			<table>
				<tr>
					<th>FESTIVAL</th>
					<th>CONCIERTO</th>
					<th>FECHA</th>
					<th>HORA</th>
					<th>LUGAR</th>
				</tr>
                <!-- seleccion de los conciertos a los que se va a aplicar la plantilla, y filtrando usando el 
                atributo tipomusica para seleccionar unicamente los conciertos rock -->
                <xsl:apply-templates select="festival/conciertos/concierto[grupo/@tipomusica='rock']"/>
			</table>			
		</section>
		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- plantilla para los conciertos -->
<xsl:template match="concierto">
    <tr>
        <td><xsl:value-of select="../../nombrefesti"/></td>
        <td><xsl:value-of select="grupo"/></td>
        <td><xsl:value-of select="fecha"/></td>
        <td><xsl:value-of select="hora"/></td>
        <td><xsl:value-of select="../../lugar"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>