use escomodo;

insert into estpedido values(1,"Carrito");
insert into estpedido values(2,"Favoritos");
insert into estpedido values(3,"Confirmado");
insert into estpedido values(4,"Espera de pago");
insert into estpedido values(5,"Lista de espera");
insert into estpedido values(6,"Entrega en proceso");
insert into estpedido values(7,"Entregado");
insert into estpedido values(8,"Entregado y calificado");

call sp_ACliente('Diego Colón','2015370179', 'diegoCV@crayds.com', '5556573075', '1234', 'default.png');
call sp_ACliente('Yax Vázquez','2015090790', 'yoxVH1@crayds.com', '5551893204', '1234', 'default.png');
call sp_ACliente('Chris Osornio','2015370234', 'chrisOs@crayds.com', '5534907824', '1234', 'default.png');
call sp_ACliente('Rafita Barajas','2015370987', 'rafaB@crayds.com', '5523450934', '1234', 'default.png');
call sp_ACliente('Isaac Sánchez','2015370743', 'izakS@crayds.com', '5512349021', '1234', 'default.png');
select * from cliente;

call sp_ARepartidor('Juan Pérez','2014030245', 'johnyPP@gmail.com', '5519378923', 'L8:00-10:30W10:30-12:00J8:00-10:30', '1234', 'default.png');
call sp_ARepartidor('Luis Jimenez','2018010293', 'luisSJ@hotmail.com', '5519382730', 'M1:30-4:00J3:00-4:30V2:30-4:00', '1234', 'default.png');
call sp_ARepartidor('Nayla Jones','2013092123', 'naynay@gmail.com', '5523459567', 'L8:00-10:30M10:00-1:30W10:30-12:00J8:00-10:30', '1234', 'default.png');
call sp_ARepartidor('Fernanda Martinez','2015203239', 'fermata@gmail.com', '550123948', 'L1:30-3:00M1:30-3:00W1:30-3:00J1:30-3:00V1:30-3:00', '1234', 'default.png');
call sp_ARepartidor('Yuki Chan','2016030234', 'y-chan@hotmail.com', '5501284392', 'L8:00-10:30M10:00-11:00W8:00-10:30J8:00-10:30V10:00-11:00', '1234', 'default.png');
select * from repartidor;

call sp_AEstablecimiento('Tamales Doña Pelos','Eje Central Lázaro Cárdenas 296, Nueva Industrial Vallejo, 07700 Ciudad de México, CDMX','Señora Pelos', 'tamalesP@hotmail.com', '(55)58789234', 'L_V7:00-11:00', '12345', 'defaultN.png');
call sp_AEstablecimiento('Tiendita','Av. Juan de Dios Bátiz S/N, Nueva Industrial Vallejo, 07738 Ciudad de México, CDMX','Jorge Lopez', 'tendi@gmail.com', '54679283', 'L_V8:00-20:00', '12345', 'defaultN.png');
call sp_AEstablecimiento('Tortas Cornelio','Eje Central Lázaro Cárdenas 551, Nueva Industrial Vallejo, 07700 Ciudad de México, CDMX','Señor Cornelio Corn', 'tortasCorn@gmail.com', '5567982354', 'L_V9:00-20:00', '12345', 'defaultN.png');
call sp_AEstablecimiento('Ensaladas Ensaladorium','Av. Juan de Dios Bátiz Nueva Industrial Vallejo 07700 Ciudad de México, CDMX','Nathasha Salad', 'ensaladorium@gmail.com', '554678932', 'L_V10:00-17:00', '12345', 'defaultN.png');
call sp_AEstablecimiento('Jugos y licuados Freskesitos','María Luisa Estampa Ortigoza 7160, Nueva Industrial Vallejo, 07700 Ciudad de México, CDMX','Larry Fresko', 'freskJL@gmail.com', '53789044', 'L_V6:30-3:00', '12345', 'defaultN.png');
select * from establecimiento;

call sp_APlatillo('Tamal', 11.50, 'Tamal solo de varios sabores', 'p1.png', 'tamalesP@hotmail.com');
call sp_APlatillo('Torta de tamal', 13.50, 'Tamal con bolillo', 'p1.png', 'tamalesP@hotmail.com');
call sp_APlatillo('Atole', 11.00, 'atole de chocolate', 'p1.png', 'tamalesP@hotmail.com');
call sp_APlatillo('Sincronizada', 15.00, 'Sincronizada de jamon y queso', 'p1.png', 'tendi@gmail.com');
call sp_APlatillo('Agua 1lt.', 10.00, 'Bonafont o ciel', 'p1.png', 'tendi@gmail.com');
call sp_APlatillo('Torta de webo', 18.00, 'webito', 'p1.png', 'tortasCorn@gmail.com');
call sp_APlatillo('Torta de salchicha', 20.00, 'Torta regular acompañada con queso', 'p1.png', 'tortasCorn@gmail.com');
call sp_APlatillo('Ensalada vergetariana', 25.00, 'Ensalada con espinacas, aguacate, pepino, tomate mediano, pimiento verde italiano, jengibre en polvo, soya', 'p1.png', 'ensaladorium@gmail.com');
call sp_APlatillo('Ensalada de pollo', 32.00, 'Ensalada básica (lechuga, tomates, espinaca, pepino, zanahoria) acompañada con pollo', 'p1.png', 'ensaladorium@gmail.com');
call sp_APlatillo('Licuado sabores', 20.00, 'Fresa, Guayaba, Avena, Chocolate', 'p1.png', 'freskJL@gmail.com');
call sp_APlatillo('Jugo naranja', 25.00, '1 litro de jugo de naranja', 'p1.png', 'freskJL@gmail.com');
call sp_APlatillo('Vaso manguito tropical', 15.00, 'Vaso mediano de mango', 'p1.png', 'freskJL@gmail.com');
select * from platillo;

#PEDIDOS INDIVIDUALES PARA UPDATEAR A HISTORIAL
call sp_APedido(1, 3,"2019-05-10", "09:30:00",  20 , 1, "Salon 1112", 1, " ");
call sp_APedido(1, 6, "2019-05-12", "13:05:00", 50, 2, "Salon 1013", 1, "Sin chile :b");
call sp_APedido(2, 8, "2019-05-14", "16:20:00", 40, 1, "En las astas", 1, "Sin awacate");
call sp_APedido(3, 12, "2019-05-15", "10:30:00", 27, 1, "Salon 2209", 1, "Con muxo limón");
call sp_APedido(4, 2, "2019-05-17", "10:15:00", 20, 1, "Salon 1104", 1, "Tamal de dulce");
call sp_APedido(4, 7, "2019-05-19", "09:25:00", 20, 1, "Salon 1113", 1, " ");
call sp_APedido(5, 7, "2019-05-19", "13:45:00", 50, 2, "Sala 14", 1, "Sin cebolla");
call sp_APedido(5, 4, "2019-05-20", "14:30:00", 30, 1, "Pasillo biblioteca", 1, "Con salsa");
#PEDIDOS GRUPALES PARA UPDATEAR A HISTORIAL
call sp_APedido(1, 11, "2019-05-13", "12:15:00", 70, 1, "Cafeteria", 1, "Sin popote xfas");
call sp_APedido(1, 12, "2019-05-13", "12:15:00", 70, 1, "Cafeteria", 1, " ");
call sp_APedido(1, 10, "2019-05-13", "12:15:00", 70, 1, "Cafeteria", 1, "Licuado fresa sin popote xfas");
call sp_APedido(5, 9, "2019-05-21", "13:30:00", 70, 1, "Frente a las canchas", 1, "Sin aderezo");
call sp_APedido(5, 8, "2019-05-21", "13:30:00", 70, 1, "Frente a las canchas", 1, "Sin pepino");

select CAST(AES_DECRYPT(contra, 'huecofriends') AS char(16)) end_data from repartidor;

call sp_Login('diegoCV@crayds.com', '1234');

call sp_getEstbyMail('tortasCorn@gmail.com');

call verPlatillo();

call verEstablecimiento();

call verPlatillobyMail("tamalesP@hotmail.com");

call udEstadoPed(1,1, "2019-05-10", "9:30:00", 20,"Salon 1112", 3);
call udEstadoPed(1,3, "2019-05-12", "13:05:00", 50, "Salon 1013", 3);
call udEstadoPed(2,4, "2019-05-14", "16:20:00", 40, "En las astas", 3);
call udEstadoPed(3,5, "2019-05-15", "10:30:00", 27, "Salon 2209", 3);
call udEstadoPed(4,1, "2019-05-17", "10:15:00", 20, "Salon 1104", 3);
call udEstadoPed(4,3, "2019-05-19", "09:25:00", 20, "Salon 1113", 3);
call udEstadoPed(5,3, "2019-05-19", "13:45:00", 50, "Sala 14", 3);
call udEstadoPed(5,2, "2019-05-20", "14:30:00", 30, "Pasillo biblioteca", 3);
call udEstadoPed(1,5,"2019-05-13", "12:15:00", 70, "Cafeteria", 3);
call udEstadoPed(5,4, "2019-05-21", "13:30:00", 70, "Frente a las canchas", 3);

call udEstadoPed(1,1, "2019-05-10", "9:30:00", 20,"Salon 1112", 5);
call udEstadoPed(1,3, "2019-05-12", "13:05:00", 50, "Salon 1013", 5);
call udEstadoPed(2,4, "2019-05-14", "16:20:00", 40, "En las astas", 5);
call udEstadoPed(3,5, "2019-05-15", "10:30:00", 27, "Salon 2209", 5);
call udEstadoPed(4,1, "2019-05-17", "10:15:00", 20, "Salon 1104", 5);
call udEstadoPed(4,3, "2019-05-19", "09:25:00", 20, "Salon 1113", 5);
call udEstadoPed(5,3, "2019-05-19", "13:45:00", 50, "Sala 14", 5);
call udEstadoPed(5,2, "2019-05-20", "14:30:00", 30, "Pasillo biblioteca", 5);
call udEstadoPed(1,5,"2019-05-13", "12:15:00", 70, "Cafeteria", 5);
call udEstadoPed(5,4, "2019-05-21", "13:30:00", 70, "Frente a las canchas", 5);

call udEstadoPed(1,1, "2019-05-10", "9:30:00", 20,"Salon 1112", 6);
call udEstadoPed(1,3, "2019-05-12", "13:05:00", 50, "Salon 1013", 6);
call udEstadoPed(3,5, "2019-05-15", "10:30:00", 27, "Salon 2209", 6);
call udEstadoPed(4,1, "2019-05-17", "10:15:00", 20, "Salon 1104", 6);
call udEstadoPed(5,2, "2019-05-20", "14:30:00", 30, "Pasillo biblioteca", 6);
call udEstadoPed(5,4, "2019-05-21", "13:30:00", 70, "Frente a las canchas", 6);

call udEstadoPed(1,1, "2019-05-10", "9:30:00", 20,"Salon 1112", 7);
call udEstadoPed(1,3, "2019-05-12", "13:05:00", 50, "Salon 1013", 7);
call udEstadoPed(4,1, "2019-05-17", "10:15:00", 20, "Salon 1104", 7);
call udEstadoPed(5,4, "2019-05-21", "13:30:00", 70, "Frente a las canchas", 7);

#PEDIDOS INDIVIDUALES PARA EL CARRRITO
call sp_APedido(1, 1, "2019-05-15", "17:20:00", 11.5, 1, " ", 1, " ");
call sp_APedido(5, 5, "2019-05-16", "08:30:00", 10, 1, " ", 1, " ");
#PEDIDOS GRUPALES PARA EL CARRRITO
call sp_APedido(2, 10, "2019-05-14", "10:20:00", 20, 1, " ", 1, " ");
call sp_APedido(2, 11, "2019-05-14", "10:25:00", 25, 1, " ", 1, " ");
call sp_APedido(3, 1, "2019-05-16", "09:25:00", 11.5, 1, " ", 1, " ");
call sp_APedido(3, 3, "2019-05-16", "09:40:00", 11, 1, " ", 1, " ");
call sp_APedido(4, 5, "2019-05-19", "18:00:00", 15, 1, " ", 1, " ");
call sp_APedido(4, 4, "2019-05-19", "18:05:00", 10, 1, " ", 1, " ");

insert into aceptpedido values(1, 1, 1, 4.0);
insert into aceptpedido values(2, 1, 2, 4.5);
insert into aceptpedido values(3, 2, 4, 0);
insert into aceptpedido values(4, 3, 5, 4.5);
insert into aceptpedido values(5, 4, 8, 0);
insert into aceptpedido values(6, 5, 12, 5.0);
insert into aceptpedido values(7, 5, 13, 4.5);

call actValoracion(1); 
call actValoracion(2); 
call actValoracion(3);
call actValoracion(4);
call actValoracion(5);

call verRepartidor("y-chan@hotmail.com");
#Para usuario
call sp_verPedidos("diegoCV@crayds.com");
#Para repartidor
call sp_verPedidos("y-chan@hotmail.com");

select * from pedido;

call sp_verPedidosR('Tamales Doña Pelos', '2019-05-10','09:30:00', 20.00, 'salon 1112');
call sp_verPedidosR('Jugos y licuados Freskesitos', '2019-05-13','12:15:00', 70.00, 'Cafeteria');