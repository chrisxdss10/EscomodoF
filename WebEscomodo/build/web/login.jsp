<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    ldn.Usuario log = new ldn.Usuario();
    String mensaje = "";
    String acc = request.getParameter("acc") == null ? "0" : request.getParameter("acc");
    String contra = request.getParameter("contra") == null ? "" : request.getParameter("contra");
    String email = request.getParameter("email") == null ? "" : request.getParameter("email");
    if (acc.equals("1")) 
    {
        mensaje = log.login(email, contra);
            
            if(mensaje.equals("1"))
            {
                sesion.setAttribute("Mail", email);
                sesion.setAttribute("Tipo", "1");
                response.sendRedirect("mainPage.jsp");
            }
            else if (mensaje.equals("2"))
            {    
                sesion.setAttribute("Mail", email);
                sesion.setAttribute("Tipo", "2");
                response.sendRedirect("mainPage.jsp");
            }
            else if (mensaje.equals("3"))
            {    
                sesion.setAttribute("Mail", email);
                sesion.setAttribute("Tipo", "3");
                response.sendRedirect("mainPage.jsp");
            }
            else
            {
                %><script> alert("<%=mensaje%>"); </script><%
            }

    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar</title>

        <link type="text/css" rel="stylesheet" href="libs/materialize/css/materialize.min.css"  media="screen,projection"/>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <script type="text/javascript" src="libs/materialize/js/materialize.min.js"></script>
        <script src="libs/jquery-3.1.1/jquery-3.1.1.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <link href="css/login.css" rel="stylesheet">

        <script type="text/javascript" src="js/login.js"></script>
        <link rel="shortcut icon" type="image/x-icon" href="images/solo-logo-naranja.png" />
    </head>
    <body>

        <div class = "row login">
            <div id="div-login-col" class="col s8 l4 offset-l4 offset-s2">
                <div class="card">

                    <div class="card-content center-align">
                        <a href="mainPage.jsp">
                            <img src="https://drive.google.com/uc?id=1g2Fvmk3s7cDx5cMR1rKVOZZyOTj_DjaP" class="responsive-img" id="logo">
                        </a>
                    </div>

                    <div class="card-content">
                        <form action="?acc=1" method="POST" id="login">

                            <div class="row">
                                <div class="input-field">
                                    <i class="prefix far fa-user"></i>
                                    <input type="text" id="email" name="email" autocomplete="off" class="validate">
                                    <label for="email">Correo Electrónico</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field">
                                    <i class="prefix fas fa-lock"></i>
                                    <input type="password" id="contra" name="contra" class="validate">
                                    <label for="contra">Contraseña</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="center-align">
                                    <button class="btn-large waves-effect waves-light" type="submit" name="action" id="Login">Ingresar</button>
                                </div>
                            </div>

                        </form>

                        <div class="row" id="sinCuentaRow">
                            <a href="registro.jsp" class="">
                                <p id="sinCuenta" class="right-align">¿No tienes una Cuenta? ¡Regístrate!</p>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>

    <footer>
        <div id="copy">
            &copy; 2019 CRAYDS
        </div>
    </footer>
</html>
