package ldn;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Establecimiento 
{
    private int _idest;
    private String _nombre;
    private String _ubicacion;
    private String _representante;
    private String _email;
    private String _tel;
    private String _horario;
    private String _foto;

    public Establecimiento(int _idest, String _nombre, String _ubicacion, String _representante, String _email, String _tel, String _horario, String _foto) {
        this._idest = _idest;
        this._nombre = _nombre;
        this._ubicacion = _ubicacion;
        this._representante = _representante;
        this._email = _email;
        this._tel = _tel;
        this._horario = _horario;
        this._foto = _foto;
    }
    
    public Establecimiento(int _idest, String _nombre, String _email, String _foto) {
        this._idest = _idest;
        this._nombre = _nombre;
        this._email = _email;
        this._foto = _foto;
    }
    
    public Establecimiento() {
        this._idest = _idest;
        this._nombre = _nombre;
        this._ubicacion = _ubicacion;
        this._representante = _representante;
        this._email = _email;
        this._tel = _tel;
        this._horario = _horario;
        this._foto = _foto;
    }
    
    public Establecimiento(String email)
    {
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call sp_getEstbyMail('"+email+"');");
            if(respuesta.next())
            {
                _idest = Integer.parseInt(respuesta.getString("idest"));
                _nombre = respuesta.getString("nombre");
                _ubicacion = respuesta.getString("ubicacion");
                _representante = respuesta.getString("representante");
                _email = respuesta.getString("email");
                _tel = respuesta.getString("tel");
                _horario = respuesta.getString("horario");
                _foto = respuesta.getString("foto");
                
            }
            base.cierraConexion();
        }
        catch(Exception error)
        {
            System.out.println(error.getMessage());
        }
    }
    
    public Establecimiento(int id)
    {
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call sp_getEstbyId('"+id+"');");
            if(respuesta.next())
            {
                _idest = Integer.parseInt(respuesta.getString("idest"));
                _nombre = respuesta.getString("nombre");
                _ubicacion = respuesta.getString("ubicacion");
                _representante = respuesta.getString("representante");
                _email = respuesta.getString("email");
                _tel = respuesta.getString("tel");
                _horario = respuesta.getString("horario");
                _foto = respuesta.getString("foto");
                
            }
            base.cierraConexion();
        }
        catch(Exception error)
        {
            System.out.println(error.getMessage());
        }
    }
    
    public String registrar(String nombre, String ubi, String repre, String email, String tel, String horario, String contra){
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_AEstablecimiento('"+nombre+"','"+ubi+"','"+repre+"','"+email+"','"+tel+"','"+horario+"','"+contra+"','prueba.png')");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
    
    public static ArrayList<Establecimiento> getEstablecimientos(){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        ArrayList<Establecimiento> listaEst=new ArrayList<Establecimiento>();
        try{
            base.conectar();
            respuesta= base.consulta("call verEstablecimiento();");
         
            while (respuesta.next()){
                Establecimiento e = new Establecimiento(respuesta.getInt("idest"),respuesta.getString("nombre")
                ,respuesta.getString("email"), "images/comida1.jpg");//cambiar foto
                listaEst.add(e);
            }
            base.cierraConexion();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return listaEst;
   }
    
    public static ArrayList<Establecimiento> getEstablecimientosbySearch(String cad){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        ArrayList<Establecimiento> listaEst=new ArrayList<Establecimiento>();
        try{
            base.conectar();
            respuesta= base.consulta("call sp_verEstbySearch('"+cad+"');");
         
            while (respuesta.next()){
                Establecimiento e = new Establecimiento(respuesta.getInt("idest"),respuesta.getString("nombre")
                ,respuesta.getString("email"), "images/comida1.jpg");//cambiar foto
                listaEst.add(e);
            }
            base.cierraConexion();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return listaEst;
   }

    public int getIdest() {
        return _idest;
    }

    public String getNombre() {
        return _nombre;
    }

    public String getUbicacion() {
        return _ubicacion;
    }

    public String getRepresentante() {
        return _representante;
    }

    public String getEmail() {
        return _email;
    }

    public String getTel() {
        return _tel;
    }

    public String getHorario() {
        return _horario;
    }

    public String getFoto() {
        return _foto;
    }
    
}
