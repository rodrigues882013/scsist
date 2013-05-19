<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
	<head>

		<title>Gestor</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script language="javascript" src="ajax2.js"></script>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/style.css"/>
		<link type="text/css" rel="stylesheet" media="all" href="../../styles/jquery-ui.css"/>
		<script language="JavaScript" src="../../scripts/jquery.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../scripts/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function() {
				$( "#tabs" ).tabs();
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
			<div class="content">
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">Demonstrativos</a></li>
						<li><a href="#tabs-3">Monitorar Salas</a></li>
						<li><a href="#tabs-4">Usuários</a></li>
						<li><a href="#tabs-5">Suporte</a></li>
					</ul>
					<div id="tabs-1">
						<br>
						Gestor seja bem vindo, nessa área voce pode determinar qual tipo de relatório deseja gerar, escolha abaixo o tipo de relatorio que deseja gerar.
						<br>
						<br>
						<select id="list">
  							<option value="1">Por sala</option>
  							<option value="2">Por período</option>
  							<option value="3">Comparativo por salas</option>
  							<option value="4">Comparativo por período</option>
						</select>
						<div id="form">
							<br>
							Salas
							<form action="" method="post">
								<select id="salas">
								<%for (int i=1; i<=7; i++){ %>
  									<option value="<%=i%>">Sala <%=i%></option>
  								<%} %>
								</select>
								<input type="submit" value="Gerar">
							</form>
						</div>
						<script type="text/javascript">
							$('select').change(function(){
								var aux = $('#list').val();
								$('#form').append(" ");
								switch(aux){
									case '1':
										$('#form').html(" ");
										$('#form').html("<br>Salas<form action='' method='post'><select id='salas'><%for (int i=1; i<=7; i++){ %><option value='<%=i%>'>Sala <%=i%></option><%} %></select><input type='submit' value='Gerar'></form>");
										break;
										
									case '2':
										$('#form').html(" ");
										$('#form').append("2");
										break;
										
									case '3':
										$('#form').html(" ");
										$('#form').append("3");
										break;
										
									case '4':
										$('#form').html(" ");
										$('#form').append("4");
										break;
								}
							});
						</script>
						
					</div>
					<div id="tabs-2">
						
					</div>
					<div id="tabs-3">
						<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
						<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
					</div>
					<div id="tabs-4">
						<h1>Usuários Cadastrados</h1>
					</div>
				</div>
				
			</div>  

		</div>         
	</div>
	</body>
</html>
