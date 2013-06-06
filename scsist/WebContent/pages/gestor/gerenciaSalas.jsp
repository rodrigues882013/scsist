<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Sala"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	ArrayList<Sala> us = (ArrayList<Sala>) session.getAttribute("salas");
	if (u != null){
%>


<!DOCTYPE html>
<html>
	<head>

		<title>Gestor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="../../scripts/ajax2.js"></script>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/style.css"/>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/jquery-ui.css"/>
		<script type="text/javascript" src="../../scripts/jquery.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../scripts/jquery-ui.js"></script>
		<script type="text/javascript" src="../../scripts/jquery.validate.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../../scripts/SpryMenuBarDownHover.gif", imgRight:"../../scripts/SpryMenuBarRightHover.gif"});
			setInterval ("window.status = ''",10);
		</script>
		<script type="text/javascript">
			$(document).ready( function(){
				$("#numLamp").hide();
				$("#novoUsuario").hide();	
				$("#atualizarUsuario").hide();	
				$("#qtdIlum").hide();	
			});


		</script>
		<style>
			fieldset{
				border-radius: 10px;
				padding: 20px;
			}
			input{
				border:1;
				outline:0;
				color:#000;
				margin-bottom:5px;
				padding: 5px;
			}
			#qtdIlum{
				width:20px;
			}
			input[type=checkbox]{
				color: #FFF;
    			margin-left: 0px;
    			padding: 10px;
    			background: rgba(2,33,46,0.91);
    			display: inline-block;
    			font-size: 14px;
    			font-weight: bold;
                
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
    			max-length: 27px;
    			width: 500px;
    			
    			
			}
			input[type=password]{
    			text-decoration: none;
    			color: #FFF;
    			max-length: 27px;
    			width: 200px;
    			
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
   	  				<li><a href="demonstrativos.jsp">Demonstrativo</a></li>
      				<li><a href="">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br>
 		<div style="margin-left:180px;"><h1>Gerenciamento de usuários</h1></div>
		<div id="conteudo">
			<div class="content" style="margin-left:35%;">	
						<%
							if (us != null){
						%>
						<br><br><br>
						<div id="dataTable" align="center" style="margin-left: -20px;">
							<table align="center">
								<tr>
									<th>Número da Sala</th>
									<th>Endereço IP</th>
									<th>Endereço MAC</th>
									<th colspan="2">Opções</th>
								</tr>
							<%
								Iterator<Sala> it = us.iterator();
								int i = 0;
								while(it.hasNext()){
									Sala sala = (Sala)it.next();
									int numero = sala.getNumero();
									String ip = sala.getIp();
									String mac = sala.getMac();
							%>
								<tr>
									<td><%=numero %></td>
									<td><%=ip %></td>
									<td><%=mac %></td>
									<td><a href="#" onclick="carregarDados('<%=numero %>', '<%=ip %>','<%=mac%>')"><img src="../../images/editar.png"><br>Alterar</a></td>
									<%
										if(i==0){%>
											<td rowspan="<%=us.size()%>"> <a href="#"  onclick="novoUsuario()"><img src="../../images/incluir.png"><br>Nova<br>Sala</a></td>
										<%i=1;}
									%>
								</tr>
							<%} %>
							</table>
							
							<br>
							<!-- <div style="margin-left:180px"><h3>Ou click <a href="#">aqui</a> para adicionar um novo usuário</h3></div> -->
						</div>
						<!-- <br><br>-->
						<script type="text/javascript">
							function novoUsuario(){
								$('#dataTable').hide('slow');
								$('#atualizarUsuario').hide('slow');
								$("#novoUsuario").show('slow');
							}
						</script>
							<%}%>
						<div id="novoUsuario">
							<%if (us == null){ %>						
							Não existem usuário cadastrados no momento, deseja cadastrar um novo usuário?
							<%} %>
								<br><br>	
								<form method="post" action="../../CadastraSala" name="form1" id="form1">
									<fieldset>
									<legend>Cadastrar nova sala</legend>
									<label>Numero da Sala: </label><br><input type="text" name="num" id="num" class="num"><br>
									<label>Endereço IP: </label><br><input type="text" name="ip" id="ip" class="ip"><br>
									<label>Endereço MAC: </label><br><input type="text" name="mac" id="mac" class="mac"><br>
									<label>Dispositivos:</label>
									<input type="checkbox" name="ar" value="2" id="ar">&nbsp;&nbsp;&nbsp;Ar-condicionado&nbsp;&nbsp;
									<input type="checkbox" name="iluminacao" value="1" id="ilum">&nbsp;&nbsp;&nbsp;Iluminação<br><br>
									<legend id="numLamp">Numero de lâmpadas:</legend><input type="text" name="qtdIlum" id="qtdIlum" class="qtdIlum">
									<br><br><br>
									<input type="submit" value="Cadastrar">
									<input type="reset" value="Limpar">
									<input type="button" value="Retornar" id="back">
									</fieldset>
								</form>
								<script type="text/javascript">
									var i, j = 1;
									
									$('#ilum').click(function(){
											if (i % 2 != 0){
												$("#numLamp").show();
												$("#qtdIlum").show();
											}
											else{
												$("#numLamp").hide();
												$("#qtdIlum").hide();
											}
											i++;
											
									});
									
									
										
									
									$("#back").click(function(){
										$("#dataTable").show('slow');	
										$("#novoUsuario").hide('show');	
									});
									$(document).ready( function(){
										$("#form1").validate({
											rules:{
												num:{
														required: true
												},
												ip:{
														required: true
												},
												mac:{
														required: true
												}	
											},
											messages:{
												num:{
														required: "Numero da sala é obrigatório"
												},
												ip:{
														required: "Endereço de Ip é obrigatório"
												},
												mac:{
													required: "Endereço Mac é obirgatorio"
												}

											}
									});
								});
							</script>
							</div>
							<div id="atualizarUsuario">
								<br><br>	
								<form method="post" action="../../AtualizaSala" name="form2" id="form2">
									<fieldset>
									<legend>Alterar Usuário</legend>
									<label>Endereço IP: </label><br><input type="text" name="ip" id="ip" class="ip"><br>
									<label>Endereço MAC: </label><br><input type="text" name="mac" id="mac" class="mac"><br>
									<br><br><br>
									<input type="submit" value="Cadastrar">
									<input type="reset" value="Limpar">
									<input type="button" value="back" id="back">
									</fieldset>
								</form>
							</div>
							<script type="text/javascript">
								function carregarDados(nome, login, nivel){
									$('#dataTable').hide('slow');
									$("#atualizarUsuario").show();	
									$("#atualizarUsuario form input:text.nome").val(nome);
									$("#atualizarUsuario form input:text.llogin").val(login);
								}
								
								$("#atualizarUsuario #back").click(function(){
									$("#dataTable").show('slow');	
									$("#atualizarUsuario").hide('show');	
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