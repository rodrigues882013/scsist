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
            Sala 1
        </h1>
    </div>
    <div data-role="content" id="content">
        <form action="">
            <div data-role="fieldcontain">
                <label for="toggleswitch1">
                    L1
                </label>
                <select name="toggleswitch1" id="toggleswitch1" data-theme="a" data-role="slider"
                data-mini="true">
                    <option value="off">
                        Off
                    </option>
                    <option value="on">
                        On
                    </option>
                </select>
            </div>
            <div data-role="fieldcontain">
                <label for="toggleswitch3">
                    L2
                </label>
                <select name="toggleswitch3" id="toggleswitch3" data-theme="a" data-role="slider"
                data-mini="true">
                    <option value="off">
                        Off
                    </option>
                    <option value="on">
                        On
                    </option>
                </select>
            </div>
            <div data-role="fieldcontain">
                <label for="toggleswitch2">
                    L3
                </label>
                <select name="toggleswitch2" id="toggleswitch2" data-theme="a" data-role="slider"
                data-mini="true">
                    <option value="off">
                        Off
                    </option>
                    <option value="on">
                        On
                    </option>
                </select>
            </div>
            <div data-role="fieldcontain">
                <label for="toggleswitch4">
                    L4
                </label>
                <select name="toggleswitch4" id="toggleswitch4" data-theme="a" data-role="slider"
                data-mini="true">
                    <option value="off">
                        Off
                    </option>
                    <option value="on">
                        On
                    </option>
                </select>
            </div>
        </form>
        <a data-role="button" data-theme="a" href="#page1" data-icon="arrow-l"
        data-iconpos="left">
            Sair
        </a>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h1>
            FAETERJ
        </h1>
    </div>
</div>
</body>
</html>
