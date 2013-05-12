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
<div data-role="page" id="page1">
    <div data-theme="a" data-role="header">
        <h1>
            SCSIST
        </h1>
    </div>
    <div data-role="content" id="content">
        <form action="">
            <div data-role="fieldcontain">
                <label for="login">
                    <strong>Login</strong>
                </label>
                <input name="login" id="login" placeholder="" value="" type="text" data-mini="true">
            </div>
            <div data-role="fieldcontain">
                <label for="senha">
                   <strong>Senha</strong>
                </label>
                <input name="senha" id="senha" placeholder="" value="" type="password" data-mini="true">
            </div>
            <input type="submit" data-inline="true" data-theme="a" data-icon="arrow-r"
            data-iconpos="left" value="Entrar">
        </form>
    </div>
   
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h1>
            FAETERJ
            
        </h1>
    </div>
</div>
</body>
</html>
    