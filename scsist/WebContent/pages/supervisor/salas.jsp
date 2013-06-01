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
	</head>

	<body>
	<div id="geral">

		<div id="corpo">	
			<div id="menuc">
					<div id="right-side">
						<img src="../../images/avatar.gif" alt="user icon" />&ensp;
							<a href="#" class="first"><%=u.getNome()%></a>&ensp;
							<a href="#">Alterar dados</a>&ensp;
							<a href="#">Sair</a> &emsp;
						</div>
					</div>
		</div>
		
		<div id="conteudo">
			
			<br><br>
			<div class="content" style="margin-left:150px;">	
				<h2>Click na foto para ter acesso a sala</h2>
				<div id="js_version" class="accordion">
            <ol>
                <li data-slide-name="slide1">
                    <h2><span>Hibrida 1</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide2">
                    <h2><span>Hibrida 2</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide3">
                    <h2><span>Hibrida 3</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide4">
                    <h2><span>Hibrida 4</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide4">
                    <h2><span>Hibrida 5</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
                <li data-slide-name="slide5">
                    <h2><span>Sala Múltipla</span></h2>
                    <div>
                        <a href="#" data-reveal-id="myModal" data-animation="fade"><img src="../../images/h3_02.jpg" alt="Multipla" width="750" /></a>
                    </div>
                </li>
            </ol>
        </div>
        
        <!-- Imagem que amplia a foto, na verdade esta foto está escondida -->
        <div id="myModal" class="reveal-modal">
        	<div class="more" id="couch">
					<a href="#" class='button'><img src="../../images/off.png"/></a>
					<span>Ascendendo a luz 1</span>
			
			</div>
			<div class="more" id="plant">
					<a href="#"><img src="../../images/more.png"/></a>
					<span>Ascendendo a luz 2</span>
			</div>
				
			<img src="../../images/h3_02.jpg" width="800px" height="400px">
				
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<script type="text/javascript">
				$("#myModal #couch a").click(function(){
					var liga = "<img src='../../images/on.png'/>";
					var desliga = "<img src='../../images/off.png'/>";
					alert("acertei");	
					$.ajax({
						url : '../../TesteServlet',
						type : 'POST',
						data : 'grupo=1&id=1',
						dataType : 'json',
						success : function(response){
							if (response == "1"){
								alert("Sou 1")
								$('#myModal #couch .button').html("");
								$('#myModal #couch .button').html(liga);
							}
							else{
								alert("Sou 0")
								$('#myModal #couch .button').html("");
								$('#myModal #couch .button').html(desliga);
							}
						},
						error : function(){
								alert("erro");
							}
							
					});
				});
			
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