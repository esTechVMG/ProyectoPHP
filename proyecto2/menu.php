<script type="text/javascript" src="js/jquery.min.js"></script>
<script type='text/javascript'>
$(document).ready(function(){
 
$("img.a").hover(
function() {
$(this).stop().animate({"opacity": "0"}, "normal");
},
function() {
$(this).stop().animate({"opacity": "1"}, "normal");
});
 
});
</script>
<div id="menu">
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="index.php"><div class="fadehover">
	<img src="imagenes/01iniciobn.png" alt="" class="a"/><img src="imagenes/01inicio.png" alt="" class="b"/>
	</div></a></div>
	
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="nuestraweb.php"><div class="fadehover">
	<img src="imagenes/02nuestrawebbn.png" alt="" class="a" />	<img src="imagenes/02nuestraweb.png" alt="" class="b" /></div></a></div>
	
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="mostrarBDrecetas.php"><div class="fadehover"><img src="imagenes/03buscarrecetasbn.png" alt="" class="a"/><img src="imagenes/03buscarrecetas.png" alt="" class="b"/></div></a></div>
	
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="enviar_receta.php"><div class="fadehover"><img src="imagenes/04enviarrecetasbn.png" alt="" class="a"/><img src="imagenes/04enviarrecetas.png" alt="" class="b"/></div></a></div>
	
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="glosario.php"><div class="fadehover"><img src="imagenes/05glosariobn.png" alt="" class="a"/><img src="imagenes/05glosario.png" alt="" class="b"/></div></a></div>
	
	<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="ayuda.php"><div class="fadehover"><img src="imagenes/06ayudabn.png" alt="" class="a"/><img src="imagenes/06ayuda.png" alt="" class="b"/>
	</div></a></div>
	<?Php
	/*
	if(isset($_SESSION['admin'])){?>
		<div style="float:left;width:125px;height: 92px;margin-right:2px;"><a id="enlace" href="areagestion.php"">
			<div class="fadehover"><img src="imagenes/07areagestionbn.png" alt="" class="a"/><img src="imagenes/07areagestion.png" alt="" class="b"/>
			</div></a>
		</div>
	<?php }*/?>
</div>