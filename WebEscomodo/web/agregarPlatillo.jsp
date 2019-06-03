<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession sesion = request.getSession();
	
	ldn.Platillo platillo = new ldn.Platillo();

	String mensaje = "";

	String nom = request.getParameter("nombre");
	float prec = Float.parseFloat(request.getParameter("precio"));
	String desc = request.getParameter("desc");
        //img
        
        mensaje = platillo.registrar(nom, prec, desc, "prueba.jpg", sesion.getAttribute("Mail").toString());


%>