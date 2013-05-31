<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
	<head>

		<title>Supervisor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="../../scripts/ajax2.js"></script>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/style.css"/>
		<script type="text/javascript" src="../../scripts/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="../../scripts/jquery.reveal.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('.content .rooms a').click(function() {
        			this.blur();
        			alert("Aqui"); //Aqui deverá entrar uma chamada AJAX pro servlet que atualizará  os estados.
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
 
		<div id="conteudo">
			<div class="boxUser">
					Ola user Seja bem vindo
					<br>
					<a href="../index.html">SAIR</a>
				</div>
			<div class="content">
				<div class="rooms">
					<div class="room1" >
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
			
					<div class="room2">
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
			
					<div class="room3">
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
					<br><br><br><br><br><br><br>
					<div class="room4">
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
			
					<div class="room5">
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
			
					<div class="room6">
						<a href='#' data-reveal-id="myModal" data-animation="fade"><img src="../../images/door.png" width="100px" height="150px"></a>
					</div>
				</div>			
				<div id="myModal" class="reveal-modal">
					<div class="more" id="couch">
						<div class="frente"><a href="#"><img src="../../images/off.png"/></a></div>
						<span>Ascendendo a luz 1</span>
			
					</div>
					
					<script type="text/javascript">
					
						$("#myModal .more .frente a").click(function(){
							$.ajax({
								url : "../../TesteServlet",
								data : "id=1&grupo=1",
								type : "POST",
								dataType : "json",
								success: function(json){
										alert(json);
										if (json == "1"){
											$("#myModal .more .frente a").html("");
											$("#myModal .more .frente a").html("<img src='../../images/on.png'/>");
										}
										else{
											$("#myModal .more .frente a").html("");
											$("#myModal .more .frente a").html("<img src='../../images/off.png'/>");
										}
								}, 
								error : function(){
									alert("Erro");
								}
								
							});
						});
					</script>
		
					<div class="more" id="plant">
						<div class="meio"><a href="#"><img src="../../images/more.png"/></a></div>
						<span>Ascendendo a luz 2</span>
					</div>
					<script type="text/javascript">
					
						$("#myModal .more .meio a").click(function(){
							$.ajax({
								url : "../../TesteServlet",
								data : "id=1&grupo=1",
								type : "POST",
								dataType : "json",
								success: function(json){
										alert(json);
										if (json == "1"){
											$("#myModal .more .meio a").html("");
											$("#myModal .more .meio a").html("<img src='../../images/on.png'/>");
										}
										else{
											$("#myModal .more .meio a").html("");
											$("#myModal .more .meio a").html("<img src='../../images/off.png'/>");
										}
								}, 
								error : function(){
									alert("Erro");
								}
								
							});
						});
					</script>
							
				
					<img src="../../images/h3_02.jpg" width="800px" height="400px">
				
					<a class="close-reveal-modal">&#215;</a>
				</div>
			</div>  

		</div>         
	</div>
	</body>
</html>
