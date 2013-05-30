<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	ArrayList<Usuario> us = (ArrayList<Usuario>) session.getAttribute("usuarios");
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
		<script type="text/javascript" src="../../scripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
			var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../../scripts/SpryMenuBarDownHover.gif", imgRight:"../../scripts/SpryMenuBarRightHover.gif"});
			setInterval ("window.status = ''",10);
		</script>
		<script type="text/javascript">
			$(document).ready( function(){
				$("#novoUsuario").hide();	
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
      				<li><a href="salas.jsp">Gerenciar Salas</a></li>
      				<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      				<li><a href="">Suporte</a></li>
    			</ul>
  			</div>
  		</div>
 		<br>
 		<div style="margin-left:180px;"><h1>Gerenciamento de usuários</h1></div>
		<div id="conteudo">
			<div class="content">	
						<%
							if (us != null){
						%>
						<br><br><br>
						<div id="dataTable" align="center" style="margin-left: -20px;">
							<table align="center">
								<tr>
									<th>Nome</th>
									<th>Login</th>
									<th>Nível</th>
									<th colspan="2">Opções</th>
								</tr>
							<%
								Iterator<Usuario> it = us.iterator();
								while(it.hasNext()){
									Usuario usuario = (Usuario)it.next();
									String nome = usuario.getNome();
									String login = usuario.getLogin();
									String nivel = usuario.getNivel();
							%>
								<tr>
									<td><%=nome %></td>
									<td><%=login %></td>
									<td><%=nivel %></td>
									<td><a href=""><img src="../../images/incluir.png"><br>Alterar</a></td>
									<td><a href=""><img src="../../images/excluir.png"><br>Excluir</a></td>
								</tr>
							<%	} %>
							</table>
							<br>
							<div style="margin-left:180px"><h3>Ou click <a href="#" id="">aqui</a> para adicionar um novo usuário</h3></div>
						</div>
						<!-- <br><br>-->
						<script type="text/javascript">
							$('#dataTable a').click(function(){
								$('#dataTable').slideUp("slow");
								$('#novoUsuario').show();
							});
						</script>
							<%}%>
						<div id="novoUsuario">
							<%if (us == null){ %>						
							Não existem usuário cadastrados no momento, deseja cadastrar um novo usuário?
							<%} %>
								<br><br>	
								<form method="post" action="../../CadastraUsuario" name="form2" id="form2">
									<label>Nome: </label><input type="text" name="nome" id="nome"><br>
									<label>Login: </label><input type="text" name="login" id="login"><br>
									<label>Senha: </label><input type="password" name="senha" id="senha"><br>
									<label>Nivel: </label>
									<select name="nivel" id="nivel">
										<option value="1">GESTOR</option>
										<option value="2">SUPERVISOR</option>
										<option value="3">PROFESSOR</option>
									</select>
									<br><br><br>
									<input type="submit" value="Cadastrar">
									<input type="reset" value="Limpar">
									<input type="button" value="back" id="back">
								</form>
								<script type="text/javascript">
									$("#back").click(function(){
										$("#dataTable").slideDown();	
										$("#novoUsuario form").hide();	
									});
									$(document).ready( function(){
										$("#form").validate({
											rules:{
												nome:{
														required: true
												},
												senha:{
														required: true
												},
												login:{
														required: true
												}	
											},
											messages:{
												nome:{
														required: "Nome é obrigatório"
												},
												senha:{
														required: "Senha é obrigatoria"
												},
												login:{
													required: "Login é obrigatorio"
												}
						
											}
									});
								});
			
			
							</script>
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