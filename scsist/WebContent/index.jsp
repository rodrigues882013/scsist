<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String cond = (String)session.getAttribute("erro");
	String erro = "";
	if (cond != null){
		erro = cond;
	}
%>
<!DOCTYPE html>
<html>
	<head>

		<title>ISTRio</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" rel="stylesheet" media="all" href="styles/style.css"/>
		<script language="JavaScript" src="scripts/jquery.js" type="text/javascript"></script>
        <script language="JavaScript" src="scripts/jquery.validate.js" type="text/javascript"></script>
        <script type="text/javascript">
			$(document).ready( function(){
				$("#form").validate({
					rules:{
						username:{
							required: true
						},
						passwd:{
							required: true
						}
						
					},
					messages:{
						username:{
							required: "Digite o nome de usuário"
						},
						passwd:{
							required: "Digite sua senha"
						}
					}
				});
			});
			
			var userAgent = navigator.userAgent.toLowerCase();
			var devices = new Array('nokia','iphone','blackberry','sony','lg',
			'htc_tattoo','samsung','symbian','SymbianOS','elaine','palm',
			'series60','windows ce','android','obigo','netfront',
			'openwave','mobilexplorer','operamini');
			var url_redirect = 'pages/mobile/index.jsp';
			function mobiDetect(userAgent, devices) {
				for(var i = 0; i < devices.length; i++) {
					if (userAgent.search(devices[i]) > 0) {
						return true;
					}
				}
				return false;
			}
			if (mobiDetect(userAgent, devices)) {
				window.location.href = url_redirect;
			}
		</script>
		<style type="text/css">
            * { font-family: Verdana; font-size: 96%; }
            label { display: block; margin-top: 0px; }
            label.error { float: none; color: red; margin: 0 .5em 0 0; vertical-align: top; font-size: 12px; padding-bottom: 4px; }
          	.content{
				margin-left:300px;
				margin-top: -24px;
			}  
          
        </style>

	</head>


		<div id="geral">

			<div id="corpo">	
			<div id="menuc">
					<div id="left-side">
						<img src="images/logo4.png">
					</div>
			</div>
		</div>
		
			<div id="conteudo">
				<div class="content">
					<div id="box">
						<div class="elements">
							<div class="avatar"></div>
							<form action="ControleAcesso" method="post" name="form" id="form">
								<input type="text" id="login" name="login" class="login" placeholder="Usuário" />
								<input type="password" id="passwd" name="passwd" class="password" placeholder="•••••••••" />
								<div class="forget">
									<a href="#">Esqueceu sua senha, click aqui</a>
								</div>
								<div class="checkbox">
									<input id="check" name="checkbox" type="checkbox" value="1" />
									<label for="check">Lembrar senha?</label>
								</div>
								<div class="remember">
									Lembrar?
								</div>
								<input type="submit" name="submit" class="submit" value="Entrar"/>
							</form>
						</div>
					</div>
					<div class="signup">
						Ainda não é cadastrado <a href="pages/contatocadastro.jsp">contacte</a> o gestor
						<br><br><br>
						<font color="red"><%=erro%></font>
					</div>
				</div>
			</div>
			</div>
			<!-- <form action="GeraDemonstrativo?tipo=4" method="post">
				<input type="submit">
			</form>-->
	</body>
</html>
