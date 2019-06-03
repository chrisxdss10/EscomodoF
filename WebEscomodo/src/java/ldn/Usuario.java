package ldn;

import BD.Datos;
import java.sql.ResultSet;
import java.sql.Statement;

public class Usuario {
    private String _nombre;
    private String _boleta;
    private String _email;
    private String _tel;
    private String _contra;
    private String _foto;

    public Usuario()
    {
        _nombre = "";
        _boleta = "";
        _email = "";
        _tel = "";
        _contra = "";
        _foto = "";
    }
    public Usuario(String _nombre, String _boleta, String _email, String _tel, String _contra) {
        this._nombre = _nombre;
        this._boleta = _boleta;
        this._email = _email;
        this._tel = _tel;
        this._contra = _contra;
    }
    
    public Usuario(String _nombre, String _boleta, String _email, String _tel, String _contra, String _foto) {
        this._nombre = _nombre;
        this._boleta = _boleta;
        this._email = _email;
        this._tel = _tel;
        this._contra = _contra;
        this._foto = _foto;
    }
    
    public Usuario(String _nombre, String _tel, String _foto) {
        this._nombre = _nombre;
        this._tel = _tel;
        this._foto = _foto;
    }
    
    public String getNombre() {
        return _nombre;
    }

    public String getBoleta() {
        return _boleta;
    }


    public String getEmail() {
        return _email;
    }


    public String getTel() {
        return _tel;
    }


    public String getContra() {
        return _contra;
    }
    
    public String getFoto() {
        return _foto;
    }

    public void setNombre(String _nombre) {
        this._nombre = _nombre;
    }

    public void setBoleta(String _boleta) {
        this._boleta = _boleta;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }

    public void setTel(String _tel) {
        this._tel = _tel;
    }

    public void setContra(String _contra) {
        this._contra = _contra;
    }

    public void setFoto(String _foto) {
        this._foto = _foto;
    }
    
    

    public String login(String email, String contra)
    {
        String msj = "";
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        try
        {
            base.conectar();
            respuesta = base.consulta("call sp_Login('"+email+"','"+contra+"')");
            if(respuesta.next())
                msj = respuesta.getString("MSJ");
            
            base.cierraConexion();
        }
        catch(Exception error)
        {
            msj = error.toString();
        }
        return msj;
    }
    
}
