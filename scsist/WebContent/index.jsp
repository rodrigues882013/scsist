<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
		</script>
		<style type="text/css">
            * { font-family: Verdana; font-size: 96%; }
            label { display: block; margin-top: 0px; }
            label.error { float: none; color: red; margin: 0 .5em 0 0; vertical-align: top; font-size: 12px; padding-bottom: 4px; }
            
          
        </style>

	</head>


		<div id="geral">

			<div id="corpo">
			
				<div id="menuc">
					
				
					<h1></h1><strong>Bem vindo!!</strong></h1>
					<div id="logo"></div>
				</div>
			
				

			</div>
		
			<div id="conteudo">
				<div class="content">
					<div id="box">
						<div class="elements">
							<div class="avatar"></div>
							<form action="pages/admin.html" method="post" name="form" id="form">
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
						Ainda não é cadastrado <a href="#">contacte</a> o gestor
					</div>
				</div>
			</div>
			</div>
	</body>
</html>
