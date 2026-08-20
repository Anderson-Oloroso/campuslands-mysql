DROP DATABASE IF EXISTS ejercicio_11_int;
CREATE DATABASE ejercicio_11_int;
USE ejercicio_11_int;


CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    edad INT NOT NULL,
    ranking INT NOT NULL,
    CHECK (edad >= 16),
    CHECK (ranking > 0)
);

CREATE TABLE torneos (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    premio DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    CHECK (premio > 0)
);

CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    id_torneo INT NOT NULL,
    jugador_a INT NOT NULL,
    jugador_b INT NOT NULL,
    puntos_jugador_a INT NOT NULL,
    puntos_jugador_b INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    
    CHECK (jugador_a <> jugador_b),
    CHECK (puntos_jugador_a >= 0),
    CHECK (puntos_jugador_b >= 0),
    CHECK (estado IN ('Programado', 'Finalizado', 'Cancelado')),
    
    FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo),
    FOREIGN KEY (jugador_a) REFERENCES jugadores(id_jugador),
    FOREIGN KEY (jugador_b) REFERENCES jugadores(id_jugador)
);

