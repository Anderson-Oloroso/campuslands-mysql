-- Campuslands MySQL - Avanzado Ejercicio 057
-- Window Functions para Videojuego de Acción y Aventura

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva de tablas
DROP TABLE IF EXISTS puntuaciones_niveles;
DROP TABLE IF EXISTS niveles_mapa;
DROP TABLE IF EXISTS exploradores;

-- 1. Tabla: Exploradores / Jugadores
CREATE TABLE exploradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(50) UNIQUE NOT NULL,
    plataforma ENUM('PC', 'PlayStation', 'Xbox', 'Switch') NOT NULL,
    nivel_experiencia INT NOT NULL DEFAULT 1,
    estado ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_exp_explorador CHECK (nivel_experiencia >= 1)
) ENGINE=InnoDB;

-- 2. Tabla: Niveles / Regiones del Mapa
CREATE TABLE niveles_mapa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_region VARCHAR(100) NOT NULL,
    region_tipo ENUM('Ruinas', 'Cueva', 'Templo', 'Fortaleza', 'Bosque') NOT NULL,
    dificultad INT NOT NULL DEFAULT 1,
    puntuacion_par_objetivo INT NOT NULL,
    CONSTRAINT chk_dificultad CHECK (dificultad BETWEEN 1 AND 10),
    CONSTRAINT chk_par CHECK (puntuacion_par_objetivo > 0)
) ENGINE=InnoDB;

-- 3. Tabla: Registro de Puntuaciones y Desempeño en Niveles
CREATE TABLE puntuaciones_niveles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    explorador_id INT NOT NULL,
    nivel_id INT NOT NULL,
    puntos_obtenidos INT NOT NULL,
    tiempo_segundos INT NOT NULL,
    tesoros_encontrados INT NOT NULL DEFAULT 0,
    muertes_registradas INT NOT NULL DEFAULT 0,
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (explorador_id) REFERENCES exploradores(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nivel_id) REFERENCES niveles_mapa(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_puntos CHECK (puntos_obtenidos >= 0),
    CONSTRAINT chk_tiempo_juego CHECK (tiempo_segundos > 0)
) ENGINE=InnoDB;