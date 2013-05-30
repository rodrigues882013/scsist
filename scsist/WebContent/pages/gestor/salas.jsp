<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>


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
				$("#login").hide();
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
					<strong>Sistema de Controle das Salas do IST-Rio/FAETERJ</strong>
			</div>
		</div>
		<div align="center">
			<div class="menu" id="menu"> 
  				<ul id="MenuBar1" class="MenuBarHorizontal">
   	  				<li><a href="demonstrativos.jsp" >Demonstrativo</a></li>
      				<li><a href="">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br>
 		<div style="margin-left:180px;"><h1>Gerenciamento de salas</h1></div>
 		<div id="login">
 			Ola <%=nome%>
 		</div>
 		<div id="loginAba">
 			
 		</div>
 		<script type="text/javascript">
 			
 			$("#loginAba").mouseover(function(){
 				$(this).hide();
 				$("#login").show("slow");
 			});
 		</script>
		<div id="conteudo">
			<br><br>
			<div class="content" style="margin-left:150px;">	
				<div id="js_version" class="accordion">
            <ol>
                <li data-slide-name="slide1">
                    <h2><span>Sala1 1</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/1.jpg" alt="Slide One" /></a>
                    </div>
                </li>
                <li data-slide-name="slide2">
                    <h2><span>Salas 2</span></h2>
                    <div>
                        <img src="../../images/2.jpg" alt="Slide Two" />
                    </div>
                </li>
                <li data-slide-name="slide3">
                    <h2><span>Sala 3</span></h2>
                    <div>
                        <img src="../../images/3.jpg" alt="Slide Three" />
                    </div>
                </li>
                <li data-slide-name="slide4">
                    <h2><span>Sala 4</span></h2>
                    <div>
                        <img src="../../images/4.jpg" width="768" alt="Slide Four" />
                    </div>
                </li>
                <li data-slide-name="slide5">
                    <h2><span>Slide Múltipla</span></h2>
                    <div>
                        <img src="../../images/5.jpg" alt="Slide Five" />
                    </div>
                </li>
            </ol>
            <noscript>
                <p>Please enable JavaScript to get the full experience.</p>
            </noscript>
        </div>
        
        <!-- Imagem que amplia a foto, na verdade esta foto está escondida -->
        <div id="myModal" class="reveal-modal">
        	<div class="more" id="couch">
						<a href="#"><img src="../../images/more.png"/></a>
						<span>Ascendendo a luz 1</span>
			
					</div>
		
					<div class="more" id="plant">
						<a href="#"><img src="../../images/more.png"/></a>
						<span>Ascendendo a luz 2</span>
					</div>
				
			<img src="../../images/h3_02.jpg" width="800px" height="400px">
				
			<a class="close-reveal-modal">&#215;</a>
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