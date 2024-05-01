 -- procedimientos

 use entregable;


drop procedure if exists sp_puntos_De_equipo ;
delimiter // 
 create procedure sp_puntos_De_equipo ( in p_id_jugador int
                                        )
begin 

select Jugadores_seleccionados_por_usuario.id_equipo , Jugadores_seleccionados_por_usuario.id_jugador, jugadores_puntos.puntos_obtenidos_de_la_semana
from Jugadores_seleccionados_por_usuario inner join equipo inner join jugadores inner join jugadores_puntos
on Jugadores_seleccionados_por_usuario.id_jugador = jugadores.id_jugador
and Jugadores_seleccionados_por_usuario.id_equipo = equipo.id_equipo
and jugadores.id_jugador = jugadores_puntos.id_jugador
 where equipo.id_usuario = p_id_jugador;

end//
delimiter ;    

/*CALL sp_puntos_De_equipo (2);*/



drop procedure if exists sp_suma_puntos_jugador ;
delimiter // 
 create procedure sp_suma_puntos_jugador ( in p_id_jugador int,
										   in p_puntos_sumados int,
										   OUT p_puntos_anteriores INT,
                                           out p_puntos_actualizados int,
                                           out p_nombre_jugador varchar(20),
                                           out p_apellido_jugador varchar(20),
                                           out p_id_jugador_modificado int
                                        )
begin 

SELECT puntos_obtenidos_de_la_semana INTO p_puntos_anteriores
fROM jugadores_puntos
WHERE id_jugador = p_id_jugador;

UPDATE jugadores_puntos
SET puntos_obtenidos_de_la_semana = p_puntos_anteriores + p_puntos_sumados
WHERE id_jugador = p_id_jugador;

SELECT jugadores_puntos.puntos_obtenidos_de_la_semana,
           jugadores_datos.nombre_jugador,
           jugadores_datos.apellido_jugador
    INTO p_puntos_actualizados,
         p_nombre_jugador,
         p_apellido_jugador
    FROM jugadores_puntos
    INNER JOIN jugadores ON jugadores_puntos.id_jugador = jugadores.id_jugador
    INNER JOIN jugadores_datos ON jugadores.id_jugador = jugadores_datos.id_jugador
    WHERE jugadores_puntos.id_jugador = p_id_jugador;
 
select p_puntos_anteriores;
set  p_id_jugador_modificado = p_id_jugador;
select p_id_jugador_modificado;
end//
delimiter ;    

/*CALL sp_suma_puntos_jugador(2, 10, @p_puntos_anteriores, @p_puntos_actualizados, @p_nombre_jugador, @p_apellido_jugador, @p_id_jugador_modificado);
SELECT @p_puntos_anteriores, @p_puntos_actualizados, @p_nombre_jugador, @p_apellido_jugador, @p_id_jugador_modificado;
select * from jugadores_puntos;
*/
/* 
dejo esto aca para que cuando lo modifique sepa si se modifico y volver a tener los datos anteriores
select puntos_obtenidos_de_la_semana from jugadores_puntos 
where id_jugador = 2;

update jugadores_puntos set puntos_obtenidos_de_la_semana = 8
where id_jugador = 2;*/


-- agregar o eliminar un jugador
drop procedure if exists sp_agregar_o_eliminar_jugador_tabla_jugadores ;
delimiter // 
 create procedure sp_agregar_o_eliminar_jugador_tabla_jugadores (IN p_id_jugador int,
																IN p_posicion_jugador VARCHAR(20),
																IN p_categoria VARCHAR(20),
																IN p_club VARCHAR(20),
																IN p_numero_que_usa_jugador VARCHAR(20),
																IN p_INSERT_DELETE VARCHAR(20),
																OUT p_salida VARCHAR(250)
																)
begin 
IF p_INSERT_DELETE = 'INSERT' THEN 
	INSERT INTO jugadores (posicion_jugador, categoria, club, numero_que_usa_jugador)
    VALUES (p_posicion_jugador, p_categoria, p_club, p_numero_que_usa_jugador);
        
	SET p_salida = 'Jugador insertado correctamente.';
    ELSEIF p_INSERT_DELETE = 'DELETE' THEN 
        DELETE FROM jugadores
        WHERE id_jugador = p_id_jugador;
        SET p_salida = 'Jugador eliminado correctamente.';
    ELSE
        SET p_salida = 'Operación no válida. Debe ser "INSERT" o "DELETE".';
    END IF;
	end//
delimiter ; 

/*
select * from jugadores;
-- para agregar tenes q poner null al principio
CALL sp_agregar_o_eliminar_jugador_tabla_jugadores (null,'extremo','mayor','comu','60','INSERT',@p_salida);
SELECT @p_salida;
-- para eliminar tenes q dejar los campos con ''
CALL sp_agregar_o_eliminar_jugador_tabla_jugadores (19,'','','','','DELETE',@p_salida);
SELECT @p_salida;
*/



drop procedure if exists sp_ordenar_tabla_tabla ;
delimiter // 
 create procedure sp_ordenar_tabla_tabla (IN p_tabla VARCHAR(20),
										  IN p_asc_dec VARCHAR(20),
										  OUT p_salida VARCHAR(250)
                                          )
                                          
BEGIN
    DECLARE tabla_valida INT DEFAULT 0;
    
    IF p_tabla = 'id_tabla' OR p_tabla = 'id_usuario' OR p_tabla = 'puntos_totales' OR p_tabla = 'puntos_de_la_semana' THEN 
        SET tabla_valida = 1;
    END IF;
    
    IF tabla_valida = 1 THEN
        SET @p_salida = CONCAT(
            'SELECT id_tabla, id_usuario, puntos_totales, puntos_de_la_semana
             FROM tabla 
             ORDER BY ', p_tabla, ' ', p_asc_dec
        );
        
        PREPARE EJECUCION FROM @p_salida;  
        EXECUTE EJECUCION;  
        DEALLOCATE PREPARE EJECUCION; 
    ELSE
        SET p_salida = 'Tabla no válida, campo no encontrado';
    END IF;
	end//
delimiter ; 

/*CALL sp_ordenar_tabla_tabla ('id_usuario','desc',@p_salida);
SELECT @p_salida;*/