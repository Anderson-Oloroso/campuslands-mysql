-- Ejercicio 013 (Intermedio) - tablas puente para catalogo de peliculas de miedo
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


CREATE TABLE peliculs_miedo (
  id_pelicula INT AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  subgenero ENUM('slasher','paranormal','psicologico','monstruos','found_footage') NOT NULL,
  anio_estreno YEAR NOT NULL,
  CONSTRAINT pk_pelicula_miedo PRIMARY KEY (id_pelicula)
);

CREATE TABLE actores_miedo (
  id_actor INT AUTO_INCREMENT,
  nombre_actor VARCHAR(120) NOT NULL,
  pais_origen VARCHAR(80) NOT NULL,
  CONSTRAINT pk_actor_miedo PRIMARY KEY (id_actor)
);

-- Tabla puente: relacion muchos a muchos entre peliculas y actores
CREATE TABLE reparto_pelicula_actor (
  id_pelicula INT NOT NULL,
  id_actor INT NOT NULL,
  personaje VARCHAR(120) NOT NULL,

  CONSTRAINT pk_reparto_pelicula_actor PRIMARY KEY (id_pelicula, id_actor),
  CONSTRAINT fk_int013_reparto_pelicula
    FOREIGN KEY (id_pelicula) REFERENCES peliculs_miedo (id_pelicula),
  CONSTRAINT fk_int013_reparto_actor
    FOREIGN KEY (id_actor) REFERENCES actores_miedo (id_actor)
);
