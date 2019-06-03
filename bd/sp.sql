use escomodo;

drop procedure if exists sp_ACliente;
delimiter **
create procedure sp_ACliente(in nom nvarchar(60), in bol nvarchar(10), in mail nvarchar(40), in tel nvarchar(20), in cont nvarchar(16), in fot nvarchar(80))
begin
	declare msj nvarchar(60); 
    declare idc int;
    declare exs int;
    
    set exs = (select count(*) from cliente where boleta = bol);
    
    if exs = 0 then
		set exs = (select count(*) from cliente where email = mail);
        
		if exs = 0 then
			set idc =(select ifnull(max(idcliente),0) + 1 from cliente);
			insert into cliente values(idc,nom,bol,mail,tel, aes_encrypt(cont, 'huecofriends'),fot, true);
			set msj='Has sido registrado';
		else
			set msj ='Este correo ya está registrado :/';
        end if;
    else
		set msj ='Esta boleta ya está registrada :/';
    end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_ARepartidor;
delimiter **
create procedure sp_ARepartidor(in nom nvarchar(60), in bol nvarchar(10), in mail nvarchar(40), in tel nvarchar(20), in hor nvarchar(150), in cont nvarchar(16), in fot nvarchar(80))
begin
	declare msj nvarchar(60); 
    declare idr int;
    declare exs int;
    
    set exs = (select count(*) from repartidor where boleta = bol);
    
    if exs = 0 then
		set exs = (select count(*) from repartidor where email = mail);
        
		if exs = 0 then
			set idr =(select ifnull(max(idrepartidor),0) + 1 from repartidor);
			insert into repartidor values(idr,nom,bol,mail,tel,hor, aes_encrypt(cont, 'huecofriends'),fot, 0.0, true);
			set msj='Has sido registrado';
		else
			set msj ='Este correo ya está registrado :/';
        end if;
    else
		set msj ='Esta boleta ya está registrada :/';
    end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_AEstablecimiento;
delimiter **
create procedure sp_AEstablecimiento(in nom nvarchar(60),in ubi nvarchar(100), in rep nvarchar(60), in mail nvarchar(40), in tel nvarchar(20), in hor nvarchar(40), in cont nvarchar(16), in fot nvarchar(80))
begin
	declare msj nvarchar(60); 
    declare ide int;
    declare exs int;
    
    set exs = (select count(*) from establecimiento where email = mail);
    
    if exs = 0 then

		set ide =(select ifnull(max(idest),0) + 1 from establecimiento);
		insert into establecimiento values(ide,nom,ubi,rep,mail,tel,hor, aes_encrypt(cont, 'huecofriends'),fot, true);
		set msj='Has sido registrado';

    else
		set msj ='Este correo ya está registrado :/';
    end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_Login;
delimiter **
create procedure sp_Login(in mail nvarchar(40), in cont nvarchar(16))
begin
	declare exs int;
	declare cf boolean;
    declare msj nvarchar(60);
    
	set exs = (select count(*) from cliente where email = mail and (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = cont);
    if exs = 1 then
		set cf = (select confirmado from cliente where email = mail);
        if cf = true then
			set msj='1';
		else
			set msj = '0';
		end if;
	else
		set exs = (select count(*) from establecimiento where email = mail and (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = cont);
		if exs = 1 then
			set cf = (select confirmado from establecimiento where email = mail);
			if cf = true then
				set msj='2';
			else
				set msj = '0';
			end if;
        else  
			set exs = (select count(*) from repartidor where email = mail and (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = cont);
			if exs = 1 then
				set cf = (select confirmado from repartidor where email = mail);
				if cf = true then
					set msj='3';
				else
					set msj = '0';
				end if;
			else
				set msj = 'Usuario no encontrado';
			end if;
		end if;
	end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_APlatillo;
delimiter **
create procedure sp_APlatillo(in nom nvarchar(60), in pre float(5,2), in des tinytext, in fot nvarchar(80), in mailest nvarchar(60))
begin
	declare msj nvarchar(60); 
    declare idp int;
    declare exs int;
    
	set idp =(select ifnull(max(idplatillo),0) + 1 from platillo);
	insert into platillo values(idp,nom,0,pre,des, fot, (select idest from establecimiento where email = mailest));
	set msj='Platillo registrado';
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_getEstbyMail;
delimiter **
create procedure sp_getEstbyMail(in mail varchar(40))
begin
	select * from establecimiento where email = mail;
end**
delimiter ;

drop procedure if exists verPlatillo;
delimiter **
create procedure verPlatillo()
begin
	select idplatillo, platillo.nombre, valoracion, precio, descripcion, 
    platillo.foto, establecimiento.nombre as lugar from platillo, establecimiento 
    where establecimiento=idest order by valoracion desc;
end; **
delimiter ;

drop procedure if exists verEstablecimiento;
delimiter **
create procedure verEstablecimiento()
begin
	select idest, nombre, email, foto from establecimiento;
end; **
delimiter ;

drop procedure if exists verPlatillobyMail;
delimiter **
create procedure verPlatillobyMail(in mail nvarchar(40))
begin
	select idplatillo, platillo.nombre, valoracion, precio, descripcion, platillo.foto, establecimiento.nombre as lugar from platillo, establecimiento where establecimiento=idest and email = mail;
end; **
delimiter ;

drop procedure if exists verClientebyMail;
delimiter **
create procedure verClientebyMail(in mail nvarchar(40))
begin
	select nombre, boleta, email, tel, foto from cliente where email = mail;
end; **
delimiter ;

drop procedure if exists actValoracion;
delimiter **
create procedure actValoracion(in mail nvarchar(40))
begin
	declare val float(2,1);
	set val= (select AVG(valrep) from aceptpedido, repartidor where idrepartidor = repartidor and valrep!=0 and email = mail);
    if val>1 then
		update repartidor set valoracion=val where email=mail;
    else
		update repartidor set valoracion=0 where email=mail;
    end if;
end; **
delimiter ;

drop procedure if exists contarPedidos;
delimiter **
create procedure contarPedidos(in mail nvarchar(40))
begin
	declare cuantos int;
	set cuantos= (select count(*) from aceptpedido, repartidor where idrepartidor = repartidor and email = mail);
	select cuantos AS NP;
end; **
delimiter ;

drop procedure if exists verRepartidor;
delimiter **
create procedure verRepartidor(in mail nvarchar(40))
begin
	select nombre, email, tel, horario, foto, valoracion, boleta from repartidor where email = mail;
end; **
delimiter ;

drop procedure if exists sp_APedido;
delimiter **
create procedure sp_APedido(in idclien int, in idplat int, fech date,in hor time,
in preciot float(5,2), in cant int, in lug nvarchar(60), in est int, especif tinytext )
begin
	declare msj nvarchar(60); 
    declare idp int;
    declare exs int;
    declare idestab int;
    set idestab= (select establecimiento from platillo where idplat=idplatillo);
	set idp =(select ifnull(max(idpedido),0) + 1 from pedido);
    
	if est = 1 then
		insert into pedido values(idp,idclien,idplat,idestab,fech, hor,preciot, cant, lug, est, 0, especif);
		set msj = "Producto agregado al carrito";
	else 
		if est = 2 then
			insert into pedido values(idp,idclien,idplat,idestab,fech, hor,preciot, cant, lug, est, 0, especif);
			set msj = "Agregado a favoritos";
		else
			set msj="Estado inválido";
		end if;
	end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists udEstadoPed;
delimiter **
create procedure udEstadoPed(in idclien int, in idestab int, fech date,in hor time,
in preciot float(5,2),  in lug nvarchar(60), in est int)
begin
	declare msj nvarchar(60); 
	if est = 3 then
		update pedido set fecha=fech, hora=hor, preciotot=preciot, lugar=lug, estado=3 
			where cliente= idclien and establecimiento=idestab and fecha=fech and 
				hora=hor and preciotot=preciot and lugar=lug and estado=1;
		set msj = "Pedido confirmado";
	else 
		if est = 4 then
			update pedido set estado=4 where cliente= idclien and establecimiento=idestab and fecha=fech and 
				hora=hor and preciotot=preciot and lugar=lug and estado=3;
			set msj = "Espera de pago";
		else
			if est =5 then
				update pedido set estado=5 where cliente= idclien and establecimiento=idestab and fecha=fech and 
					hora=hor and preciotot=preciot and lugar=lug and (estado=4 or estado =3);
				set msj = "Lista de espera";
            else
				if est = 6 then
					update pedido set estado=6 where cliente= idclien and establecimiento=idestab and fecha=fech and 
						hora=hor and preciotot=preciot and lugar=lug and estado=5;
					set msj = "Entrega en proceso";
				else
					if est = 7 then
						update pedido set estado=7 where cliente= idclien and establecimiento=idestab and fecha=fech and 
							hora=hor and preciotot=preciot and lugar=lug and estado=6;
						set msj = "Entregado";
                    end if;
				end if;
            end if;
		end if;
	end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_CCliente;
delimiter **
create procedure sp_CCliente(in nom nvarchar(60), in bol nvarchar(10), in mail nvarchar(40), in t nvarchar(20), in acont nvarchar(16), in ncont nvarchar(16))
begin
	declare msj nvarchar(60); 
    declare exs int;
	
    set exs = (select count(*) from cliente where email = mail and email != (select email from cliente where boleta = bol));
    
    if exs = 0 then
			if acont = 'sc' and ncont = 'sc' then
				update cliente set nombre = nom, email = mail, tel = t where boleta = bol;
                set msj='Datos actualizados!';
			else
				set exs = (select count(*) from cliente where (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = acont and boleta = bol);
                if exs = 1 then
					update cliente set nombre = nom, email = mail, tel = t, contra = aes_encrypt(ncont, 'huecofriends') where boleta = bol;
					set msj='Datos actualizados';
				else
					set msj ='La contraseña anterior es incorrecta';
				end if;
        end if;
    else
		set msj ='Este correo ya está registrado por otro usuario';
    end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_verPedidos;
delimiter **
create procedure sp_verPedidos(in mail nvarchar(40))
begin	
	declare msj nvarchar(60); 
    declare idc int;
    
    set idc =(select idcliente from cliente where email=mail);
    if idc is null then 
		select idpedido, establecimiento.nombre AS establecimiento, platillo.nombre AS comida, cliente, cantidad, precio, 	
			preciotot as total, fecha, hora, lugar, pedido.calificacion, estpedido.descripcion as estado
				from pedido, estpedido, platillo, establecimiento, cliente where estado = idestado and 
					platillo = idplatillo and cliente=idcliente and pedido.establecimiento = idest 
						and estado = 5;
	else 
		select idpedido, establecimiento.nombre AS establecimiento, platillo.nombre AS comida,  cliente, cantidad, precio, 
        preciotot as total, fecha, hora, lugar, pedido.calificacion, estpedido.descripcion as estado 
        from pedido, estpedido, platillo, establecimiento where estado = idestado and 
        platillo = idplatillo and pedido.establecimiento = idest and cliente=idc and estado != 1 
        and estado != 2;
	end if;
end**
delimiter ;

drop procedure if exists sp_verPedidosR;
delimiter **
create procedure sp_verPedidosR(in comer  nvarchar(60), in fech date,in hor time, in preciot float(5,2), 
									in lug nvarchar(60))
begin	
    declare idc int;
    
    set idc = (select idest from establecimiento where nombre = comer);
	select idpedido, platillo.nombre AS comida, cantidad, precio, pedido.calificacion, estpedido.descripcion as estado
				from pedido, estpedido, platillo where estado = idestado and platillo = idplatillo and 
					pedido.establecimiento = idc and fecha= fech and hora = hor and preciotot=preciot and lugar= lug;
end**
delimiter ;

drop procedure if exists sp_CRepartidor;
delimiter **
create procedure sp_CRepartidor(in nom nvarchar(60), in bol nvarchar(10), in mail nvarchar(40), in t nvarchar(20), in acont nvarchar(16), in ncont nvarchar(16), in hor nvarchar(60))
begin
	declare msj nvarchar(60); 
    declare exs int;
	
    set exs = (select count(*) from repartidor where email = mail and email != (select email from repartidor where boleta = bol));
    
    if exs = 0 then
			if acont = 'sc' and ncont = 'sc' and hor = 'sc' then
				update repartidor set nombre = nom, email = mail, tel = t where boleta = bol;
                set msj='Datos actualizados(excepto contra y horario)';
			else
				if acont = 'sc' and ncont = 'sc' and hor != 'sc' then
					update repartidor set nombre = nom, email = mail, tel = t, horario = hor where boleta = bol;
					set msj='Datos actualizados(excepto contra)';				
				else
					if acont != 'sc' and ncont != 'sc' and hor = 'sc' then
						set exs = (select count(*) from repartidor where (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = acont and boleta = bol);
						if exs = 1 then
							update repartidor set nombre = nom, email = mail, tel = t, contra = aes_encrypt(ncont, 'huecofriends') where boleta = bol;
							set msj='Datos actualizados(excepto horario)';
						else
							set msj ='La contraseña anterior es incorrecta';
						end if;
					else
						set exs = (select count(*) from repartidor where (CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16))) = acont and boleta = bol);
						if exs = 1 then
							update repartidor set nombre = nom, email = mail, tel = t, contra = aes_encrypt(ncont, 'huecofriends'), horario = hor where boleta = bol;
							set msj='Datos actualizados';
						else
							set msj ='La contraseña anterior es incorrecta';
						end if;
					end if;
				end if;
        end if;
    else
		set msj ='Este correo ya está registrado por otro usuario';
    end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_saveIMGcliente;
delimiter **
create procedure sp_saveIMGcliente(in img nvarchar(60), in bol nvarchar(10))
begin
	declare msj nvarchar(60);
	update cliente set foto = img where boleta = bol;
    set msj ='Nombre de imagen cliente guardado';
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_saveIMGrepartidor;
delimiter **
create procedure sp_saveIMGrepartidor(in img nvarchar(60), in bol nvarchar(10))
begin
	declare msj nvarchar(60);
	update repartidor set foto = img where boleta = bol;
    set msj ='Nombre de imagen rep guardado';
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_saveIMGestablecimiento;
delimiter **
create procedure sp_saveIMGestablecimiento(in img nvarchar(60), in id int)
begin
	declare msj nvarchar(60);
	update establecimiento set foto = img where idest = id;
    set msj ='Nombre de imagen est guardado';
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_NombreCbyId;
delimiter **
create procedure sp_NombreCbyId(in id int)
begin

	select nombre, tel, foto from cliente where idcliente = id;
end**
delimiter ;

drop procedure if exists sp_verCarrito;
delimiter **
create procedure sp_verCarrito(in mail nvarchar(40))
begin	
		select idpedido,idplatillo,  platillo.nombre as comida, platillo.precio as precio, fecha,
		establecimiento.nombre, cantidad from pedido, platillo, establecimiento, cliente where 
		platillo = idplatillo and cliente=idcliente and pedido.establecimiento = idest 
		and estado = 1 and cliente.email=mail;
end**
delimiter ;

drop procedure if exists sp_verFavoritos;
delimiter **
create procedure sp_verFavoritos(in mail nvarchar(40))
begin	
		select idpedido,idplatillo, platillo.foto as imagen, platillo.nombre as comida, platillo.precio as precio, fecha,
		establecimiento.nombre from pedido, platillo, establecimiento, cliente where 
		platillo = idplatillo and cliente=idcliente and pedido.establecimiento = idest 
		and estado = 2 and cliente.email=mail;
end**
delimiter ;

drop procedure if exists sp_getIdCliente;
delimiter **
create procedure sp_getIdCliente(in mail nvarchar(40))
begin	
		select idcliente from cliente where email=mail;
end**
delimiter ;

drop procedure if exists verPlatilloById;
delimiter **
create procedure verPlatilloById(in id int)
begin
	select idplatillo, platillo.nombre, valoracion, precio, descripcion, 
    platillo.foto, establecimiento.nombre as lugar from platillo, establecimiento 
    where establecimiento=idest and id=idplatillo;
end; **
delimiter ;

drop procedure if exists verEstByName;
delimiter **
create procedure verEstByName(in nom nvarchar(60))
begin
	select distinct idest from platillo, establecimiento 
    where establecimiento=idest and establecimiento.nombre=nom;
end; **
delimiter ;

drop procedure if exists sp_verEstbySearch;
delimiter **
create procedure sp_verEstbySearch(in cad varchar(40))
begin
    select idest, nombre, email, foto from establecimiento where nombre like CONCAT('%', cad, '%') group by nombre;
end **
delimiter ;

drop procedure if exists sp_verPlatbySearch;
delimiter **
create procedure sp_verPlatbySearch(in cad varchar(40))
begin
    select idplatillo, platillo.nombre, valoracion, precio, descripcion, platillo.foto, establecimiento.nombre as lugar from platillo, establecimiento where establecimiento=idest and platillo.nombre like CONCAT('%', cad, '%') or descripcion like CONCAT('%', cad, '%') group by nombre;
end **
delimiter ;

drop procedure if exists sp_isEmpty;
delimiter **
create procedure sp_isEmpty(in idcliente int)
begin
    declare carrito int;
	declare msj varchar(40);

    set carrito = (select count(*) from pedido where cliente=idcliente and estado = 1);
	if carrito = 0 then
        set msj="Empty";
		select msj as MSJ;
	else
		select establecimiento as MSJ from pedido where cliente=idcliente and estado = 1;
	end if;
end **
delimiter ;

drop procedure if exists sp_isFav;
delimiter **
create procedure sp_isFav(in idcliente int, in idPlatillo int, in idEstablecimiento int)
begin
    declare msj nvarchar(60); 
    declare cant int;
    set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=
    idEstablecimiento
    and estado=2 and especif='Favoritos');

    if cant=0 then
        set msj ="false";
    else
        if cant=1 then
            set msj="true";
        else
            set msj="error";
        end if;
    end if;
    select msj as MSJ;
end; **
delimiter ;

drop procedure if exists sp_deleteFav;
delimiter **
create procedure sp_deleteFav(in idcliente int, in idPlatillo int, in idEstablecimiento int)
begin
    declare msj nvarchar(60); 
    declare cant int;
    set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=idEstablecimiento and estado=2 and especif='Favoritos');
    if cant=1 then
        delete from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=
        idEstablecimiento and estado=2 and especif='Favoritos';

        set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=idEstablecimiento and estado=2 and especif='Favoritos');

        if cant=0 then
            set msj ="Eliminado";
        else
            set msj="No eliminado";
        end if;

    else
        set msj="No fav";
    end if;
	select msj as MSJ;
end; **
delimiter ;

drop procedure if exists sp_deleteCart;
delimiter **
create procedure sp_deleteCart(in idcliente int, in idPlatillo int, in idEstablecimiento int)
begin
    declare msj nvarchar(60); 
    declare cant int;
    set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=idEstablecimiento and estado=1);
    if cant=1 then
        delete from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=
        idEstablecimiento and estado=1;

        set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=idEstablecimiento and estado=1);

        if cant=0 then
            set msj ="Eliminado";
        else
            set msj="No eliminado";
        end if;

    else
        set msj="No cart";
    end if;
	select msj as MSJ;
end; **
delimiter ;

drop procedure if exists sp_ACarrito;
delimiter **
create procedure sp_ACarrito(in idclien int, in idplat int, fech date,in hor time,
in preciot float(5,2), in cant int, in lug nvarchar(60), in est int, especif tinytext )
begin
	declare msj nvarchar(60); 
    declare idp int;
    declare exs int;
    declare idestab int;
    set idestab= (select establecimiento from platillo where idplat=idplatillo);
	set idp =(select ifnull(max(idpedido),0) + 1 from pedido);
    
	if est = 1 then
		insert into pedido values(idp,idclien,idplat,idestab,fech, hor,preciot, cant, lug, est, 0, especif);
		set msj = "Agregado";
        update pedido set fecha=fech, hora=hor, lugar=lug where cliente=idclien and establecimiento=idestab and estado=1;
	else 
			set msj="Estado inválido";
	end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_getEstbyId;
delimiter **
create procedure sp_getEstbyId(in id int)
begin
	select * from establecimiento where idest = id;
end**
delimiter ;

drop procedure if exists sp_isCart;
delimiter **
create procedure sp_isCart(in idcliente int, in idPlatillo int, in idEstablecimiento int)
begin
    declare msj nvarchar(60); 
    declare cant int;
    set cant =(select count(*) from pedido where cliente=idcliente and platillo=idPlatillo and establecimiento=
    idEstablecimiento
    and estado=1);

    if cant=0 then
        set msj ="false";
    else
        if cant=1 then
            set msj="true";
        else
            set msj="error";
        end if;
    end if;
    select msj as MSJ;
end; **
delimiter ;

drop procedure if exists verPlatilloByName;
delimiter **
create procedure verPlatilloByName(in nombree varchar(60))
begin
	select idplatillo, platillo.nombre, valoracion, precio, descripcion, 
    platillo.foto, establecimiento.nombre as lugar from platillo, establecimiento 
    where establecimiento=idest and platillo.nombre=nombree;
end; **
delimiter ;

drop procedure if exists updateEstadoPed;
delimiter **
create procedure updateEstadoPed(in idclien int, in idestab int, fech date,in hor time,
in preciot float(5,2),  in lug nvarchar(60), in est int)
begin
	declare msj nvarchar(60); 
	if est = 3 then
		update pedido set fecha=fech, hora=hor, preciotot=preciot, lugar=lug, estado=3 
			where cliente= idclien and establecimiento=idestab and estado=1;
		set msj = "Pedido confirmado";
	else 
		if est = 4 then
			update pedido set estado=4 where cliente= idclien and establecimiento=idestab and estado=3;
			set msj = "Espera de pago";
		else
			if est =5 then
				update pedido set estado=5 where cliente= idclien and establecimiento=idestab and (estado=4 or estado =3);
				set msj = "Lista de espera";
            else
				if est = 6 then
					update pedido set estado=6 where cliente= idclien and establecimiento=idestab and estado=5;
					set msj = "Entrega en proceso";
				else
					if est = 7 then
						update pedido set estado=7 where cliente= idclien and establecimiento=idestab and estado=6;
						set msj = "Entregado";
                    end if;
				end if;
            end if;
		end if;
	end if;
    select msj as MSJ;
end**
delimiter ;

drop procedure if exists sp_getEspbyId;
delimiter **
create procedure sp_getEspbyId(in idp int)
begin  
	select especif from pedido where idpedido=idp;
end **
delimiter ;

drop procedure if exists sp_asignarPedido;
delimiter **
create procedure sp_asignarPedido(in idp int, in mailR varchar(40))
begin  
	declare idap int;
    declare idR int;
    declare msj int;
    
	set idap = (select ifnull(max(idapedido),0) + 1 from aceptpedido);
    set idR = (select idrepartidor from repartidor where email = mailR);
    insert into aceptpedido values(idap, idR, idp, 0.0);
    set msj = 1;
    
    select msj;
end **
delimiter ;

drop procedure if exists sp_califPedido;
delimiter **
create procedure sp_califPedido(in idp int, in calif float(2,1))
begin  
	update pedido set calificacion = calif where idpedido = idp;
end **
delimiter ;

drop procedure if exists sp_califRepartidor;
delimiter **
create procedure sp_califRepartidor(in idp int, in mail varchar(40), in calif float(2,1))
begin  
	declare idR int;
    
	set idR = (select idrepartidor from repartidor where email = mail);
	update aceptpedido set valrep = calif where pedido = idp and repartidor = idR;
end **
delimiter ;

drop procedure if exists actValoracionP;
delimiter **
create procedure actValoracionP(in idp int)
begin
	declare idpla int;
	declare val float(2,1);
    
    set idpla = (select platillo from pedido where idpedido=idp);
	set val= (select AVG(calificacion) from pedido where platillo = idpla and calificacion!=0);
    if val is not null then
		update platillo set valoracion=val where idplatillo=idpla;
	end if;
end; **
delimiter ;

drop procedure if exists sp_pedidosAcep;
delimiter **
create procedure sp_pedidosAcep(in mail varchar(40))
begin
	select cliente, idpedido,fecha,hora,preciotot as total,cantidad,lugar, pedido.calificacion, 
		estpedido.descripcion as estado, establecimiento.nombre AS establecimiento, platillo.nombre AS comida, 
			precio from pedido, aceptpedido, repartidor, establecimiento, platillo, cliente, estpedido where 
				idestado=estado and cliente.idcliente=cliente and idplatillo=platillo and pedido.establecimiento= idest 
					and idpedido= pedido and idrepartidor=repartidor and repartidor.email=mail;
end; **
delimiter ;

drop procedure if exists sp_pedidosActivos;
delimiter **
create procedure sp_pedidosActivos(in mail varchar(40))
begin
	select cliente, idpedido,fecha,hora,preciotot as total,cantidad,lugar, pedido.calificacion, 
		estpedido.descripcion as estado, establecimiento.nombre AS establecimiento, platillo.nombre AS comida, 
			precio from pedido, aceptpedido, repartidor, establecimiento, platillo, cliente, estpedido where 
				idestado=estado and cliente.idcliente=cliente and idplatillo=platillo and pedido.establecimiento= idest 
					and idpedido= pedido and idrepartidor=repartidor and repartidor.email=mail and estado = 6;
end; **
delimiter ;