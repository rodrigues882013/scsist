<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.objects.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>


<%
	Usuario u = (Usuario) session.getAttribute("usuario");
	ArrayList<Usuario> us = (ArrayList<Usuario>) session.getAttribute("usuarios");
	if( (u != null) && (u.getNivel().toString().compareTo("GESTOR") == 0) ){
		String senha = (String) session.getAttribute("senha");
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
		<style>
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
		<div id="conteudo" style="text-align:center; color:red;">
			<div class="content" style="border-radius: 10px; padding: 20px; background: #EFEFEF; margin-left:500px;">	
				Anote a senha do novo usuário: <%=senha %>
				<br><br>
				<input type="button" id="btnVoltar" value="Voltar">
			</div>
		</div>
		<script type="text/javascript">
			$("#btnVoltar").click(function(){
				location.href="usuarios.jsp";
			});
		</script>
	</div>
		
	</body>
</html>

<%
	}
	else{
		response.sendRedirect("../../");
	}


%>