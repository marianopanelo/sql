 -- triggers
use entregable;

drop table if  exists LOG_agregar_usuario;
CREATE TABLE IF NOT EXISTS LOG_agregar_usuario 
(
ID_agregar_usuario INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
ID_USUARIO_NUEVO INT ,
USUARIO_QUE_INSERTO VARCHAR(100) ,
FECHA_ADD_USUARIO DATE , 
PRIMARY KEY (ID_agregar_usuario)
);
  
 DROP TRIGGER IF EXISTS TRG_agregar_usuario ;
DELIMITER //
CREATE TRIGGER TRG_agregar_usuario AFTER INSERT ON entregable.usuarios
FOR EACH ROW 
BEGIN

INSERT INTO LOG_agregar_usuario (NOMBRE_DE_ACCION , NOMBRE_TABLA, ID_USUARIO_NUEVO ,USUARIO_QUE_INSERTO, FECHA_ADD_USUARIO)
VALUES ('INSERT' , 'usuarios', NEW.id_usuario , CURRENT_USER() , NOW());

END//
DELIMITER 
/*
SELECT * FROM LOG_agregar_usuario;


SELECT * FROM usuarios;
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO usuarios 
VALUES (25, 'mariano', 'panelo', '123@gmail.com',25,36000000);
*/


drop table if exists LOG_eliminar_usuario;
CREATE TABLE IF NOT EXISTS LOG_eliminar_usuario 
(
ID_eliminar_usuario INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
ID_USUARIO_ELIMINADO INT ,
USUARIO_QUE_ELIMINO VARCHAR(100) ,
FECHA_DELETE_USUARIO DATE , 
PRIMARY KEY (ID_eliminar_usuario)
);

DROP TRIGGER IF EXISTS TRG_eliminar_usuario ;
DELIMITER //

CREATE TRIGGER TRG_eliminar_usuario AFTER DELETE ON entregable.usuarios 
FOR EACH ROW  
BEGIN  
    INSERT INTO LOG_eliminar_usuario (NOMBRE_DE_ACCION , NOMBRE_TABLA, ID_USUARIO_ELIMINADO ,USUARIO_QUE_ELIMINO, FECHA_DELETE_USUARIO) 
    VALUES ('DELETE' , 'usuarios', OLD.id_usuario , CURRENT_USER() , NOW());  
END//

DELIMITER ;
/*
SELECT * FROM LOG_eliminar_usuario;

SELECT * FROM usuarios;
DELETE FROM usuarios 
WHERE id_usuario = 25
*/
-- modificar un equipo 

drop table if exists LOG_modificar_equipo_seleccionado;
CREATE TABLE IF NOT EXISTS LOG_modificar_equipo_seleccionado(
ID_numero_de_modificiaciones INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
ID_jugador_nuevo_jugador_viejo VARCHAR(100),
id_equipo_de_equipo_modificado int ,
usuario_que_modifico_equipo VARCHAR(100) ,
FECHA_DELETE_USUARIO DATE , 
PRIMARY KEY (ID_numero_de_modificiaciones)
);

DROP TRIGGER IF EXISTS TRG_modificar_equipo_seleccionado;
DELIMITER //
CREATE TRIGGER TRG_modificar_equipo_seleccionado AFTER update ON entregable.Jugadores_seleccionados_por_usuario
FOR EACH ROW 
BEGIN

INSERT INTO LOG_modificar_equipo_seleccionado (NOMBRE_DE_ACCION , NOMBRE_TABLA, ID_jugador_nuevo_jugador_viejo , id_equipo_de_equipo_modificado ,usuario_que_modifico_equipo, FECHA_DELETE_USUARIO)
VALUES ('update' , 'Jugadores_seleccionados_por_usuario',concat('id de jugador anterior ', OLD.id_jugador , ' id de jugador nuevo ' ,NEW.id_jugador) , NEW.id_equipo , CURRENT_USER() , NOW());

END//
DELIMITER ;
/*
select * from LOG_modificar_equipo_seleccionado;
select * from Jugadores_seleccionados_por_usuario
WHERE id_equipo = 1 ;
UPDATE Jugadores_seleccionados_por_usuario
SET id_jugador =  11 
WHERE id_jugador = 1
and id_equipo = 1 ;

UPDATE Jugadores_seleccionados_por_usuario
SET id_jugador =  1
WHERE id_jugador = 11
and id_equipo = 1 ; 
*/