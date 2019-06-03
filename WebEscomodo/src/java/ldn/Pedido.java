/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ldn;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Yax
 */
public class Pedido {
    private int _idPed;
    private int _cliente;
    private String _comercio;
    private String _comida;
    private int _cantidad;
    private float _precio;
    private float _total;
    private String _fecha;
    private String _hora;
    private String _lugar;
    private float _calificacion;
    private String _estado;

    public int getIdPed() {
        return _idPed;
    }

    public void setIdPed(int _idPed) {
        this._idPed = _idPed;
    }

    public int getCliente() {
        return _cliente;
    }

    public void setCliente(int _cliente) {
        this._cliente = _cliente;
    }

    public String getComercio() {
        return _comercio;
    }

    public void setComercio(String _comercio) {
        this._comercio = _comercio;
    }

    public String getComida() {
        return _comida;
    }

    public void setComida(String _comida) {
        this._comida = _comida;
    }

    public int getCantidad() {
        return _cantidad;
    }

    public void setCantidad(int _cantidad) {
        this._cantidad = _cantidad;
    }

    public float getPrecio() {
        return _precio;
    }

    public void setPrecio(float _precio) {
        this._precio = _precio;
    }

    public float getTotal() {
        return _total;
    }

    public void setTotal(float _total) {
        this._total = _total;
    }

    public String getFecha() {
        return _fecha;
    }

    public void setFecha(String _fecha) {
        this._fecha = _fecha;
    }

    public String getHora() {
        return _hora;
    }

    public void setHora(String _hora) {
        this._hora = _hora;
    }

    public String getLugar() {
        return _lugar;
    }

    public void setLugar(String _lugar) {
        this._lugar = _lugar;
    }

    public float getCalificacion() {
        return _calificacion;
    }

    public void setCalificacion(float _calificacion) {
        this._calificacion = _calificacion;
    }

    public String getEstado() {
        return _estado;
    }

    public void setEstado(String _estado) {
        this._estado = _estado;
    }    
    
    public static ArrayList<Pedido> getListaPedidos(String mail){
    BD.Datos base = new BD.Datos();
    ResultSet respuesta = null;
    ArrayList<Pedido> listaPedidos=new ArrayList<Pedido>();
    try{
        base.conectar();
        respuesta= base.consulta("call sp_verPedidos('"+mail+"');");

        while (respuesta.next()){
            Pedido pedido = new Pedido();
            
            pedido.setIdPed(respuesta.getInt("idpedido"));
            pedido.setCliente(respuesta.getInt("cliente"));
            pedido.setComercio(respuesta.getString("establecimiento"));
            pedido.setComida(respuesta.getString("comida"));
            pedido.setCantidad(respuesta.getInt("cantidad"));
            pedido.setPrecio(respuesta.getFloat("precio"));
            pedido.setTotal(respuesta.getFloat("total"));
            pedido.setFecha(respuesta.getString("fecha"));
            pedido.setHora(respuesta.getString("hora"));
            pedido.setLugar(respuesta.getString("lugar"));
            pedido.setCalificacion(respuesta.getFloat("calificacion"));
            pedido.setEstado(respuesta.getString("estado"));

            listaPedidos.add(pedido);
        }
        base.cierraConexion();
    }
    catch (Exception e){
        e.printStackTrace();
    }
    return listaPedidos;
   }
    
   public static ArrayList<Pedido> existe(String com, String fecha, String hora, float prec, String lugar){
       BD.Datos base = new BD.Datos();
    ResultSet respuesta = null;
    ArrayList<Pedido> pgrupales =new ArrayList<Pedido>();
    try{
        base.conectar();
        respuesta= base.consulta("call sp_verPedidosR('"+com+"','"+fecha+"','"+hora+"','"+prec+"','"+lugar+"');");

        while (respuesta.next()){
            Pedido pedido = new Pedido();
            pedido.setIdPed(respuesta.getInt("idpedido"));
            pedido.setComida(respuesta.getString("comida"));
            pedido.setCantidad(respuesta.getInt("cantidad"));
            pedido.setPrecio(respuesta.getFloat("precio"));
            pedido.setCalificacion(respuesta.getFloat("calificacion"));
            pedido.setEstado(respuesta.getString("estado"));
            
            float total = (pedido.getCantidad()*pedido.getPrecio());
            pedido.setTotal(total);
            pgrupales.add(pedido);
        }
        base.cierraConexion();
    }
    catch (Exception e){
        e.printStackTrace();
    }
       return pgrupales;
   }
   
    public String insertarPedido(int idCli, int idPla, String f, String h, float p, int c, String l, int est, String des){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call sp_APedido("+idCli+", "+idPla+", '"+f+
                "', '"+h+"',"+p+", "+c+" , '"+l+"', "+est+
                ",'"+des+"');");
        while (respuesta.next()){
           msj=respuesta.getString("MSJ");
        }
        base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
   
   public String eliminarFav(int idCliente, int idPlatillo, int idEstab){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call sp_deleteFav("+idCliente+", "+idPlatillo+", "+idEstab+")");
        while (respuesta.next()){
           msj=respuesta.getString("MSJ");
        }
        base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
   
   public String eliminarCarrito(int idCliente, int idPlatillo, int idEstab){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call sp_deleteCart("+idCliente+", "+idPlatillo+", "+idEstab+")");
        while (respuesta.next()){
           msj=respuesta.getString("MSJ");
        }
        base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
   
   public static ArrayList<Pedido> getFavoritos(String email){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        ArrayList<Pedido> listaPlatillos=new ArrayList<Pedido>();
        try{
            base.conectar();
            respuesta= base.consulta("call sp_verFavoritos('"+email+"');");
         
            while (respuesta.next()){
            
                Pedido p = new Pedido();
                p.setIdPed(respuesta.getInt("idpedido"));
                p.setTotal(respuesta.getInt("idplatillo"));
                p.setComida(respuesta.getString("comida"));
                p.setPrecio(respuesta.getFloat("precio"));
                p.setFecha(respuesta.getString("fecha"));
                p.setComercio(respuesta.getString("nombre"));
                p.setHora(respuesta.getString("imagen"));
                listaPlatillos.add(p);
            }
            base.cierraConexion();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return listaPlatillos;
   }
   
   public static ArrayList<Pedido> getCarrito(String email){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        ArrayList<Pedido> listaPlatillos=new ArrayList<Pedido>();
        try{
            base.conectar();
            respuesta= base.consulta("call sp_verCarrito('"+email+"');");
         
            while (respuesta.next()){
            
                Pedido p = new Pedido();
                p.setIdPed(respuesta.getInt("idpedido"));
                p.setTotal(respuesta.getInt("idplatillo"));
                p.setComida(respuesta.getString("comida"));
                p.setPrecio(respuesta.getFloat("precio"));
                p.setFecha(respuesta.getString("fecha"));
                p.setComercio(respuesta.getString("nombre"));
                p.setCantidad(respuesta.getInt("cantidad"));
                listaPlatillos.add(p);
            }
            base.cierraConexion();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return listaPlatillos;
   }
   
   public static String isCartEmpty(int idC){
        BD.Datos base = new BD.Datos();
        ResultSet respuesta = null;
        String answer="";
        try{
            base.conectar();
            respuesta= base.consulta("call sp_isEmpty("+idC+");");
         
            while (respuesta.next()){
                answer=respuesta.getString("MSJ");
            }
            base.cierraConexion();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return answer;
   }
   
    public String insertarCarrito(int idCli, int idPla, String f, String h, float p, int c, String l, int est, String des){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call sp_ACarrito("+idCli+", "+idPla+", '"+f+
                "', '"+h+"',"+p+", "+c+" , '"+l+"', "+est+
                ",'"+des+"');");
        while (respuesta.next()){
           msj=respuesta.getString("MSJ");
        }
        base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
    
    public String actualizarEstado(int idCli, int idEst, String f, String h, float pt, String l, int est){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call updateEstadoPed("+idCli+", "+idEst+", '"+f+
                "', '"+h+"',"+pt+", '"+l+"', "+est+");");
        while (respuesta.next()){
           msj=respuesta.getString("MSJ");
        }
           base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
    
   public String getEspecif(int idPedido){
       BD.Datos base = new BD.Datos();
       ResultSet respuesta = null;
       String msj="";
       try{
        base.conectar();
        
        respuesta= base.consulta("call sp_getEspbyId('"+idPedido+"');");
        while (respuesta.next()){
           msj=respuesta.getString("especif");
        }
        base.cierraConexion();
        }
    catch (Exception e){
        e.printStackTrace();
    }
       return msj;
   }
   
   public static ArrayList<Pedido> getListaPedidosH(String mail){
    BD.Datos base = new BD.Datos();
    ResultSet respuesta = null;
    ArrayList<Pedido> listaPedidos=new ArrayList<Pedido>();
    try{
        base.conectar();
        respuesta= base.consulta("call sp_pedidosAcep('"+mail+"');");

        while (respuesta.next()){
            Pedido pedido = new Pedido();
            
            pedido.setIdPed(respuesta.getInt("idpedido"));
            pedido.setCliente(respuesta.getInt("cliente"));
            pedido.setComercio(respuesta.getString("establecimiento"));
            pedido.setComida(respuesta.getString("comida"));
            pedido.setCantidad(respuesta.getInt("cantidad"));
            pedido.setPrecio(respuesta.getFloat("precio"));
            pedido.setTotal(respuesta.getFloat("total"));
            pedido.setFecha(respuesta.getString("fecha"));
            pedido.setHora(respuesta.getString("hora"));
            pedido.setLugar(respuesta.getString("lugar"));
            pedido.setCalificacion(respuesta.getFloat("calificacion"));
            pedido.setEstado(respuesta.getString("estado"));

            listaPedidos.add(pedido);
        }
        base.cierraConexion();
    }
    catch (Exception e){
        e.printStackTrace();
    }
    return listaPedidos;
   }
   public static ArrayList<Pedido> getListaPedidosA(String mail){
    BD.Datos base = new BD.Datos();
    ResultSet respuesta = null;
    ArrayList<Pedido> listaPedidos=new ArrayList<Pedido>();
    try{
        base.conectar();
        respuesta= base.consulta("call sp_pedidosActivos('"+mail+"');");

        while (respuesta.next()){
            Pedido pedido = new Pedido();
            
            pedido.setIdPed(respuesta.getInt("idpedido"));
            pedido.setCliente(respuesta.getInt("cliente"));
            pedido.setComercio(respuesta.getString("establecimiento"));
            pedido.setComida(respuesta.getString("comida"));
            pedido.setCantidad(respuesta.getInt("cantidad"));
            pedido.setPrecio(respuesta.getFloat("precio"));
            pedido.setTotal(respuesta.getFloat("total"));
            pedido.setFecha(respuesta.getString("fecha"));
            pedido.setHora(respuesta.getString("hora"));
            pedido.setLugar(respuesta.getString("lugar"));
            pedido.setCalificacion(respuesta.getFloat("calificacion"));
            pedido.setEstado(respuesta.getString("estado"));

            listaPedidos.add(pedido);
        }
        base.cierraConexion();
    }
    catch (Exception e){
        e.printStackTrace();
    }
    return listaPedidos;
   }
   
   public void calificar(int idPedido, float cal){
        BD.Datos base = new BD.Datos();
        try{
            base.conectar();
        
            base.consulta("call sp_califRepartidor('"+idPedido+"','"+cal+"');");
            
            base.cierraConexion();
            }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
