<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>



<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	if (u != null){
%>


<!DOCTYPE html>
<html>
	<head>

		<title>Gestor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script language="javascript" src="../../scripts/ajax2.js"></script>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/style.css"/>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/jquery-ui.css"/>
		<script language="JavaScript" src="../../scripts/jquery.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../scripts/jquery-ui.js"></script>
		<script type="text/javascript" src="../../scripts/jquery-1.9.1.js"></script>
		<script language="JavaScript" src="../../scripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
			var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../../scripts/SpryMenuBarDownHover.gif", imgRight:"../../scripts/SpryMenuBarRightHover.gif"});
			setInterval ("window.status = ''",10);
		</script>
		<style>
			input[type=date]{
    			color: #000;
    			length: 15pt;
    			width: 150px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: center;
    			
			}
			input[type=text]{
    			color: #000;
    			length: 15pt;
    			width: 80px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: center;
    			
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
            select{
            	color: #000;
    			length: 15pt;
    			width: 150px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: left;
            }
            input[type=submit]:hover{
    			text-decoration: none;
    			cursor: pointer;
    			color: #FFF;
    			background:#5b829d;
			}
			
			fieldset{
				border-radius: 10px;
				padding: 20px;
				background: #EFEFEF;
				
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
							<a href="#" class="first"><%=u.getNome()%></a>&ensp;
							<a href="#">Alterar dados</a>&ensp;
							<a href="../../EncerraAcesso">Sair</a> &emsp;
					</div>
			</div>
		</div>
		<div align="center">
			<div class="menu" id="menu"> 
  				<ul id="MenuBar1" class="MenuBarHorizontal">
   	  				<li><a href="salas.jsp">Controlar Salas</a></li>
   	  				<li><a href="#" style="background-color: rgba(2,33,48,0.88); color:#FFF;">Demonstrativo</a></li>
      				<li><a href="">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br>
 		
 		<br><br><br>
		<div id="conteudo">
			<div class="content" style="margin-left:30%; margin-top: -64px; width:800px;">	
			<br><br>
			<fieldset>
			Gestor seja bem vindo, nessa área voce pode determinar qual tipo de relatório deseja gerar, escolha abaixo o tipo de relatorio que deseja gerar.
						<br>
						<br>
						<select id="list">
  							<option value="1">Por sala</option>
  							<option value="2">Por período</option>
  							<option value="3">Controle de Sala</option>
  							<option value="4">Comparativo por período</option>
						</select>
						<div id="form1" >
							<br>
							
							Salas
							<form action="../../GeraDemonstrativo" method="post">
							<input type='hidden' value='1' id='demo' name='demo'>
								<select id="salas">
								<%for (int i=1; i<=7; i++){ %>
  									<option value="<%=i%>">Sala <%=i%></option>
  								<%} %>
								</select>
								<br>
								<br>
								<input type="submit" value="Gerar">
							</form>
						</div>
						<script type="text/javascript">
							$('select').change(function(){
								var aux = $('#list').val();
								$('#form1').append(" ");
								switch(aux){
									case '1':
										$('#form1').html(" ");
										$('#form1').html("<br>Salas<form action='' method='post'><select id='salas'><%for (int i=1; i<=7; i++){ %><option value='<%=i%>'>Sala <%=i%></option><%} %></select><br><br><input type='submit' value='Gerar'></form>");
										break;
										
									case '2':
										$('#form1').html(" ");
										$('#form1').html("<br><form action='' method='post'>Tempo Inicial:&nbsp;&nbsp;<input type='date'><br><br>Tempo Final:&nbsp;&nbsp;<input type='date'><br><br>Numero da Sala: <input type='text' name='numSala'><br><br><input type='submit' value='Gerar'></form>");
										break;
										
									case '3':
										$('#form1').html(" ");
										$('#form1').html("<br><form action='' method='post'>Data:&nbsp;&nbsp;<input type='date'><br><br>Numero da Sala: <input type='text' name='numSala'><br><br><input type='submit' value='Gerar'></form>");
										break;
										
									case '4':
										$('#form1').html(" ");
										$('#form1').html("4");
										break;
								}
							});
							
							  $(function() {
							    $("#datepicker").datepicker();
							  });
							
						</script>
				</fieldset>
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