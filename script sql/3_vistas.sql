-- VISTAS 
use entregable;
-- equipo_formado_por_usuarios (order by)
drop view if exists vw_equipo_formado_por_usuarios;
create view vw_equipo_formado_por_usuarios as (
select * from Jugadores_seleccionados_por_usuario
order by id_equipo asc);
/*select * from vw_equipo_formado_por_usuarios;*/


-- ver cuantas veces un jugador fue celeccionado en un equipo 
drop view if exists vw_numero_de_veces_seleccionado;
create view vw_numero_de_veces_seleccionado as (
select Jugadores_seleccionados_por_usuario.id_jugador , jugadores_datos.nombre_jugador, jugadores_datos.apellido_jugador , COUNT(*)
from  Jugadores_seleccionados_por_usuario inner join jugadores inner join jugadores_datos 
on Jugadores_seleccionados_por_usuario.id_jugador = jugadores.id_jugador
and jugadores.id_jugador = jugadores_datos.id_jugador
GROUP BY Jugadores_seleccionados_por_usuario.id_jugador , jugadores_datos.nombre_jugador, jugadores_datos.apellido_jugador 
HAVING COUNT(*) > 0
ORDER BY COUNT(*) asc);
/*select * from vw_numero_de_veces_seleccionado;*/


-- equipo_creado_por_jugador
drop view if exists vw_equipo_creado_por_jugador;
create view vw_equipo_creado_por_jugador as (
select usuarios.id_usuario, usuarios.nombre , usuarios.apellido, Jugadores_seleccionados_por_usuario.id_equipo, Jugadores_seleccionados_por_usuario.id_jugador
from Jugadores_seleccionados_por_usuario inner join Equipo inner join usuarios
on Jugadores_seleccionados_por_usuario.id_equipo = Equipo.id_equipo 
and Equipo.id_usuario = usuarios.id_usuario
where usuarios.id_usuario = 3);
/*select * from vw_equipo_creado_por_jugador;*/


-- club_seleccionado_por_jugador
drop view if exists vw_club_seleccionado_por_jugador;
create view vw_club_seleccionado_por_jugador as (
select usuarios.id_usuario, usuarios.nombre , usuarios.apellido, club.nombre_club
from usuarios inner join club
on usuarios.id_usuario = club.id_usuario
where usuarios.id_usuario = 3);
/*select * from vw_club_seleccionado_por_jugador;*/

-- jugadores_seleccionados_por_jugador
drop view if exists vw_jugadores_seleccionados_por_jugador;
create view vw_jugadores_seleccionados_por_jugador as ( 
select usuarios.id_usuario, usuarios.nombre , usuarios.apellido, Jugadores_seleccionados_por_usuario.id_jugador , jugadores_datos.nombre_jugador , jugadores_datos.apellido_jugador
from Jugadores_seleccionados_por_usuario inner join jugadores inner join jugadores_datos inner join Equipo inner join usuarios
on Jugadores_seleccionados_por_usuario.id_jugador = jugadores.id_jugador
and jugadores.id_jugador = jugadores_datos.id_jugador
and Jugadores_seleccionados_por_usuario.id_equipo = Equipo.id_equipo 
and Equipo.id_usuario = usuarios.id_usuario
where usuarios.id_usuario = 5);
/*select * from vw_jugadores_seleccionados_por_jugador;*/

-- puntos_obtenidos_por_semana_por_jugador (sum)
drop view if exists vw_puntos_obtenidos_por_semana_por_jugador;
create view vw_puntos_obtenidos_por_semana_por_jugador as ( 
select sum(jugadores_puntos.puntos_obtenidos_de_la_semana)
from Jugadores_seleccionados_por_usuario inner join jugadores inner join jugadores_puntos inner join Equipo inner join usuarios
on Jugadores_seleccionados_por_usuario.id_jugador = jugadores.id_jugador
and jugadores.id_jugador = jugadores_puntos.id_jugador 
and Jugadores_seleccionados_por_usuario.id_equipo = Equipo.id_equipo 
and Equipo.id_usuario = usuarios.id_usuario
where usuarios.id_usuario = 5);
/*select * from vw_puntos_obtenidos_por_semana_por_jugador;*/

-- primer_jugador_que_contenga_lo (limit)
drop view if exists vw_primer_jugador_que_contenga_lo;
create view vw_primer_jugador_que_contenga_lo as (
select apellido_jugador from jugadores_datos
where jugadores_datos.apellido_jugador like '%lo%' 
limit 1);
/* select * from vw_primer_jugador_que_contenga_lo;*/