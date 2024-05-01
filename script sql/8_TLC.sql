use entregable;

select @@SQL_SAFE_UPDATES; 
select @@FOREIGN_KEY_CHECKS; 
select @@autocommit; 

/* 
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;
set autocommit = 1;
*/
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
set autocommit = 0;

-- eliminar 

START TRANSACTION ;

DELETE FROM jugadores  
WHERE id_jugador in  (14,15,16) ;

select * from jugadores
where id_jugador in  (14,15,16);

select * from jugadores ;

rollback;
 -- commit;
/*
INSERT INTO jugadores (id_jugador, posicion_jugador, categoria, club, numero_que_usa_jugador)
VALUES (14, 'Arquero', 'mayor', 'comunicaciones', 16),
	   (15, 'Arquero', 'mayor', 'comunicaciones', 12),
	   (16, 'Central', 'mayor', 'comunicaciones', 14);
*/
-- final primera parte

-- agregar 

START TRANSACTION ;
select * from usuarios ;
INSERT INTO usuarios (id_usuario, nombre, apellido, email, edad, dni)
VALUES (16, 'Marcelo', 'González', 'marcelo.gonzalez@example.com', 28, 36000003),
       (17, 'Juanita', 'Martínez', 'juanita.m@example.com', 28, 12345681),
       (18, 'Manuela', 'Fernández', 'manuela.f@example.com', 33, 23456792),
       (19, 'José María', 'Sánchez', 'josem@example.com', 38, 34567893);
SAVEPOINT SP1;
INSERT INTO usuarios (id_usuario, nombre, apellido, email, edad, dni)
value (20, 'Anabel', 'García', 'anabel.g@example.com', 31, 45678904),
      (21, 'Diana', 'Pérez', 'diana.p@example.com', 35, 56789015),
      (22, 'Lucía', 'Martín', 'lucia.m@example.com', 30, 67890126),
      (23, 'Carlos Alberto', 'Rodríguez', 'carlosa.r@example.com', 32, 78901237);
SAVEPOINT SP2;

select * from usuarios ;
select * from usuarios_puntos ;

INSERT INTO usuarios_puntos (id_usuarios_puntos, puntos_de_la_semana, token, id_usuario)
VALUES (16,0,1600,1),
       (17,0,1600,2),
	   (18,0,1600,3),
       (19,0,1600,4);
SAVEPOINT SP3;

INSERT INTO usuarios_puntos (id_usuarios_puntos, puntos_de_la_semana, token, id_usuario)
VALUES (20,0,1600,5),
       (21,0,1600,6),
       (22,0,1600,7),
       (23,0,1600,8);

select * from usuarios_puntos ;

release savepoint SP3;
rollback to savepoint SP3;
select * from usuarios_puntos ;
rollback to savepoint SP2;
select * from usuarios_puntos ;
rollback;
select * from usuarios ;
select * from usuarios_puntos ;
-- commit;