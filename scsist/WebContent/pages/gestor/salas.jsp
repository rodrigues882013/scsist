<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.Iterator"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	if( (u != null) && (u.getNivel().toString().compareTo("GESTOR") == 0) ){
		String nome = u.getNome();
		String login = (String)u.getLogin(); 
		String sala;
%>


<!DOCTYPE html>
<html>
	<head>

		<title>Gestor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="../../scripts/ajax2.js"></script>
		<script type="text/javascript" src="../../scripts/jquery.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../scripts/jquery-ui.js"></script>
		<script type="text/javascript" src="../../scripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../scripts/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="../../scripts/jquery.reveal.js"></script>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/style.css"/>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/jquery-ui.css"/>
        <link href="../../styles/liteaccordion.css" rel="stylesheet" />
        <script src="../../scripts/jquery.min.js"></script>
        <script src="../../scripts/jquery.easing.1.3.js"></script>
        <script src="../../scripts/liteaccordion.jquery.js"></script>
        <style>
        	fieldset{
				border-radius: 10px;
				border-width: thick;
				border-style: outset;
				padding: 20px;
				width: 500px;
				background: #EFEFEF;
			}
			input[type=button]{
				color: #FFF;
    			background: rgba(2,33,46,0.91);
    			padding: 3px 13px;
    			display: inline-block;
    			font-size: 14px;
   				clear: both;
    			font-weight: bold;
    			cursor: pointer;
    			box-shadow: 10px 10px 5px #888888;
			}
			
			input[type=button]:hover{
    			text-decoration: none;
    			cursor: pointer;
    			color: #FFF;
    			background:#5b829d;
			}
			.reveal-modal {
				visibility: hidden;
				top: -80px; 
				left: 50%;
				margin-left: -200px;
				margin-top: -10%; 
				width: 800px;
				height: 400px;
				background: #eee url(../images/modal-gloss.png) no-repeat -200px -80px;
				position: absolute;
				z-index: 101;
				padding: 30px 40px 34px;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
				border-radius: 20px;
				-moz-box-shadow: 0 0 10px rgba(0,0,0,.4);
				-webkit-box-shadow: 0 0 10px rgba(0,0,0,.4);
				-box-shadow: 0 0 10px rgba(0,0,0,.4);
				border-width: thick;
				border-style: outset;
			}
        </style>
        
		<script type="text/javascript">
			var sala;
			$(document).ready(function(){
				$("#ligadoF").hide();
				$("#ligadoM").hide();
				$("#ligadoT").hide();
			});
		</script>

        <script>
            $(document).ready(function(){
                $('#js_version').liteAccordion({
                    theme : 'dark',
                    rounded : true,
                    enumerateSlides : true,
                    firstSlide : 1,
                    linkable : true,
                    easing: 'easeInOutSine'
                });
            });
        </script>
        
          <script type="text/javascript">
			$(document).ready(function(){
		
		$('a').click(function() {
        		this.blur();
        	});
		
			//Hide all item descriptions in the info box
			$("#infobox > div").css("display", "none");
		
			//Call in the info box
			$(".more a").click(function(){
				$("#infobox").animate({bottom: '233px' }, 300);
				$("#fade_bg").fadeIn();
				return false;
			});
			
			//Expand more info button on hover
			$(".more").hover(function(){
				$(this).stop().animate({width: '225px' }, 200).css({'z-index' : '10'}); //Change the width increase caption size
			}, function () {
				$(this).stop().animate({width: '50px' }, 200).css({'z-index' : '1'});
      		});
      		
      		//Show description for selected item
      		$("#couch a").click(function(){
				$("#couch_info").show();
			});
			
			$("#plant a").click(function(){
				$("#plant_info").show();
			});

      		$("#monitor a").click(function(){
				$("#monitor_info").show();
			});
			
      		$("#board a").click(function(){
				$("#board_info").show();
			});
						
			//Remove background, info box and hide all descriptions
			$("#fade_bg, .close").click(function(){
				$("#fade_bg").fadeOut();
				$("#infobox").animate({bottom: '-200px' }, 300, function() {
					$("#infobox > div").css("display", "none");
				});
				return false;
			});
		
		}); 
		</script>
	</head>

	<body>
	<div id="geral">

		<div id="corpo">	
			<div id="menuc">
					<div id="left-side">
						<img src="../../images/logo4.png">
					</div>
					<div id="right-side">
						<img src="../../images/avatar.gif" alt="user icon" />&ensp;
							<a href="#" class="first"><%=u.getNome()%></a>&ensp;
							<a href="#">Alterar dados</a>&ensp;
							<a href="../../EncerraAcesso">Sair</a> &emsp;
					</div>
			</div>
		</div>
		<div align="center">
			<div class="menu" id="menu"> 
  				<ul id="MenuBar1" class="MenuBarHorizontal">
  					<li><a href="salas.jsp" style="background-color: rgba(2,33,48,0.88); color:#FFF;">Controlar Salas</a></li>
   	  				<li><a href="demonstrativos.jsp">Demonstrativo</a></li>
      				<li><a href="gerenciaSalas.jsp">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="suporte.jsp">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br><br><br>
		
		<div id="conteudo">
			
			<br><br>
			<div class="content" style="margin-left:150px;">	
				<h2>Click na foto para ter acesso a sala</h2>
				<div id="js_version" class="accordion">
            <ol>
                <li data-slide-name="slide1">
                    <h2><span>Hibrida 1</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(1)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide2">
                    <h2><span>Hibrida 2</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(2)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide3">
                    <h2><span>Hibrida 3</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(3)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide4">
                    <h2><span>Hibrida 4</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(4)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide4">
                    <h2><span>Hibrida 5</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(5)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide5">
                    <h2><span>Sala Múltipla</span></h2>
                    <div>
                        <a href="#" onclick="escolheSala(6)" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
            </ol>
        </div>
        <script type="text/javascript">
        	function escolheSala(numSala){
        		
        		switch(numSala){
        			case 1:
        				
        				sala = numSala;
        				break;
        			case 2:
        				
        				sala = numSala;
        				break;
        			case 3:
        				
        				sala = numSala;
        				break;
        			case 4:
        				
        				sala = numSala;
        				break;
        			case 5:
        				
        				sala = numSala;
        				break;
        			case 6:
        				
        				sala = numSala;
 						break;
        		}
        	}
        </script>
        <!-- Imagem que amplia a foto, na verdade esta foto está escondida -->
        <div id="myModal" class="reveal-modal" style="background-color:#CFCFCF">
			<h2>Sala X</h2>
			<br>
			<fieldset style="border-radius: 30px; width: 200px;">
				<legend><strong>Circuito da frente</strong></legend>
				<input type="hidden" name="offF" id="offF" value='0'>
				<input type="button" id="on1" name="on1" value='OFF' style="width: 60px; height: 60px; border-radius: 50%; float: left; margin-top:3px;margin-left: 22px;">
				<input type="button" id="desligadoF" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #F00; margin-left: 30px;">
				<input type="button" id="ligadoF" name="ligado" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #0F0; margin-left: 30px;">
			</fieldset>
			
			<script type="text/javascript">
					$("#on1").click(function(){
						var estado = $("#offF").val();
						
						$.ajax({
							url : '../../AlterarEstados',
							type : 'POST',
							data : "grupo=3&sala=" + sala +"&login=" + '<%=login%>' + "&estado=" + estado,
							dataType : 'json',
							success : function(response){
								if (response == "LIGADO"){
									$("#desligadoF").hide();
									$("#ligadoF").show();
									$("#offF").val('1');
								}
								else{
									$("#ligadoF").hide();
									$("#desligadoF").show();
									$("#offF").val('0');
								}
							},
							error : function(){
									alert("erro");
								}
						});
					});
			</script>
			<fieldset style="float: left; border-radius: 30px; width: 200px; margin-left: 271px; margin-top:-134px;">
				<legend><strong>Circuito do meio</strong></legend>
				<input type="hidden" value='0' name="offM" id="offM">
				<input type="button" value="OFF" id="on2" name="on2" style="float:left;width: 60px; height: 60px; border-radius: 50%; margin-top:0px;margin-left: 22px;">
				<input type="button" id="desligadoM" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #F00; margin-left: 30px;">
				<input type="button" id="ligadoM" name="ligado" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #0F0; margin-left: 30px;">
			</fieldset>
			<script type="text/javascript">
					$("#on2").click(function(){
						
						var estado = $("#offM").val();
						$.ajax({
							url : '../../AlterarEstados',
							type : 'POST',
							data : "grupo=6&sala=" + sala +"&login=" + '<%=login%>' + "&estado=" + estado,
							dataType : 'json',
							success : function(response){
								if (response == "LIGADO"){
									$("#desligadoM").hide();
									$("#ligadoM").show();
									$("#offM").val('1');
								}
								else{
									$("#ligadoM").hide();
									$("#desligadoM").show();
									$("#offM").val('0');
								}
							},
							error : function(){
									alert("erro");
								}
						});
					});
			</script>
			
			<fieldset style="float: left; border-radius: 30px; width: 200px; margin-left: 26px; margin-top:-136px;">
				<legend><strong>Circuito da tras</strong></legend>
				<input type="hidden" value='0' name="offT" id="offT">
				<input type="button" value="OFF" id='on3' name='on3' style="float:left;width: 60px; height: 60px; border-radius: 50%; margin-top:0px;margin-left: 22px;">
				<input type="button" id="desligadoT" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #F00; margin-left: 30px;">
				<input type="button" id="ligadoT" name="ligado" value="" style="width: 60px; height: 60px; border-radius: 50%; background-color: #0F0; margin-left: 30px;">
			</fieldset>
			<script type="text/javascript">
					$("#on3").click(function(){
						var estado = $("#offT").val();
						$.ajax({
							url : '../../AlterarEstados',
							type : 'POST',
							data : "grupo=9&sala=" + sala +"&login=" + '<%=login%>' + "&estado=" + estado,
							dataType : 'json',
							success : function(response){
								if (response == "LIGADO"){
									$("#desligadoT").hide();
									$("#ligadoT").show();
									$("#offT").val('1');
								}
								else{
									$("#ligadoT").hide();
									$("#desligadoT").show();
									$("#offT").val('0');
								}
							},
							error : function(){
									alert("erro");
								}
						});
					});
			</script>
			<br><br>
			<br><br>
			
			<fieldset style="float: left; border-radius: 30px; width: 200px; margin-left: 270px; margin-top:0px;">
				<legend><strong>Demais dispositivos</strong></legend>
				<input type="button" value="Ar" style="width: 91px; height: 60px; border-radius: 30%;float:left; margin-top: 0px;margin-left: 0px;">
				<input type="button" value="Datashow" style="width: 91px; height: 60px; border-radius: 30%; margin-left: 110px; margin-top: -71px; float:left;">			</fieldset>
			
		</div>
		</div>
	</div>
</div>
			
</html>

<%
}
else{
		response.sendRedirect("../../");
}


%>