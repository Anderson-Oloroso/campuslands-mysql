CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_actor;
DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_pelicula_puntaje
        CHECK (puntaje >= 0 AND puntaje <= 10)
);

CREATE TABLE actores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pelicula_actor (
    pelicula_id INT NOT NULL,
    actor_id INT NOT NULL,

    PRIMARY KEY (pelicula_id, actor_id),

    CONSTRAINT fk_pelicula_actor_pelicula
        FOREIGN KEY (pelicula_id)
        REFERENCES peliculas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_pelicula_actor_actor
        FOREIGN KEY (actor_id)
        REFERENCES actores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

