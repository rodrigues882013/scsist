<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	ArrayList<Usuario> us = (ArrayList<Usuario>) session.getAttribute("usuarios");
	if( (u != null) && (u.getNivel().toString().compareTo("GESTOR") == 0) ){
%>

<!DOCTYPE html>
<html>
	<head>

		<title>Gestor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="ajax2.js"></script>
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
   	  		<li><a href="demonstrativos.jsp" >Demonstrativo</a></li>
      		<li><a href="gerenciaSalas.jsp">Gerenciar Salas</a></li>
      		<li><a href="usuarios.jsp">Gerenciar Usuários</a></li>
      		<li><a href="suporte.jsp">Suporte</a></li>
    		</ul>
  		</div>
  		</div>
 
		<div id="conteudo" style="width:80%;">
			<div align="justify" style="margin-left:20%;margin-top:-10px;">
				<p>Seja bem vindo gestor, é um prazer poder ajuda-lo, pro favor click em um dos links acime no menu de opções para ser redirecionado para a opção que deseja.
				Seja cauteloso, seus dados estão sendo gravados.
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