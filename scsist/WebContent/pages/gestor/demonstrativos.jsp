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
		<script language="JavaScript" src="../../scripts/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
			var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../../scripts/SpryMenuBarDownHover.gif", imgRight:"../../scripts/SpryMenuBarRightHover.gif"});
			setInterval ("window.status = ''",10);
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
 		
 		<br><br><br>
		<div id="conteudo">
			<div class="content" style="margin-left:150px;">	
			<h1>Área de gestão</h1>
			<br><br>
			Gestor seja bem vindo, nessa área voce pode determinar qual tipo de relatório deseja gerar, escolha abaixo o tipo de relatorio que deseja gerar.
						<br>
						<br>
						<select id="list">
  							<option value="1">Por sala</option>
  							<option value="2">Por período</option>
  							<option value="3">Comparativo por salas</option>
  							<option value="4">Comparativo por período</option>
						</select>
						<div id="form1">
							<br>
							Salas
							<form action="" method="post">
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
										$('#form1').html("<br>Salas<form action='' method='post'><select id='salas'><%for (int i=1; i<=7; i++){ %><option value='<%=i%>'>Sala <%=i%></option><%} %></select><br><input type='submit' value='Gerar'></form>");
										break;
										
									case '2':
										$('#form1').html(" ");
										$('#form1').html("2");
										break;
										
									case '3':
										$('#form1').html(" ");
										$('#form1').html("3");
										break;
										
									case '4':
										$('#form1').html(" ");
										$('#form1').html("4");
										break;
								}
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