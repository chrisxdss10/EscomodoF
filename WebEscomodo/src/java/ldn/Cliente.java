package ldn;

import BD.Datos;
import java.sql.ResultSet;
import java.sql.Statement;

public class Cliente extends Usuario{
    
    public Cliente(){
        super();
    }
    
    public Cliente(String nombre, String boleta, String email, String tel, String contra){
        super(nombre, boleta, email, tel, contra);
    }
    
    public Cliente(String mail)
    {
        super();
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call verClientebyMail('"+mail+"');");
            if(respuesta.next()){
                this.setNombre(respuesta.getString("nombre"));
                this.setBoleta(respuesta.getString("boleta"));
                this.setTel(respuesta.getString("tel"));
                this.setEmail(respuesta.getString("email"));
                this.setFoto(respuesta.getString("foto"));
            }
            base.cierraConexion();
        }
        catch(Exception error)
        {
           System.out.println(error.getMessage());
        }
    }
    
    public String registrar(String nombre, String boleta, String email, String tel, String contra){
        
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_ACliente('"+nombre+"','"+boleta+"','"+email+"','"+tel+"','"+contra+"','prueba.png')");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
    
    public String cambios(String nombre, String boleta, String email, String tel, String acontra, String ncontra)
    {
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_CCliente('"+nombre+"','"+boleta+"','"+email+"','"+tel+"','"+acontra+"','"+ncontra+"');");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
    
    public String gImagen(String img, String boleta)
    {
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_saveIMGcliente('"+img+"','"+boleta+"');");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
    public Cliente(int id)
    {
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_NombreCbyId('"+id+"');");
            if(respuesta.next())
                this.setNombre(respuesta.getString("nombre"));
                this.setTel(respuesta.getString("tel"));
                this.setFoto(respuesta.getString("foto"));
            base.cierraConexion();
        }
        catch(Exception error){
            System.out.println(error.getMessage());
        }
    }
    
    public int getId(){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        int id=0;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_getIdCliente('"+super.getEmail()+"');");
            if(respuesta.next())
                id = respuesta.getInt("idcliente");
            
            base.cierraConexion();
        }
        catch(Exception error){
            
        }
        
        return id;
    }
}