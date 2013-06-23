<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>



<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	if (u != null){
		String nome = u.getNome();
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
        
		<script type="text/javascript">
			var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../../scripts/SpryMenuBarDownHover.gif", imgRight:"../../scripts/SpryMenuBarRightHover.gif"});
			setInterval ("window.status = ''",10);
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#estado").hide();
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
				<style>
			fieldset{
				border-radius: 10px;
				padding: 20px;
				background: #EFEFEF;
			}
			input{
				border:1;
				outline:0;
				color:#000;
				margin-bottom:5px;
				padding: 5px;
			}
			input[type=button]{
				color: #FFF;
    			margin-left: 10px;
    			background: rgba(2,33,46,0.91);
    			padding: 3px 13px;
    			display: inline-block;
    			font-size: 14px;
   				clear: both;
    			border-radius:5px;
    			font-weight: bold;
   				width: 102px;
                
			}
 			input[type=button]:hover{
    			text-decoration: none;
    			cursor: pointer;
    			color: #FFF;
    			background:#5b829d;
			}
			input[type=reset]{
				color: #FFF;
    			margin-left: 10px;
    			background: rgba(2,33,48,0.88);
    			padding: 3px 13px;
    			display: inline-block;
    			font-size: 14px;
   				clear: both;
    			border-radius:5px;
    			font-weight: bold;
   				width: 102px;
                
			}
 			input[type=reset]:hover{
    			text-decoration: none;
    			cursor: pointer;
    			color: #FFF;
    			background:#5b829d;
			}
			input[type=text]{
    			color: #000;
    			length: 15pt;
    			width: 500px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: left;
    			
			}
			input[type=password]{
    			color: #000;
    			length: 15pt;
    			width: 200px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: left;
    			
			}
			input[type=submit]{
				color: #FFF;
    			margin-left: 10px;
    			background: rgba(2,33,48,0.88);
    			padding: 3px 13px;
    			display: inline-block;
    			font-size: 14px;
    			clear: both;
    			border-radius:5px;
    			font-weight: bold;
    			width: 102px;
                }
 			input[type=submit]:hover{
    			text-decoration: none;
    			cursor: pointer;
    			color: #FFF;
    			background:#5b829d;
			}
			textarea{
				padding: 4px;
			}
			input[type=email]{
    			color: #000;
    			length: 15pt;
    			width: 250px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: left;
    			
			}
		
		</style>
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
							<a href="#" class="first"><%=u.getNome()%></a>&ensp
							<a href="../../EncerraAcesso">Sair</a> &emsp;
					</div>
			</div>
		</div>
		
 		<br>
 		
		<div id="conteudo">
			<br><br>
			<div class="content" style="margin-left:39%; margin-top: -64px; ">	
				<form method="post" action="../../CadastraUsuario" name="form2" id="form2">
					<fieldset>
						<legend><h2>Formulário de Contato</h2></legend>
						<input type="hidden" name="nome" id="nome" value="<%=u.getNome() %>">
						<label>Email</label><br>
						<input type="email" name="email" id="email"><br><br>
						<label>Problema relatado: </label><br>
						<textarea rows="6" cols="70" placeholder="Relate seu problema aqui" id="msg" name="msg"></textarea>
						<br><br><br>
						<input type="hidden" value='<%u.getLogin();%>' name="login">
						<input type="button" value="Enviar" id="btnEnviar">
						<input type="reset" value="Limpar">
						<input type="button" value="Voltar" onClick="location.href='salas.jsp'">
						
					</fieldset>
				</form>	
				<script type="text/javascript">
					$("#btnEnviar").click(function(){
						$.ajax({
							url : '../../ContatoSuporte',
							type : 'POST',
							data : "email=" + $("#msg").val() + "&email=" + $("#email").val() + "&nome=" + '<%=u.getNome()%>',
							dataType : 'json',
							success : function(response){
								alert(response);
								$("#email").val(" ");
								$("#msg").val(" ");
							}
						});
					})
				</script>
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