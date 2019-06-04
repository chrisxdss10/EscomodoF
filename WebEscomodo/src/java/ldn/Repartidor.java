package ldn;

import BD.Datos;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author Yax
 */
public class Repartidor extends Usuario{
    private String _horario;
    private String _valoracion;

    public Repartidor()
    {
        super();
        _horario = "";
        _valoracion = "";
    }

    public Repartidor(String _nombre, String _boleta, String _email, String _tel,String _horario, String _contra, String _foto,String _valoracion) {
        super(_nombre,_boleta,_email,_tel,_contra, _foto);
        this._horario = _horario;
        this._valoracion = _valoracion;
    }

    public String getHorario() {
        return _horario;
    }
    
    public String getValoracion() {
        return _valoracion;
    }
    
    public void setHorario(String _horario) {
        this._horario = _horario;
    }

    public void setValoracion(String _valoracion) {
        this._valoracion = _valoracion;
    }
    
    public Repartidor(String _email){
        super("","","");
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call verRepartidor('"+_email+"');");
            if(respuesta.next()){
                this.setNombre(respuesta.getString("nombre"));
                this.setTel(respuesta.getString("tel"));
                this.setFoto(respuesta.getString("foto"));
                this.setEmail(respuesta.getString("email"));
                this.setBoleta(respuesta.getString("boleta"));
                _horario = respuesta.getString("horario");
                _valoracion = respuesta.getString("valoracion");
            }
            base.cierraConexion();
        }
        catch(Exception error)
        {
           System.out.println(error.getMessage());
        }
    }
    
    public Repartidor(int _idP){
        super("","","");
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call sp_getRepbyIdP('"+_idP+"');");
            if(respuesta.next()){
                this.setNombre(respuesta.getString("nombre"));
                this.setTel(respuesta.getString("tel"));
                this.setFoto(respuesta.getString("foto"));
            }
            base.cierraConexion();
        }
        catch(Exception error)
        {
           System.out.println(error.getMessage());
        }
    }
    
    public int NPedidos(String email)
    {
        int np = 0;
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call contarPedidos('"+email+"')");
            if(respuesta.next())
                np = respuesta.getInt("NP");
            
            base.cierraConexion();
        }
        catch(Exception error)
        {
            np = 0;
        }
        return np;
    }
    
    public String registrar(String nombre, String boleta, String email, String tel, String horario, String contra){
        
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_ARepartidor('"+nombre+"','"+boleta+"','"+email+"','"+tel+"','"+horario+"','"+contra+"','prueba.png')");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
    
    public String cambios(String nombre, String boleta, String email, String tel, String acontra, String ncontra, String horario)
    {
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        
        try{
            base.conectar();
            respuesta = base.consulta("call sp_CRepartidor('"+nombre+"','"+boleta+"','"+email+"','"+tel+"','"+acontra+"','"+ncontra+"','"+horario+"');");
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
            respuesta = base.consulta("call sp_saveIMGrepartidor('"+img+"','"+boleta+"');");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error){
            msj = error.toString();
        }
        
        return msj;
    }
            
}
