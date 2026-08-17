-- DDL: Creación de la estructura en 3FN para Fútbol Sala
CREATE DATABASE IF NOT EXISTS futbol_sala_db;
USE futbol_sala_db;

-- Tabla 1: Equipos
CREATE TABLE IF NOT EXISTS equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

-- Tabla 2: Jugadores (Relacionada con equipos - 3FN)
CREATE TABLE IF NOT EXISTS jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(60) NOT NULL,
    posicion VARCHAR(25) NOT NULL, -- Ej: Cierre, Ala, Pívot, Portero
    dorsal INT NOT NULL,
    id_equipo INT NOT NULL,
    estado VARCHAR(15) DEFAULT 'Activo', -- Validación de estado
    CONSTRAINT fk_jugador_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

-- Tabla 3: Estadísticas de Partidos (Para métricas, cálculos y rankings)
CREATE TABLE IF NOT EXISTS estadisticas_partido (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    goles_anotados INT DEFAULT 0,
    asistencias INT DEFAULT 0,
    tarjetas_amarillas INT DEFAULT 0,
    tarjetas_rojas INT DEFAULT 0,
    calificacion_partido DECIMAL(3,1) NOT NULL, -- Puntaje de rendimiento con decimales
    fecha_partido DATE NOT NULL,
    CONSTRAINT fk_est_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador)
);