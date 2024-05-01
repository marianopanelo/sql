-- creacion de usuarios para modificar algun schema y darle poderes
use mysql;
select * from user;

-- crear usuarios
create user 'usuario1'@'localhost' identified by '321' ;
create user 'usuario2'@'localhost' identified by '123' ;

-- el usuario uno solo tiene permisos de lectura en el esquema entregable
grant select on entregable.* to 'usuario1'@'localhost';

-- el usuario 2 tiene permiso de lectura insercion y modificacion en el esquema entregable
grant select , update , insert on entregable.* to 'usuario2'@'localhost';