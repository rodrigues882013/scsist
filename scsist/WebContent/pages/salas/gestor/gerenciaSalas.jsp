<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Sala"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	ArrayList<Sala> us = (ArrayList<Sala>) session.getAttribute("salas");
	HashMap<Integer, String> dispositivos = (HashMap<Integer, String>) session.getAttribute("dispositivos");
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
				$("#numAr").hide();
				$("#qtdAr").hide();
				$("#potenciaLamp").hide();
				$("#potenciaLuz").hide();
				$("#potenciaAr").hide();
				$("#potenciaCond").hide();

			});


		</script>
		<style>
			fieldset{
				border-radius: 10px;
				padding: 20px;
				width: 500px;
				background: #EFEFEF;
			}
			input{
				border:1px;
				outline:0;
				color:#000;
				margin-bottom:5px;
				padding: 5px;
				border-color: #000;
				
				
			}
			#qtdIlum{
				width:30px;
			}
			
			#qtdAr{
				width:30px;
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
    			length: 15pt;
    			width: 250px;
    			border: 1px solid;
				border-radius: 5px;
    			text-align: left;
    			
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
      				<li><a href="#" style="background-color: rgba(2,33,48,0.88); color:#FFF;">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br><br><br>
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
						<div id="novoUsuario" style="margin-left:15%; margin-top: -50px;">
							<%if (us == null){ %>						
							Não existem usuários cadastrados no momento, deseja cadastrar um novo usuário?
							<%} %>
								<br><br>	
								<form method="post" action="../../CadastraSala" name="form1" id="form1">
									<fieldset>
									<legend><h2>Cadastrar nova sala</h2></legend>
									<label>Número da Sala: </label><br><input type="text" name="numero" id="numero" class="numero"><br>
									<label>Endereço IP: </label><br><input type="text" name="ip" id="ip" class="ip"><br>
									<label>Endereço MAC: </label><br><input type="text" name="mac" id="mac" class="mac"><br><br>
									<label>Dispositivos:</label><br>
									<%
										int i = 1;
										while(i <= dispositivos.size()){
									%>
									<input type="checkbox" name='<%=dispositivos.get(i)%>' value='<%=i%>' id='<%=dispositivos.get(i)%>'>&nbsp;&nbsp;&nbsp;<%=dispositivos.get(i)%>&nbsp;&nbsp;
									<!-- <input type="checkbox" name="iluminacao" value="1" id="ilum">&nbsp;&nbsp;&nbsp;Iluminação<br><br> -->
									<%		i++;
										}
									%>
									<br><br>
									<label id="numLamp">Número de lâmpadas:</label>&nbsp;&nbsp;
									<input type="text" name="qtdIlum" id="qtdIlum" class="qtdIlum">&nbsp;&nbsp;
									<label id="potenciaLuz">Potência (W):</label>&nbsp;&nbsp;
									<select id="potenciaLamp" name="potenciaLamp">
										<option>40</option>
										<option>60</option>
										<option>120</option>
									</select>
									<br><br>
									<label id="numAr">Número de condicionadores de AR:</label>&nbsp;&nbsp;
									<input type="text" name="qtdAr" id="qtdAr" class="qtdAr">&nbsp;&nbsp;
									<label id="potenciaAr">Potência (BTU):</label>&nbsp;&nbsp;
									<select id="potenciaCond" name="potenciaCond">
										<option>5000</option>
										<option>10000</option>
										<option>15000</option>
									</select>
									<br><br>
									<input type="submit" value="Cadastrar">
									<input type="reset" value="Limpar" id="reset">
									<input type="button" value="Retornar" id="back">
									</fieldset>
								</form>
								<script type="text/javascript">
									var i, j = 1;
									
									$('#ILUMINACAO').click(function(){
											if (i % 2 != 0){
												$("#numLamp").show();
												$("#qtdIlum").show();
												$("#potenciaLamp").show();
												$("#potenciaLuz").show();
												
											}
											else{
												$("#numLamp").hide();
												$("#qtdIlum").hide();
												$("#potenciaLamp").hide();
												$("#potenciaLuz").hide();
												
											}
											i++;
											
									});
									
									var k, w = 1;
									
									$('#AR').click(function(){
											if (i % 2 != 0){
												$("#numAr").show();
												$("#qtdAr").show();
												$("#potenciaAr").show();
												$("#potenciaCond").show();
											}
											else{
												$("#numAr").hide();
												$("#qtdAr").hide();
												$("#potenciaAr").hide();
												$("#potenciaCond").hide();
											}
											i++;
											
									});
									
									$("#reset").click(function(){
										$("#numAr").hide();
										$("#qtdAr").hide();
										$("#numLamp").hide();
										$("#qtdIlum").hide();
										$("#potenciaAr").hide();
										$("#potenciaCond").hide();
										$("#potenciaLamp").hide();
										$("#potenciaLuz").hide();
										
										
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
							<div id="atualizarUsuario" style="margin-left:15%; margin-top: -50px;">
								<br><br>	
								<form method="post" action="../../AtualizaSala" name="form2" id="form2">
									<fieldset>
									<legend><h2>Alterar Salas</h2></legend>
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