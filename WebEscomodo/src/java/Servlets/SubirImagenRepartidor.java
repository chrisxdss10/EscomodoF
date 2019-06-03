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
import javax.servlet.ServletContext;
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
public class SubirImagenRepartidor extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter(); 
        HttpSession sesion = request.getSession();
        String boleta = sesion.getAttribute("Boleta").toString();
                //Guarda la imagen
        Part filePart = request.getPart("img");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String extension = fileName.substring((fileName.length()-3), fileName.length());
        if (extension.equals("jpg") || extension.equals("png")) {
            String img = boleta+"."+extension;
            //String uploadPath = getServletContext().getRealPath("")+"/images/img_cliente"; //Aquí va tu ruta donde guardas la imagen
            //File uploads = new File(uploadPath);
            ServletContext context = request.getServletContext();
            String path = context.getRealPath("\\");

            for (int i = 0; i < path.length(); i++) {

                if(path.charAt(i) == 'b' && path.charAt((i+1)) == 'u' && path.charAt((i+2)) == 'i' && path.charAt((i+3)) == 'l' && path.charAt((i+4)) == 'd')
                {
                    String comp = "";
                    for (int j = 0; j < path.length(); j++) {
                        if(j == i) j = i+5;
                        comp += path.charAt(j);
                    }
                    path = comp;
                }

            }
            File file = new File(path+"\\images\\img_repartidor",img); 
            try (InputStream input = filePart.getInputStream()) {
                if (file.exists()) {
                    file.delete();
                    Files.copy(input, file.toPath());
                }
                else
                {
                    Files.copy(input, file.toPath());
                }
            }
            
            ldn.Repartidor rep = new ldn.Repartidor();
            String msj = rep.gImagen(img, boleta);
            
            
            response.sendRedirect("editarRepartidor.jsp");
        }
        else
        {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Tipo de archivo incorrecto');");
            out.println("location='SubirImagen.jsp';");
            out.println("</script>");
        }
        
        
        
    }

}
