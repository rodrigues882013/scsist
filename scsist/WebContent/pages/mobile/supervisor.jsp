<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <title></title>
  <link rel="stylesheet" href="../../styles/jquery.mobile-1.3.1.min.css">
 
  <!-- Extra Codiqa features -->
  <link rel="stylesheet" href="../../styles/codiqa.ext.css">
  
  <!-- jQuery and jQuery Mobile -->
  <script src="../../scripts/jquery-1.9.1.min.js"></script>
  <script src="../../scripts/jquery.mobile-1.3.1.min.js"></script>

  <!-- Extra Codiqa features -->
  <script src="../../scripts/codiqa.ext.js"></script>
   
</head>
<body>
<!-- Home -->
<div data-role="page" id="supervisor">
    <div data-theme="a" data-role="header">
    	<a href="#" data-icon="delete">Sair</a>
        <h1>
           Bem vindo, <% out.print("Felipe"); %>
        </h1>
        <a href="#" data-icon="check">Menu</a>
    </div>
    <br><br>
    <ul data-role="listview" data-inset="true"> 
			<li data-role="list-divider">Salas disponíveis</li> 
			<li><a href="sala.jsp" rel="external">Sala 1</a></li> 
			<li><a href="#segunda">Sala 2</a></li> 
			<li><a href="#segunda">Sala 3</a></li> 
			<li><a href="#segunda">Sala 4</a></li> 
			<li><a href="#segunda">Sala 5</a></li>
			<li><a href="#segunda">Sala Multipla</a></li>  
	</ul> 
	
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h1>
            FAETERJ
        </h1>
    </div>
</div>
</body>
</html>
