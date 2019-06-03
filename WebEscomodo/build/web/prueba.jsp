
<%@page contentType="text/html" pageEncoding="UTF-8"%>\
<%
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script src="libs/jquery-3.1.1/jquery-3.1.1.min.js"></script>
            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" ></script>
    <body>
        <h1>Hello World!</h1>
        <form id="formRegistro" name="formRegistro" enctype="multipart/form-data" action="SubirImagenUsuario" method="POST">
	<input type="file" id="img" name="img" accept="image/*"/>
        <input type="submit" value="Entrar">                        
        </form>
    </body>
</html>
