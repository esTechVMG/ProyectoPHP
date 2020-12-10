<?php //include_once("funciones_comunes.php");?>
<div id="content" style="width:900px;margin-left:auto;margin-right:auto;">
	<div id="col_izq">
<form name="formProv" action="mostrarBDrecetas.php?tipo=provincia" method="post">
		<select id="selectprov" name="selectprov" onchange="this.form.submit()" style="HEIGHT: 25px; LIST-STYLE: square;  WIDTH: 120px">
		<option value="">--Elija provincia--</option>
		<option value="HUELVA">HUELVA</option>
		<option value="SEVILLA">SEVILLA</option>
		<option value="CORDOBA">CORDOBA</option>
		<option value="JAEN">JAEN</option>
		<option value="CADIZ">CADIZ</option>
		<option value="MALAGA">MALAGA</option>
		<option value="GRANADA">GRANADA</option>
		<option value="ALMERIA">ALMERIA</option>
		</select>
</form>
<br/>
<h3> CONSULTAR POR DIETA:</h3>
<!--<div style="text-align:left;font-size:12px;margin-left:5px;">-->

<ul style="list-style:none;margin-left:10px;padding:0px;text-align:left;">
	<li><a href="mostrarBDrecetas.php?tipo=vegetariana">VEGETARIANA</a><br/></li>
	<li><a href="mostrarBDrecetas.php?tipo=vegana">VEGANA</a><br/></li>
	<li><a href="mostrarBDrecetas.php?tipo=celiacos">CELIACO</a><br/></li>
	<li><a href="mostrarBDrecetas.php?tipo=light">LIGHT</a><br/><br/></li>
</ul>

<h3> RESTAURANTES COLABORADORES:</h3>
<form name="formEsp" action="mostrarBDrecetas.php?tipo=especial" method="post">
	<select id="selectprov2" name="selectprov2" style="HEIGHT: 25px; LIST-STYLE: square;  WIDTH: 135px">
	<option value="HUELVA">HUELVA</option>
	<option value="SEVILLA">SEVILLA</option>
	<option value="CORDOBA">CORDOBA</option>
	<option value="JAEN">JAEN</option>
	<option value="CADIZ">CADIZ</option>
	<option value="MALAGA">MALAGA</option>
	<option value="GRANADA">GRANADA</option>
	<option value="ALMERIA">ALMERIA</option>
	</select><br/><br/>
	<!--onchange="this.form.submit()"-->
	<select id="selectesp" name="selectesp"  style="HEIGHT: 25px; LIST-STYLE: square;  WIDTH: 135px">
		<option value="PESCADO">PESCADO</option>
		<option value="MARISCO">MARISCO</option>
		<option value="CARNE">CARNE</option>
		<option value="ARROZ">ARROZ</option>
	</select>
<input name="enviar" id="enviar" type="submit" class="boton" value="BUSCAR!" style="font-size: 14px; font-family: Arial;">
</form><br/>
<h3> ULTIMAS 5 RECETAS!:</h3>
<ul>
	<?php include '../php/lastFive.php'?>
</ul>

</div>
