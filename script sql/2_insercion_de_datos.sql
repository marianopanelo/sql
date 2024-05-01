use entregable;
INSERT INTO usuarios 
VALUES (1, 'mariano', 'panelo', '123@gmail.com', 25, 36000000, 0, 1600),
	   (2, 'Juan', 'Pérez', 'juanperez@example.com', 25, 012345678, 0, 1600),
	   (3, 'María', 'García', 'mariag@example.com', 30, 023456789, 0, 1600),
	   (4, 'José', 'Rodríguez', 'jose@example.com', 35, 034567890, 0, 1600),
	   (5, 'Ana', 'Martínez', 'ana@example.com', 28, 045678901, 0, 1600),
	   (6, 'David', 'López', 'david@example.com', 32, 056789012, 0, 1600),
	   (7, 'Laura', 'Sánchez', 'laura@example.com', 27, 067890123, 0, 1600),
	   (8, 'Carlos', 'González', 'carlos@example.com', 29, 078901234, 0, 1600),
	   (9, 'Marta', 'Díaz', 'marta@example.com', 33, 089012345, 0, 1600),
	   (10, 'Pablo', 'Ruiz', 'pablo@example.com', 31, 090123456, 0, 1600),
	   (11, 'Isabel', 'Fernández', 'isabel@example.com', 26, 012345678, 0, 1600),
	   (12, 'Sergio', 'Jiménez', 'sergio@example.com', 34, 023456789, 0, 1600),
	   (13, 'Cristina', 'Pérez', 'cristina@example.com', 29, 034567890, 0, 1600),
	   (14, 'Manuel', 'García', 'manuel@example.com', 36, 045678901, 0, 1600),
	   (15, 'Elena', 'López', 'elena@example.com', 30, 056789012, 0, 1600);
       
select * from usuarios;

   
select * from jugadores;

select * from jugadores_puntos;

select * from jugadores_datos;

select * from Jugadores_seleccionados_por_usuario;

INSERT INTO club 
VALUES (1, 'comunicaciones','N',6),
       (2, 'River Plate', 'N',8),
	   (3, 'Ferrocarril Oeste', 'N',7),
	   (4, 'SAG Ballester', 'N',9),
	   (5, 'CID Moreno', 'N',5),
	   (6, 'Social San Martín', 'N',2),
	   (7, 'Ward', 'N',4),
	   (8, 'Biblioteca Bell', 'N',3),
	   (9, 'Dorrego', 'N',1),
	   (10, 'Lanús', 'N',14),
	   (11, 'Campana Boat', 'N',13),
	   (12, 'Social Echagüe', 'N',15),
	   (13, 'Biblioteca Rivadavia', 'N',11),
	   (14, 'Villa Modelo', 'N',12),
	   (15, 'Huracán', 'N',10);

select * from club;

INSERT INTO tabla 
VALUES (1, 1, 0, 0),
	   (2, 2, 0, 0),
	   (3, 3, 0, 0),
	   (4, 4, 0, 0),
	   (5, 5, 0, 0),
	   (6, 6, 0, 0),
	   (7, 7, 0, 0),
	   (8, 8, 0, 0),
	   (9, 9, 0, 0),
	   (10, 10, 0, 0),
	   (11, 11, 0, 0),
	   (12, 12, 0, 0),
	   (13, 13, 0, 0),
	   (14, 14, 0, 0),
	   (15, 15, 0, 0);

select * from tabla;
 
INSERT INTO Equipo 
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10),
	   (11, 11),
	   (12, 12),
	   (13, 13),
	   (14, 14),
	   (15, 15);
select * from Equipo;