/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Diego
 */
@MultipartConfig
public class AgregarPlatillo extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        	HttpSession sesion = request.getSession();
	
	ldn.Platillo platillo = new ldn.Platillo();

	String mensaje = "";
	String nom = request.getParameter("nombre");
	float prec = Float.parseFloat(request.getParameter("precio")); 
	String desc = request.getParameter("desc");
        Part filePart = request.getPart("img");  
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String img = "pruebaplat.jpg";//request.getParameter("")+".jpg";
        String uploadPath = getServletContext().getRealPath("")+"/images/img_platillo";
        File uploads = new File(uploadPath);
        File file = new File(uploads,img);
        try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath());
        }
        mensaje = platillo.registrar(nom, prec, desc, "pruebaplat.jpg", sesion.getAttribute("Mail").toString());
    }
}
