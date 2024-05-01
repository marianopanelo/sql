drop schema if exists entregable;   
create schema if not exists entregable;    
use entregable;

 
-- drop table usuarios;
create table if not exists usuarios(        
    id_usuario int not null auto_increment , 
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    email varchar(30) not null,
    edad int not null,
    dni int not null,
    puntos_de_la_semana int default 0,
    token int DEFAULT 1600,
    constraint pk_usuarios PRIMARY KEY (id_usuario)
);


-- drop table jugadores;
create table if not exists jugadores(        
    id_jugador int not null auto_increment, 
    posicion_jugador varchar(20),
	categoria varchar(15),
    club varchar(30),
    numero_que_usa_jugador int not null,
    constraint pk_jugadores PRIMARY KEY (id_jugador)
);

-- drop table jugadores_puntos;
create table if not exists jugadores_puntos(        
    id_jugadores_puntos int not null auto_increment, 
    precio int not null,
    puntos_obtenidos_de_la_semana int,
    jugador_de_la_semana ENUM('s', 'n') NOT NULL,
	id_jugador int not null, 
    constraint pk_jugadores_puntos PRIMARY KEY (id_jugadores_puntos),
    CONSTRAINT fk_jugadores_puntos_jugadores FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador)
);

-- drop table jugadores_datos;
create table if not exists jugadores_datos(        
    id_jugadores_datos int not null auto_increment, 
    nombre_jugador varchar(20),
	apellido_jugador varchar(20),
    sexo varchar(15),
	id_jugador int not null, 
    constraint pk_jugadores_datos PRIMARY KEY (id_jugadores_datos),
	CONSTRAINT fk_jugadores_datos_jugadores FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador)
);

-- drop table club;
create table if not exists club(        
    id_club int not null auto_increment , 
	nombre_club varchar(35),
    resultado_club ENUM('W', 'P', 'N') NOT NULL, 
    id_usuario INT, 
    constraint pk_club PRIMARY KEY (id_club),
	CONSTRAINT fk_club_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- drop table tabla;
CREATE TABLE IF NOT EXISTS tabla(
    id_tabla INT not null, 
    id_usuario INT, 
    puntos_totales INT,
    puntos_de_la_semana INT,
    CONSTRAINT pk_tabla PRIMARY KEY (id_tabla),
    CONSTRAINT fk_tabla_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- drop table Equipo;
CREATE TABLE IF NOT EXISTS Equipo (
    id_equipo INT not null AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    CONSTRAINT pk_equipo PRIMARY KEY (id_equipo),
    CONSTRAINT fk_equipo_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- drop table Jugadores_seleccionados_por_usuario;
CREATE TABLE IF NOT EXISTS Jugadores_seleccionados_por_usuario (
    id_equipo INT not null,
    id_jugador INT not null,
    PRIMARY KEY (id_equipo, id_jugador),
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);