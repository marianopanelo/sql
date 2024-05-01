-- FUNCIONES
use entregable;
-- puntos q obtiene cada jugador en la semana, sumando si fue o no el jugador del partido
drop function if exists fs_puntos_obtenidos_por_semana_jugador;
delimiter // 
create function fs_puntos_obtenidos_por_semana_jugador(
								  p_id_jugador int
								  )

returns int 
deterministic 
begin

declare v_resultado int;
declare v_puntos_semanales int;
declare v_jugador_de_la_semana ENUM('s', 'n');

select puntos_obtenidos_de_la_semana
into v_puntos_semanales
from jugadores_puntos
where id_jugadores_puntos = p_id_jugador;

select jugador_de_la_semana 
into v_jugador_de_la_semana
from jugadores_puntos
where id_jugadores_puntos = p_id_jugador;

if v_jugador_de_la_semana = 's' then 
set v_resultado =  v_puntos_semanales + 4 ;

 else 
     set v_resultado = v_puntos_semanales;
end if;
 
 
 return v_resultado ;
  end//
  delimiter ;
  
/*select fs_puntos_obtenidos_por_semana_jugador (1) as puntos_De_la_semana; */


-- puntos que obtiene el usuario por el equipo seleccionado 
drop function if exists fs_puntos_de_la_semana_de_un_usuario_por_equipo;
delimiter // 
create function fs_puntos_de_la_semana_de_un_usuario_por_equipo(
								  p_id_usuario int
								  )

returns int
deterministic 
begin

declare v_resultado int;

select sum(jugadores_puntos.puntos_obtenidos_de_la_semana)
into v_resultado
from Jugadores_seleccionados_por_usuario inner join jugadores inner join jugadores_puntos inner join Equipo inner join usuarios
on Jugadores_seleccionados_por_usuario.id_jugador = jugadores.id_jugador
and jugadores.id_jugador = jugadores_puntos.id_jugador 
and Jugadores_seleccionados_por_usuario.id_equipo = Equipo.id_equipo 
and Equipo.id_usuario = usuarios.id_usuario
where usuarios.id_usuario = p_id_usuario;
 
 return v_resultado ;
  end//
  delimiter ;
  
  /*select fs_puntos_de_la_semana_de_un_usuario_por_equipo (5) as puntos_obtenidos_por_semana_usuario; 
  */